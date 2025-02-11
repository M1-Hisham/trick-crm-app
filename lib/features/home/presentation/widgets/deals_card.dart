import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';

class DealsCard extends StatelessWidget {
  const DealsCard({super.key});

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
              'Deals',
              style: R.textStyles.font24JetBlackBold,
            ),
            spacingV(22),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  'Deals mode is still under development👨🏻‍💻 and will be available soon!',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
