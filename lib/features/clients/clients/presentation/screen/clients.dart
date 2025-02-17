import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../widgets/clients_data_bloc_builder.dart';

class Clients extends StatelessWidget {
  const Clients({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Clients'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                AppButton(
                  icon: SvgPicture.asset(R.icons.add),
                  text: 'Create Client',
                  onPressed: () {
                    // showModalBottomSheet(
                    //   sheetAnimationStyle: AnimationStyle(
                    //     duration: const Duration(milliseconds: 1000),
                    //     curve: Curves.easeInOutCubicEmphasized,
                    //     reverseDuration:
                    //         const Duration(milliseconds: 600),
                    //   ),
                    //   useSafeArea: true,
                    //   isScrollControlled: true,
                    //   backgroundColor:
                    //       Theme.of(context).scaffoldBackgroundColor,
                    //   shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(13),
                    //       topRight: Radius.circular(13),
                    //     ),
                    //   ),
                    //   context: context,
                    //   builder: (BuildContext context) =>
                    //       const CreateLeadScreen(),
                    // );
                  },
                ),
                spacingH(8),
                spacingV(13),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        icon: SvgPicture.asset(R.icons.importOptions),
                        text: 'Import Options',
                        onPressed: () {},
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
                spacingV(20),
                //! Clients data table
                const ClientsDataBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
