import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/shaerd_pref_helper.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bottom_nav_bar.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/features/auth/logout/logout.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/routes/routes.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../widgets/card_bloc_builder.dart';
import '../widgets/deals_card.dart';
import '../widgets/meetings_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  static bool _isOpenOrClose = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        isDraggable: false,
        animationDuration: 110,
        sliderOpenSize: 290,
        key: _key,
        appBar: null,
        slider: _sliderView(),
        child: GestureDetector(
          onTap: () {
            if (_key.currentState?.isDrawerOpen == true) {
              setState(() {
                _key.currentState?.closeSlider();
                _isOpenOrClose = false;
              });
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBar(),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [
                      spacingV(7),
                      AppButton(
                        text: "Go to leads",
                        onPressed: () {
                          Get.toNamed(RoutesNames.leads);
                        },
                      ),
                      spacingV(7),
                      const CardBlocBuilder(),
                      spacingV(22),
                      // const EmployeesChartCard(),
                      spacingV(16),
                      const DealsCard(),
                      spacingV(16),
                      const MeetingsCard(),
                      spacingV(16),
                      const Logout(),
                    ],
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

  Container appBar() {
    return Container(
      width: double.infinity,
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
              if (_isOpenOrClose == true) ...[
                SvgPicture.asset(
                  R.icons.notification,
                  width: 32.w,
                  height: 32.h,
                ),
                spacingV(115),
              ] else ...[
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_key.currentState?.isDrawerOpen == false) {
                            _key.currentState?.toggle();
                            _isOpenOrClose = !_isOpenOrClose;
                          }
                        });
                      },
                      child: SvgPicture.asset(
                        R.icons.openMenu,
                        width: 35.w,
                        height: 25.h,
                      ),
                    ),
                    spacingH(16),
                    Image.asset(
                      R.icons.logoMenu,
                      width: 122.w,
                      height: 49.h,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      R.icons.notification,
                      width: 32.w,
                      height: 32.h,
                    ),
                  ],
                ),
                spacingV(25),
                FutureBuilder(
                    future: SharedPrefHelper.getUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final UserData userData = snapshot.data!;
                        return Row(
                          children: [
                            CircleAvatar(
                                radius: 35.dg,
                                backgroundColor: R.colors.transparent,
                                backgroundImage: NetworkImage(
                                  userData.avatar ?? '',
                                ),
                                onBackgroundImageError: (context, error) {
                                  if (error
                                      .toString()
                                      .contains("Failed host lookup")) {
                                    Image.asset(R.icons.imageUserError);
                                  }
                                  Image.asset(R.icons.imageUserError);
                                }),
                            spacingH(14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello! Welcome back!",
                                  style: R.textStyles.font14WhiteW500,
                                ),
                                spacingV(1.5),
                                Text(
                                  userData.name ?? "",
                                  style: R.textStyles.font18WhiteW600,
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                spacingV(10),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Container _sliderView() {
    return Container(
      color: R.colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_key.currentState?.isDrawerOpen == true) {
                          _key.currentState?.toggle();
                          _isOpenOrClose = !_isOpenOrClose;
                        }
                      });
                    },
                    child: SvgPicture.asset(
                      R.icons.closeMenu,
                      width: 60.w,
                      height: 35.h,
                    ),
                  ),
                  spacingH(16),
                  Image.asset(
                    R.icons.logoMenu,
                    color: R.colors.primaryColor,
                    width: 122.w,
                    height: 49.h,
                  ),
                ],
              ),
              spacingV(25),
              FutureBuilder(
                  future: SharedPrefHelper.getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final UserData userData = snapshot.data!;
                      return Row(
                        children: [
                          CircleAvatar(
                              radius: 35.dg,
                              backgroundColor: R.colors.transparent,
                              backgroundImage: NetworkImage(
                                userData.avatar ?? '',
                              ),
                              onBackgroundImageError: (context, error) {
                                if (error
                                    .toString()
                                    .contains("Failed host lookup")) {
                                  Image.asset(R.icons.imageUserError);
                                }
                                Image.asset(R.icons.imageUserError);
                              }),
                          spacingH(14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userData.name ?? "",
                                style: R.textStyles.font18WhiteW600.copyWith(
                                  color: R.colors.black,
                                ),
                              ),
                              spacingV(1.5),
                              Text(
                                "View Profile",
                                style: R.textStyles.font12PrimaryColorW500
                                    .copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: R.colors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
              spacingV(35),
              ..._menuList(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _menuList() {
    List<Widget> menuItems = [];
    for (MapEntry menus in R.icons.iconsMenu.entries) {
      menuItems.add(
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RoutesNames.leads);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    menus.value,
                    width: 24.w,
                    height: 24.h,
                  ),
                  spacingH(16),
                  FittedBox(
                    child: Text(
                      menus.key,
                      style: R.textStyles.font20ShadowGray29W500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      menuItems.add(spacingV(22));
    }
    return menuItems;
  }
}
