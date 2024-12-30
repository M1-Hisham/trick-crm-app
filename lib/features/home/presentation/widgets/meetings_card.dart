import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';

import '../../../../core/resources/resources.dart';

class MeetingsCard extends StatelessWidget {
  const MeetingsCard({super.key});

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
              'Meetings',
              style: R.textStyles.font24JetBlackBold,
            ),
            spacingV(16),
            statsMeetings(
              name: "Tasks",
              stats: 70.0,
              completed: '1',
              scheduled: '3',
            ),
            spacingV(22),
            statsMeetings(
              name: "Calls",
              stats: 70.0,
              completed: '1',
              scheduled: '3',
            ),
          ],
        ),
      ),
    );
  }

  Widget statsMeetings(
      {required String name,
      required double stats,
      required String completed,
      required String scheduled}) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  R.icons.box,
                  // ignore: deprecated_member_use
                  color: R.colors.secondaryColor,
                ),
                spacingH(4),
                const Text('Completed'),
              ],
            ),
            spacingV(16),
            Row(
              children: [
                SvgPicture.asset(R.icons.box),
                spacingH(4),
                const Text('Scheduled'),
              ],
            ),
          ],
        ),
        const Spacer(),
        buildPieChary(
          name: name,
          stats: stats,
          completed: completed,
          scheduled: scheduled,
        ),
      ],
    );
  }

  Widget buildPieChary({name, stats, completed, scheduled}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          SizedBox(
            width: 110.w,
            height: 110.h,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: stats ?? 0.0,
                        color: R.colors.primaryColor,
                        title: scheduled,
                        titleStyle: R.textStyles.font18WhiteW600,
                        radius: 20.r,
                      ),
                      PieChartSectionData(
                        value: stats == null ? 100 : 100.0 - stats,
                        color: R.colors.secondaryColor,
                        title: completed,
                        titleStyle: R.textStyles.font18WhiteW600,
                        radius: 20.r,
                      ),
                    ],
                    startDegreeOffset: -90,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: R.textStyles.font18WhiteW600
                            .copyWith(color: R.colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
