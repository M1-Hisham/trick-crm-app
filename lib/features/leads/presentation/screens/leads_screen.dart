import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/leads/presentation/widgets/create_lead.dart';

import '../../../../core/resources/resources.dart';
import '../widgets/control_table_button.dart';
import '../widgets/leads_data_table.dart';

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
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [
              //     R.colors.primaryColor,
              //     R.colors.secondaryColor,
              //   ],
              // ),
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
                          onPressed: () => createLead(context)),
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
                AppTextFormField(
                  hintText: "search",
                  colorEnableBorder: const Color(0XFFD1D1D1),
                  fillColor: R.colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: const Color(0xFF8A8A8A),
                    size: 31.dg,
                  ),
                ),
                const LeadsDataTable(),
                spacingV(15),
                Row(
                  children: [
                    const Text(
                      "02 Page of 21",
                    ),
                    const Spacer(),
                    ControlTableButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () {},
                    ),
                    spacingH(14),
                    ControlTableButton(
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
