import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/notes-view/model/lead_note.dart';

import '../../../../../../../core/widgets/app_bar.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';

class NotesScreen extends StatelessWidget {
  final List<LeadNote> leadNotes;
  const NotesScreen({super.key, required this.leadNotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Notes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppButton(
                icon: SvgPicture.asset(R.icons.add),
                text: 'Add Note',
                onPressed: () {},
              ),
              spacingV(20),
              Text(
                'Notes',
                style: R.textStyles.font17PrimaryW600,
              ),
              spacingV(10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: leadNotes.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      AppTextFormField(
                        hintText: '',
                        labelText: 'Note',
                        controller: TextEditingController(
                            text: leadNotes[index].comment),
                      ),
                      spacingV(25),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
