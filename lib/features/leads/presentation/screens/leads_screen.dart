import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';

import '../../../../core/resources/resources.dart';
import '../../create-lead/presentation/create_lead_screen.dart';
import '../widgets/leads_data_bloc_builder.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          toolbarHeight: 60.h,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: R.colors.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
          ),
          leading: const BackButton(),
          centerTitle: true,
          title: const Text('Leads'),
          // nottification icon
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: IconButton(
                onPressed: () {
                  //? Add your action here
                },
                icon: SvgPicture.asset(
                  R.icons.notification,
                  width: 32.w,
                  height: 32.h,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        icon: SvgPicture.asset(R.icons.createLeads),
                        text: 'Create Lead',
                        onPressed: () {
                          showModalBottomSheet(
                            useSafeArea: true,
                            isScrollControlled: true,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(13),
                                topRight: Radius.circular(13),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) =>
                                const CreateLeadScreen(),
                          );
                        },
                      ),
                    ),
                    spacingH(8),
                    Expanded(
                      child: AppButton(
                        icon: SvgPicture.asset(R.icons.exportOptions),
                        text: 'Export Options',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                spacingV(13),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        icon: SvgPicture.asset(R.icons.integrateFacebook),
                        text: 'Integrate Facebook',
                        onPressed: () {},
                      ),
                    ),
                    spacingH(8),
                    Expanded(
                      child: AppButton(
                        icon: SvgPicture.asset(R.icons.importOptions),
                        text: 'Import Options',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                spacingV(32),
                // leads data table
                const LeadsDataBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
