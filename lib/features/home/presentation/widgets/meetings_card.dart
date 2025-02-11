import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';

import '../../../../core/resources/resources.dart';
import 'meetings_bloc_builder.dart';

class MeetingsCard extends StatelessWidget {
  const MeetingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: R.colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meetings',
              style: R.textStyles.font24JetBlackBold,
            ),
            spacingV(16),
            const MeetingsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
