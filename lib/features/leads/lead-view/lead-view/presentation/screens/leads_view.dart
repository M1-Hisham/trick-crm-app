import 'package:flutter/material.dart';
import '../../../../../../core/widgets/app_bar.dart';
import 'widgets/lead_view_data_bloc_builder.dart';

class LeadView extends StatelessWidget {
  final int leadId;
  final String leadName;
  const LeadView({super.key, required this.leadId, required this.leadName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Lead $leadName',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              LeadViewDataBlocBuilder(leadId: leadId),
            ],
          ),
        ),
      ),
    );
  }
}
