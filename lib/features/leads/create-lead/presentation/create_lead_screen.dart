import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../logic/cubit/create_lead_cubit.dart';
import 'widgets/tob_bar.dart';
import 'widgets/user_form.dart';

class CreateLeadScreen extends StatelessWidget {
  const CreateLeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<CreateLeadCubit>(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            userForm(context),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: topBar(),
            ),
          ],
        ),
      ),
    );
  }
}
