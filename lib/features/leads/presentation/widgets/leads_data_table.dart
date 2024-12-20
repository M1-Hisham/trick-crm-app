import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';

import '../../../../core/resources/resources.dart';
import '../../data/models/leads_model.dart';
import 'control_table_button.dart';

class LeadsDataTable extends StatefulWidget {
  final List<Leads>? leads;
  const LeadsDataTable({
    super.key,
    required this.leads,
  });

  @override
  State<LeadsDataTable> createState() => _LeadsDataTableState();
}

class _LeadsDataTableState extends State<LeadsDataTable> {
  late final List<Leads>? leads = widget.leads;
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      padding: const EdgeInsets.only(top: double.infinity),
      controller: _scrollController,
      thumbVisibility: true,
      thickness: 5,
      thumbColor: R.colors.primaryColor,
      radius: const Radius.circular(6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Table header
            _tableHeader(),
            // Table body
            _tableBody(),
          ],
        ),
      ),
    );
  }

  Widget _tableHeader() {
    return Container(
      color: const Color(0XFFF2F2F2),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Row(
        children: [
          // ControlTableButton(
          //   color: R.colors.white,
          //   borderRadius: 100,
          //   onPressed: () {},
          // ),
          spacingH(8),
          _buildHeader("Name"),
          _buildHeader("Lead Source"),
          ControlTableButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: R.colors.white,
            borderRadius: 50,
            iconSize: 16,
            onPressed: () {
              //? Add your action here
            },
          ),
          spacingH(8),
          ControlTableButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            color: R.colors.white,
            borderRadius: 50,
            iconSize: 16,
            onPressed: () {
              //? Add your action here
            },
          ),
        ],
      ),
    );
  }

  Widget _tableBody() {
    return Column(
      children: List.generate(
        leads?.length ?? 0,
        (index) {
          final lead = leads?[index];
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            decoration: BoxDecoration(
              color: index % 2 == 0 ? Colors.white : const Color(0xFFF6F6F6),
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              children: [
                _buildBody(lead?.leadName ?? 'empty'),
                _buildBody(lead?.leadSource ?? 'empty'),
                const Icon(Icons.visibility, size: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Container(
      width: 150.w,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBody(String text) {
    return Container(
      width: 182.w,
      alignment: Alignment.centerLeft,
      child: Text(text),
    );
  }
}
