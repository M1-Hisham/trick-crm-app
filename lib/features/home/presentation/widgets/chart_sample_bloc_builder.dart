import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/features/home/logic/cubit/dashboard_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../data/models/dashboard_response.dart';
import '../../logic/cubit/dashboard_state.dart';
import 'line_chart.dart';

class ChartSampleBlocBuilder extends StatelessWidget {
  const ChartSampleBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => Center(
            heightFactor: 2.5,
            child: CircularProgressIndicator(
              color: R.colors.primaryColor,
            ),
          ),
          success: (dashboardResponseModel) {
            final Data? data = dashboardResponseModel.data;
            return _builedEmployeesChart(data);
          },
          error: (e) => Center(
            child: Text(e),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _builedEmployeesChart(Data? data) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
            // Top 5 Sales Persons
            Row(
          children:
              List.generate(data?.topFiveSalesPersons?.length ?? 0, (index) {
            return Row(
              children: [
                SvgPicture.asset(R.icons.box),
                spacingH(4),
                Text(data!.topFiveSalesPersons?[index].name ?? ''),
                spacingH(33),
              ],
            );
          }),
        ),
      ),
      spacingV(18),
      const Divider(
        height: 1,
        color: Color(0xFFE5E5EF),
      ),
      spacingV(16),
      LineChartSample(data: data),
    ]);
  }
}
