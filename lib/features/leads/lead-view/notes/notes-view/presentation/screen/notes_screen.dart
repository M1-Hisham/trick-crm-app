import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/notes-view/presentation/widget/notes_data_bloc_builder.dart';

import '../../../../../../../core/widgets/app_bar.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Notes'),
      body: Padding(
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
            const NotesDataBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
