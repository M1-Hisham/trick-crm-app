import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/core/cubits/image_picker_cubit.dart';
import 'package:trick_crm_app/core/helpers/shaerd_pref_helper.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';

import '../../../../../../core/cubits/show_fields.cubit.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../create-lead/presentation/widgets/user_form_loading.dart';
import '../../../../leads/logic/cubit/leads_cubit.dart';
import '../widgets/edit_data_bloc_builder.dart';
import '../../../../leads/logic/cubit/leads_state.dart';

class EditLeadScreen extends StatefulWidget {
  final int leadId;
  const EditLeadScreen({super.key, required this.leadId});

  @override
  State<EditLeadScreen> createState() => _EditLeadScreenState();
}

class _EditLeadScreenState extends State<EditLeadScreen> {
  List<Map<String, dynamic>>? assignedToNames;
  List<Map<String, dynamic>>? leadOwner;
  @override
  void initState() {
    super.initState();
    GetIt.I<LeadsCubit>().getLeads();
    loadUserData();
  }

  @override
  void dispose() {
    log("Cubit is being closed.");
    GetIt.I<ShowFieldsCubit>().hideFields();
    GetIt.I<ImagePickerCubit>().image = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<ShowFieldsCubit>(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            if (leadOwner == null || assignedToNames == null)
              Shimmer.fromColors(
                baseColor: R.colors.baseColorShimmer,
                highlightColor: R.colors.highlightColorShimmer,
                enabled: true,
                child: userFormLoading(
                  context,
                ),
              )
            else
              EditDataBlocBuilder(
                leadId: widget.leadId,
                leadOwner: leadOwner,
                assignedToNames: assignedToNames,
              ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: appTopBarDialog(
                "Edit Lead",
                "Complete all the fields below the form",
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
      log('User data: ${userData?.name}');
      final assignedToNames = await loadAssignedToNames();
      log('Assigned to names: $assignedToNames');
      if (mounted) {
        var userName = userData?.name ?? 'Unknown User';
        var userId = userData?.id;
        var userTenantId = userData?.tenantId;
        setState(() {
          leadOwner = [
            {
              'name': userName,
              'id': userId,
              'Tenant Id': userTenantId,
            },
          ];
          this.assignedToNames = assignedToNames;
        });
      }
    } catch (e) {
      debugPrint('Error loading user data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> loadAssignedToNames() async {
    while (GetIt.I<LeadsCubit>().state is Loading) {
      await Future.delayed(const Duration(microseconds: 1));
    }

    final leadsState = GetIt.I<LeadsCubit>().state;
    return leadsState.maybeWhen(
      loading: () => [
        {'name': 'Loading...', 'id': null}
      ],
      success: (leadsModel) {
        if (leadsModel.users == null || leadsModel.users!.isEmpty) {
          return [
            {'name': 'No users available', 'id': null}
          ];
        }
        return leadsModel.users!
            .map((user) => {'name': user.name ?? 'Unknown User', 'id': user.id})
            .toList();
      },
      error: (message) => [
        {'name': 'Error: $message', 'id': null}
      ],
      orElse: () => [
        {'name': 'No data available', 'id': null}
      ],
    );
  }
}
