import 'package:flutter/material.dart';

import '../../../../../../core/widgets/app_bar.dart';
import 'widgets/card_lead_view.dart';

class LeadsView extends StatelessWidget {
  const LeadsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Leads View',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Show Cards
              cardLeadView('Information', 'information'),
              cardLeadView('Timeline', 'timeline'),
              cardLeadView('Notes', 'notes'),
              //! edit icon
              cardLeadView('Attachments', 'attachments'),
              //! edit icon
              cardLeadView('Campaigns', 'information'),
              //! edit icon
              cardLeadView('Email', 'information'),
              //! edit icon
              cardLeadView('Open Activities', 'information'),
            ],
          ),
        ),
      ),
    );
  }
}
