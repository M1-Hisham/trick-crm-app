import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-note/presentation/screen/create_note.dart';

import '../../../../../../core/resources/resources.dart';
import '../../../edit-lead/logic/cubit/edit_lead_cubit.dart';
import '../../../edit-lead/presentation/screens/edit_lead_screen.dart';
import '../../data/model/leads_view_model.dart';
import '../../logic/cubit/leads_view_cubit.dart';

class LeadsView extends StatelessWidget {
  const LeadsView({super.key});
  @override
  Widget build(BuildContext context) {
    final int leadId = Get.arguments;

    context.read<LeadsViewCubit>().getLeadsView(leadId);
    return Scaffold(
      body: BlocBuilder<LeadsViewCubit, BaseState<LeadsViewModel>>(
        buildWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(
              child: CircularProgressIndicator(
                color: R.colors.primaryColor,
              ),
            ),
            success: (leadsViewModel) {
              final leadView = leadsViewModel;
              // final noteId = leadsViewModel.leadNotes.;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //? Add Create a new Note
                  CreateNote(
                    leadId: leadId,
                  ),
                  // UpdateNote(leadId: leadId, noteId: noteId),
                  Center(
                      child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13),
                            topRight: Radius.circular(13),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return BlocProvider.value(
                            value: getIt<EditLeadCubit>(),
                            child: EditLeadScreen(
                              leadId: leadId,
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Edit Lead ${leadView.lead?.id}'),
                  )),
                ],
              );
            },
            error: (message) => Center(
              child: Text(message ?? 'An error occurred'),
            ),
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
