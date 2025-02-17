import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/logic/cubit/lead_view_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/notes-view/model/lead_note.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/notes-view/presentation/screen/notes_screen.dart';

import '../../../data/model/leads_view_model.dart';
import 'card_lead_view.dart';

class LeadViewDataBlocBuilder extends StatelessWidget {
  final int leadId;
  const LeadViewDataBlocBuilder({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadViewCubit, BaseState<LeadsViewModel>>(
        bloc: getIt<LeadViewCubit>()..getLeadsView(leadId),
        buildWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => loadingShimmer(
              child: Column(
                children: [
                  // Show Cards
                  cardLeadView(
                    title: 'Information',
                    icon: 'information',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Timeline',
                    icon: 'timeline',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Notes',
                    icon: 'notes',
                    onTap: () {},
                  ),
                  //! edit icon
                  cardLeadView(
                    title: 'Attachments',
                    icon: 'attachments',
                    onTap: () {},
                  ),
                  //! edit icon
                  cardLeadView(
                    title: 'Campaigns',
                    icon: 'information',
                    onTap: () {},
                  ),
                  //! edit icon
                  cardLeadView(
                    title: 'Email',
                    icon: 'information',
                    onTap: () {},
                  ),
                  //! edit icon
                  cardLeadView(
                    title: 'Open Activities',
                    icon: 'information',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            success: (LeadsViewModel leadsViewModel) {
              final List<LeadNote>? leadNotes = leadsViewModel.leadNotes;
              return Column(
                children: [
                  // Show Cards
                  cardLeadView(
                    title: 'Information',
                    icon: 'information',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Timeline',
                    icon: 'timeline',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Notes',
                    icon: 'notes',
                    onTap: () {
                      Get.to(() => NotesScreen(leadNotes: leadNotes ?? []));
                    },
                  ),
                  //! edit icon
                  cardLeadView(
                    title: 'Attachments',
                    icon: 'attachments',
                    onTap: () {},
                  ),
                  //! edit icon
                  cardLeadView(
                    title: 'Campaigns',
                    icon: 'information',
                    onTap: () {},
                  ),
                  //! edit icon
                  cardLeadView(
                    title: 'Email',
                    icon: 'information',
                    onTap: () {},
                  ),
                  //! edit icon
                  cardLeadView(
                    title: 'Open Activities',
                    icon: 'information',
                    onTap: () {},
                  ),
                ],
              );
            },
            error: (message) {
              return const Text('Error');
            },
            orElse: () => const SizedBox.shrink(),
          );
        });
  }
}
