import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bottom_nav_bar.dart';
import 'package:trick_crm_app/core/widgets/app_menu.dart';
import 'package:trick_crm_app/features/auth/logout/logout.dart';

import '../../logic/cubit/dashboard_cubit.dart';
import '../widgets/employees_chart_card.dart';
import '../widgets/home_bar.dart';
import '../widgets/card_bloc_builder.dart';
import '../widgets/deals_card.dart';
import '../widgets/meetings_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = DashboardCubit.get(context);
    return Scaffold(
      body: SliderDrawer(
        isDraggable: false,
        animationDuration: 110,
        sliderOpenSize: 290,
        key: cubit.key,
        appBar: null,
        slider: const AppMenu(),
        child: GestureDetector(
          onTap: () {
            cubit.closeMenu();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeBar(),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1.5),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: ModalRoute.of(context)!.animation!,
                      curve: Curves.linear,
                    )),
                    child: Column(
                      children: [
                        const CardBlocBuilder(),
                        spacingV(22),
                        const EmployeesChartCard(),
                        spacingV(16),
                        const DealsCard(),
                        spacingV(16),
                        const MeetingsCard(),
                        spacingV(16),
                        const Logout(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
