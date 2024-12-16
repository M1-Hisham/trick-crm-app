// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bottom_nav_bar.dart';
import 'package:trick_crm_app/features/home/presentation/widgets/employees_chart_card.dart';

import '../../../../core/resources/resources.dart';
import '../widgets/deals_card.dart';
import '../widgets/home_card.dart';
import '../widgets/meetings_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBar(),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  spacingV(7),
                  HomeCard(
                    icon: R.icons.numberOfClients,
                    title: 'Number of Clients',
                    // $ number of deals here
                    numberOfTitle: '5,432',
                  ),
                  spacingV(16),
                  HomeCard(
                    icon: R.icons.numberOfLeads,
                    title: 'Numbers of Leads',
                    // $ number of deals here
                    numberOfTitle: '5,432',
                  ),
                  spacingV(16),
                  HomeCard(
                    icon: R.icons.totalDeals,
                    title: 'Total Deals in Pipeline',
                    // $ number of deals here
                    numberOfTitle: '5,432',
                  ),
                  spacingV(22),
                  const EmployeesChartCard(),
                  spacingV(16),
                  const DealsCard(),
                  spacingV(16),
                  const MeetingsCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }

  Widget appBar() {
    return Container(
      width: double.infinity,
      height: 258.h,
      decoration: BoxDecoration(
        color: R.colors.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //TODO: open drawer
                    },
                    child: SvgPicture.asset(
                      "assets/icons/Vector.svg",
                      width: 35.w,
                      height: 25.h,
                    ),
                  ),
                  spacingH(16),
                  Image.asset(
                    "assets/icons/trick-logo-menu.png",
                    width: 122.w,
                    height: 49.h,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/icons/notification.svg",
                    width: 32.w,
                    height: 32.h,
                  ),
                ],
              ),
              spacingV(25),
              Row(
                children: [
                  CircleAvatar(
                    radius: 35.dg,
                    backgroundColor: R.colors.white,
                    backgroundImage:
                        const AssetImage("assets/icons/IMG_8967.jpeg"),
                  ),
                  spacingH(14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello! Welcom back!",
                        style: R.textStyles.font14WhiteW500,
                      ),
                      spacingV(1.5),
                      Text(
                        "Mohamed Hisham",
                        style: R.textStyles.font18WhiteW600,
                      ),
                    ],
                  ),
                ],
              ),
              spacingV(25),
            ],
          ),
        ),
      ),
    );
  }
}
