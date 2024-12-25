import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import 'chart_sample_bloc_builder.dart';

class EmployeesChartCard extends StatelessWidget {
  const EmployeesChartCard({super.key});

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
              'Employees Chart',
              style: R.textStyles.font24JetBlackBold,
            ),
            spacingV(22),
            const ChartSampleBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
