import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../create-lead/presentation/screen/create_lead_screen.dart';
import '../widgets/leads_data_bloc_builder.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Leads'),
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
                            sheetAnimationStyle: AnimationStyle(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeInOutCubicEmphasized,
                              reverseDuration:
                                  const Duration(milliseconds: 600),
                            ),
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
                spacingV(20),
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
