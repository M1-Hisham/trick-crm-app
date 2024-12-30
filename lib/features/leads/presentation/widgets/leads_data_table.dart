import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_text_form_field.dart';
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
  List<Leads>? filteredLeads;
  final ScrollController _scrollController = ScrollController();
  final int _dataPerPage = 10;
  int _currentPage = 1;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredLeads = leads;
    _searchController.addListener(_filterLeads);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: _searchController,
          hintText: "search",
          colorEnableBorder: const Color(0XFFD1D1D1),
          onSaved: (newValue) => _filterLeads(),
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0xFF8A8A8A),
            size: 31.dg,
          ),
        ),
        filteredLeads!.isEmpty
            ? Center(
                heightFactor: 2,
                child: Text(
                  'No results found',
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                ),
              )
            : RawScrollbar(
                padding: const EdgeInsets.only(top: double.infinity),
                controller: _scrollController,
                thumbVisibility: true,
                thickness: 4,
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
              ),
        spacingV(15),
        _pageControl(),
      ],
    );
  }

  Container _tableHeader() {
    return Container(
      color: const Color(0XFFF2F2F2),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Row(
        children: [
          spacingH(8),
          _buildHeader("Name"),
          _buildHeader("Lead Source"),
          ControlTableButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: R.colors.white,
            borderRadius: 50,
            iconSize: 16,
            onPressed: () {},
          ),
          spacingH(8),
          ControlTableButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            color: R.colors.white,
            borderRadius: 50,
            iconSize: 16,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Column _tableBody() {
    final currentLeads = _currentLeads;
    return Column(
      children: currentLeads != null
          ? currentLeads.map((lead) {
              int index = filteredLeads!.indexOf(lead);
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color:
                      index % 2 == 0 ? Colors.white : const Color(0xFFF6F6F6),
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  children: [
                    _buildBody(lead.leadName ?? 'empty'),
                    _buildBody(lead.leadSource ?? 'empty'),
                    const Icon(Icons.visibility, size: 20),
                  ],
                ),
              );
            }).toList()
          : [],
    );
  }

  void _filterLeads() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredLeads = leads;
      } else {
        filteredLeads = leads?.where((lead) {
          final leadName = lead.leadName?.toLowerCase() ?? '';
          final leadSource = lead.leadSource?.toLowerCase() ?? '';
          return leadName.contains(query) || leadSource.contains(query);
        }).toList();
      }
    });
  }

  Container _buildHeader(String text) {
    return Container(
      width: 150.w,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Container _buildBody(String text) {
    return Container(
      width: 182.w,
      alignment: Alignment.centerLeft,
      child: Text(text),
    );
  }

  Row _pageControl() {
    return Row(
      children: [
        Text(
          "$_currentPage Page of ${(leads != null && leads!.isNotEmpty ? (leads!.length / _dataPerPage).ceil() : 1)}",
        ),
        const Spacer(),
        ControlTableButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: _currentPage > 1 ? _goBack : null,
        ),
        spacingH(14),
        ControlTableButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: (_currentPage * _dataPerPage) < (leads?.length ?? 0)
              ? _loadMore
              : null,
        ),
      ],
    );
  }

  List<Leads>? get _currentLeads {
    if (filteredLeads == null || filteredLeads!.isEmpty) return [];
    final start = (_currentPage - 1) * _dataPerPage;
    final end = start + _dataPerPage;
    return filteredLeads?.sublist(
      start,
      end > (filteredLeads?.length ?? 0) ? filteredLeads!.length : end,
    );
  }

  void _loadMore() {
    if ((_currentPage * _dataPerPage) < (leads?.length ?? 0)) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _goBack() {
    if (_currentPage > 1) {
      setState(() {
        _currentPage--;
      });
    }
  }
}
