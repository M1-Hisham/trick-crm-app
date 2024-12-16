import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/features/home/presentation/widgets/line_chart.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';

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
            Row(children: [
              SvgPicture.asset(R.icons.box),
              spacingH(4),
              const Text("Ahmed Raffat"),
              spacingH(33),
              SvgPicture.asset(R.icons.box),
              spacingH(4),
              const Text("Ahmed Raffat"),
            ]),
            spacingV(18),
            const Divider(
              height: 1,
              color: Color(0xFFE5E5EF),
            ),
            spacingV(16),
            const LineChartSample(),
          ],
        ),
      ),
    );
  }
}
