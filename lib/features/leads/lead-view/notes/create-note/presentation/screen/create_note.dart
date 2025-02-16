import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';

import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/create-note/data/model/create_lead_note_reqest_body.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/create-note/logic/cubit/create_note_state.dart';

import '../../data/model/create_lead_note_model.dart';
import '../../logic/cubit/create_note_cubit.dart';

class CreateNote extends StatelessWidget {
  final int leadId;
  CreateNote({super.key, required this.leadId});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final String? note;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CreateNoteCubit>(),
      child: Column(
        children: [
          const Text('Create a new Note'),
          //? Add Create Note Form
          Form(
            key: _formKey,
            child: AppTextFormField(
              hintText: 'Note',
              onSaved: (value) {
                note = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a note';
                }
                return null;
              },
            ),
          ),
          BlocBuilder<CreateNoteCubit, CreateNoteState>(
              builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (createLeadNoteModel) {
                log('Create Note: $createLeadNoteModel');
                final CreateLeadNoteModel noteModel = createLeadNoteModel;
                return Text('${noteModel.message}');
              },
              error: (message) {
                log('Create Note: $message');
                return Text('$message');
              },
              orElse: () => const SizedBox.shrink(),
            );
          }),
          AppButton(
            text: 'Create Note',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                log('Create Note: $note');

                //? Add Create Note Logic
                getIt<CreateNoteCubit>().createNote(
                  leadId,
                  CreateLeadNoteRequestBody(comment: note!),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
