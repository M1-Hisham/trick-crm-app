import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/cubits/show_fields.cubit.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../create-lead/presentation/widgets/user_form_loading.dart';
import '../../logic/cubit/edit_lead_cubit.dart';
import '../../logic/cubit/edit_lead_state.dart';
import 'edit_user_form.dart';

class EditDataBlocBuilder extends StatelessWidget {
  final int leadId;
  final List<Map<String, dynamic>>? leadOwner;
  final List<Map<String, dynamic>>? assignedToNames;
  const EditDataBlocBuilder({
    super.key,
    required this.leadId,
    required this.leadOwner,
    required this.assignedToNames,
  });

  static bool isShowFields = false;

  @override
  Widget build(BuildContext context) {
    context.read<EditLeadCubit>().getEditLead(leadId);

    return BlocBuilder<EditLeadCubit, EditLeadState>(
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => Shimmer.fromColors(
            baseColor: R.colors.baseColorShimmer,
            highlightColor: R.colors.highlightColorShimmer,
            enabled: true,
            child: userFormLoading(
              context,
            ),
          ),
          success: (editLeadModel) {
            final leadDtatModel = editLeadModel.lead;
            return BlocBuilder<ShowFieldsCubit, bool>(
              builder: (context, state) {
                final cubit = context.read<ShowFieldsCubit>();
                isShowFields = cubit.isShowFields;

                return editUserForm(
                  context,
                  leadDtatModel,
                  leadOwner ??
                      [
                        {'name': 'No data'}
                      ],
                  assignedToNames ??
                      [
                        {'name': 'No data'}
                      ],
                  isShowFields,
                );
              },
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
