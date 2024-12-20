import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/leads/logic/cubit/leads_cubit.dart';

import '../../../../core/resources/resources.dart';
import 'leads_data_table.dart';

class LeadsDataBlocBuilder extends StatelessWidget {
  const LeadsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsCubit, LeadsState>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Center(
                  heightFactor: 2.5,
                  child: CircularProgressIndicator(
                    color: R.colors.primaryColor,
                  ),
                ),
            success: (leadsModel) {
              final leads = leadsModel.leads;
              return LeadsDataTable(
                leads: leads,
              );
            },
            error: (message) => Center(
                  child: Text(message ?? 'An error occurred'),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}