import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/features/home/logic/cubit/dashboard_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../data/models/dashboard_response.dart';
import '../../logic/cubit/dashboard_state.dart';

class MeetingsBlocBuilder extends StatelessWidget {
  const MeetingsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => Shimmer.fromColors(
            baseColor: R.colors.baseColorShimmer,
            highlightColor: R.colors.highlightColorShimmer,
            enabled: true,
            child: Column(
              children: [
                statsMeetings(
                  name: "Tasks",
                  statsCompleted: '0',
                  statsScheduled: '0',
                ),
                spacingV(22),
                statsMeetings(
                  name: "Calls",
                  statsCompleted: '0',
                  statsScheduled: '0',
                ),
              ],
            ),
          ),
          success: (dashBoardResponseModel) {
            final List<Tasks>? tasks = dashBoardResponseModel.data!.tasks;
            final List<Calls>? calls = dashBoardResponseModel.data!.calls;
            final List<Meetings>? meetings =
                dashBoardResponseModel.data!.meetings;
            return _buildMeetings(tasks, calls, meetings);
          },
          error: (e) => Center(
            child: Text(e),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildMeetings(tasks, calls, meetings) {
    var tasksCompleted = tasks!
        .where((task) => task.status == 'Completed')
        .map((task) => task.status)
        .toList();
    var tasksScheduled = tasks!
        .where((task) => task.status == 'Deferred')
        .map((task) => task.status)
        .toList();
    var callsCompleted = calls!
        .where((calls) => calls.callStatus == 'Compeleted')
        .map((calls) => calls.callStatus)
        .toList();
    var callsScheduled = calls!
        .where((calls) => calls.callStatus == 'Scheduled')
        .map((calls) => calls.callStatus)
        .toList();
    return Column(children: [
      statsMeetings(
        name: "Tasks",
        statsCompleted: '${tasksCompleted?.length ?? 0}',
        statsScheduled: '${tasksScheduled?.length ?? 0}',
      ),
      spacingV(22),
      statsMeetings(
        name: "Calls",
        statsCompleted: '${callsCompleted?.length ?? 0}',
        statsScheduled: '${callsScheduled?.length ?? 0}',
      ),
    ]);
  }

  Widget statsMeetings({
    required String name,
    required String statsCompleted,
    required String statsScheduled,
  }) {
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
          statsCompleted: int.parse(statsCompleted),
          statsScheduled: int.parse(statsScheduled),
        ),
      ],
    );
  }

  Widget buildPieChary({name, int? statsCompleted, int? statsScheduled}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          SizedBox(
            width: 140.w,
            height: 140.h,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: statsScheduled!.toDouble(),
                        color: R.colors.primaryColor,
                        title: '$statsScheduled',
                        titleStyle: R.textStyles.font18WhiteW600,
                        radius: 32.r,
                      ),
                      PieChartSectionData(
                        value: statsCompleted!.toDouble(),
                        color: R.colors.secondaryColor,
                        title: '$statsCompleted',
                        titleStyle: R.textStyles.font18WhiteW600,
                        radius: 32.r,
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
