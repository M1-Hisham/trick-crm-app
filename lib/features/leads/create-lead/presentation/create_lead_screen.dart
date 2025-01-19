import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trick_crm_app/core/helpers/shaerd_pref_helper.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';

import '../../logic/cubit/leads_cubit.dart';
import '../logic/cubit/create_lead_cubit.dart';
import 'widgets/user_form.dart';

class CreateLeadScreen extends StatefulWidget {
  const CreateLeadScreen({super.key});

  @override
  State<CreateLeadScreen> createState() => _CreateLeadScreenState();
}

class _CreateLeadScreenState extends State<CreateLeadScreen> {
  String? userName;
  List<String>? assignedToNames;
  @override
  void initState() {
    super.initState();
    GetIt.I<LeadsCubit>().getLeads();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<CreateLeadCubit>(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            if (userName == null || assignedToNames == null)
              const Center(child: CircularProgressIndicator())
            else
              userForm(
                context,
                userName ?? 'Unknown User',
                assignedToNames ?? ['No data'],
              ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: appTopBarDialog(
                "Create New Lead",
                "complete all the fields below the form",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadUserData() async {
    try {
      final userData = await SharedPrefHelper.getUser();
      debugPrint('User data: ${userData?.name}');
      final assignedToNames = await loadAssignedToNames();
      debugPrint('Assigned to names: $assignedToNames');
      if (mounted) {
        setState(() {
          userName = userData?.name ?? 'Unknown User';
          this.assignedToNames = assignedToNames;
        });
      }
    } catch (e) {
      debugPrint('Error loading user data: $e');
    }
  }

  Future<List<String>> loadAssignedToNames() async {
    while (GetIt.I<LeadsCubit>().state is Loading) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    final leadsState = GetIt.I<LeadsCubit>().state;
    return leadsState.maybeWhen(
      loading: () => ['Loading...'],
      success: (leadsModel) {
        if (leadsModel.users == null || leadsModel.users!.isEmpty) {
          return ['No users available'];
        }
        return leadsModel.users!
            .map((user) => user.name ?? 'Unknown User')
            .toList();
      },
      error: (message) => ['Error: $message'],
      orElse: () => ['No data available'],
    );
  }
}
