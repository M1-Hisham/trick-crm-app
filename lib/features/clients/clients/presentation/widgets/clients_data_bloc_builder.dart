import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/features/clients/clients/logic/cubit/clients_cubit.dart';
import 'package:trick_crm_app/features/clients/clients/logic/cubit/clients_state.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../data/model/clients_model.dart';

class ClientsDataBlocBuilder extends StatelessWidget {
  const ClientsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsCubit, ClientsState>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Shimmer.fromColors(
                  baseColor: R.colors.baseColorShimmer,
                  highlightColor: R.colors.highlightColorShimmer,
                  enabled: true,
                  child: const AppDataTable<Clients>(
                    data: [],
                    headers: [],
                    dataExtractors: [],
                  ),
                ),
            success: (clientsModel) {
              final String? clientsMessage = clientsModel.message;
              final client = clientsModel.clients;
              return AppDataTable<Clients>(
                dataMessage: clientsMessage,
                data: client ?? [],
                headers: const [
                  "Client Name",
                  "Company",
                  "Email",
                  "Phone",
                  "Lead Source",
                  "Client Assigned to",
                ],
                dataExtractors: [
                  (client) => client.clientName ?? '_',
                  (client) => client.company ?? '_',
                  (client) => client.email ?? '_',
                  (client) => client.mobile ?? '_',
                  (client) => client.leadSource ?? '_',
                  (client) => client.assigned?.name ?? '_',
                ],
                dataIdExtractor: (client) => (client.id ?? 0).toString(),
                onViewDetails: (id) {
                  // Get.toNamed(
                  //   RoutesNames.leadsView,
                  //   arguments: id != '' ? int.parse(id) : 0,
                  // );
                },
              );
            },
            error: (message) => Center(
                  child: Text(message ?? 'An error occurred'),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
