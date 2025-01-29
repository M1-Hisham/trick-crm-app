import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';

import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/leads/lead-view/update-note/data/models/update_lead_note_model.dart';
import 'package:trick_crm_app/features/leads/lead-view/update-note/data/models/update_lead_note_request_body.dart';

import '../../logic/cubit/update_note_cubit.dart';
import '../../logic/cubit/update_note_state.dart';

class UpdateNote extends StatelessWidget {
  final int leadId;
  final int noteId;
  UpdateNote(
      {super.key, required this.leadId, required this.noteId, this.note});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final String? note;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<UpdateNoteCubit>(),
      child: BlocBuilder<UpdateNoteCubit, UpdateNoteState>(
          builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (updateLeadNoteModel) {
            log('Update Note: $updateLeadNoteModel');
            final UpdateLeadNoteModel noteModel = updateLeadNoteModel;
            return Column(
              children: [
                const Text('Update Note'),
                Form(
                  key: _formKey,
                  child: AppTextFormField(
                    controller: TextEditingController(
                        text: '${noteModel.note!.comment}'),
                    hintText: 'Update Note',
                    onSaved: (value) {
                      note = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty && noteModel.note!.comment != value) {
                        return 'Please enter a update note';
                      }
                      return null;
                    },
                  ),
                ),
                Text('${noteModel.message}'),
                AppButton(
                  text: 'Update Note',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      log('Update Note: $note');
                      getIt<UpdateNoteCubit>().updateNote(
                        leadId,
                        noteId,
                        UpdateLeadNoteRequestBody(comment: '$note'),
                      );
                    }
                  },
                ),
              ],
            );
          },
          error: (message) {
            log('Create Note: $message');
            return Text('$message');
          },
          orElse: () => const SizedBox.shrink(),
        );
      }),
    );
  }
}
