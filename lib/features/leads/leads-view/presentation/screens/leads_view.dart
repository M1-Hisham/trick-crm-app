import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/resources.dart';
import '../../logic/cubit/leads_view_cubit.dart';

class LeadsView extends StatelessWidget {
  const LeadsView({super.key});

  @override
  Widget build(BuildContext context) {
    final int leadId = Get.arguments;

    context.read<LeadsViewCubit>().getLeadsView(leadId);

    return Scaffold(
      body: BlocBuilder<LeadsViewCubit, LeadsViewState>(
        buildWhen: (previous, current) =>
            current is Success || current is Error,
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => Center(
                    heightFactor: 2.5,
                    child: CircularProgressIndicator(
                      color: R.colors.primaryColor,
                    ),
                  ),
              success: (leadsViewModel) {
                final leadView = leadsViewModel;
                return Center(child: Text('${leadView.lead?.id}'));
              },
              error: (message) => Center(
                    child: Text(message ?? 'An error occurred'),
                  ),
              orElse: () {
                return const SizedBox.shrink();
              });
        },
      ),
    );
  }
}
