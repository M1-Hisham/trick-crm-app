import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';

import '../../../../../core/helpers/shaerd_pref_helper.dart';
import '../../../../../core/resources/resources.dart';
import '../../logic/cubit/edit_lead_cubit.dart';
import '../widgets/edit_user_form.dart';

class EditLeadScreen extends StatefulWidget {
  const EditLeadScreen({super.key, required this.leadId});
  final int leadId;

  @override
  State<EditLeadScreen> createState() => _EditLeadScreenState();
}

class _EditLeadScreenState extends State<EditLeadScreen> {
  late final String? userName;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    context.read<EditLeadCubit>().getEditLead(widget.leadId);
    return BlocBuilder<EditLeadCubit, EditLeadState>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => Center(
            heightFactor: 2.5,
            child: CircularProgressIndicator(
              color: R.colors.primaryColor,
            ),
          ),
          success: (editLeadModel) {
            final List<String> assignedToNames = editLeadModel.users!
                .map((user) => user.name ?? 'Unknown User')
                .toList();
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Stack(
                children: [
                  editUserForm(
                    context,
                    userName ?? 'Unknown User',
                    assignedToNames,
                    editLeadModel,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: appTopBarDialog(
                      'Edit Lead',
                      'complete all the fields below the form',
                    ),
                  ),
                ],
              ),
            );
          },
          error: (message) => Center(
            child: Text('$message An error occurred'),
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  void loadUserData() async {
    try {
      final userData = await SharedPrefHelper.getUser();
      if (mounted) {
        setState(() {
          userName = userData?.name ?? 'Unknown User';
        });
      }
    } catch (e) {
      log('Error loading user data: $e');
    }
  }
}
