import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/home/data/models/dashboard_response.dart';
import 'package:trick_crm_app/features/home/logic/cubit/dashboard_cubit.dart';
import 'package:trick_crm_app/features/home/logic/cubit/dashboard_state.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import 'home_card.dart';

class CardBlocBuilder extends StatelessWidget {
  const CardBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (dashboardResponseModel) {
            final Data? data = dashboardResponseModel.data;
            return _buildCard(data);
          },
          error: (e) => Center(
            child: Text(e),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

Widget _buildCard(Data? data) {
  return Column(
    children: [
      HomeCard(
        icon: R.icons.numberOfClients,
        title: 'Number of Clients',
        // $ number of deals here
        numberOfTitle: '${data?.clients?.length ?? "Empty"}',
      ),
      spacingV(16),
      HomeCard(
        icon: R.icons.numberOfLeads,
        title: 'Numbers of Leads',
        // $ number of deals here
        numberOfTitle: '${data?.leads?.length ?? "Empty"}',
      ),
      spacingV(16),
      HomeCard(
        icon: R.icons.totalDeals,
        title: 'Total Deals in Pipeline',
        // $ number of deals here
        numberOfTitle: '${data?.deals?.length ?? "Empty"}',
      ),
    ],
  );
}
