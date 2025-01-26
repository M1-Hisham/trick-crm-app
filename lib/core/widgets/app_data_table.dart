import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_control_table_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class AppDataTable<T> extends StatefulWidget {
  final List<T>? data;
  final List<String> headers;
  final List<String Function(T)> dataExtractors;
  final String Function(T)? dataIdExtractor;
  final void Function(String)? onViewDetails;

  const AppDataTable({
    super.key,
    required this.data,
    required this.headers,
    required this.dataExtractors,
    this.dataIdExtractor,
    this.onViewDetails,
  });

  @override
  State<AppDataTable<T>> createState() => _AppDataTableState<T>();
}

class _AppDataTableState<T> extends State<AppDataTable<T>> {
  late final List<T>? data = widget.data;
  List<T>? filteredData;
  final ScrollController _scrollController = ScrollController();
  final int _dataPerPage = 10;
  int _currentPage = 1;
  final TextEditingController _searchController = TextEditingController();
  int _switchHeaders = 0;

  @override
  void initState() {
    super.initState();
    filteredData = data;
    _searchController.addListener(_filterData);
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
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Total number: ${data?.length ?? 0}",
            style: R.textStyles.font14WhiteW500.copyWith(
              color: R.colors.black,
            ),
          ),
        ),
        spacingV(20),
        AppTextFormField(
          controller: _searchController,
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF8A8A8A),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    _searchController.clear();
                    _filterData();
                  },
                )
              : null,
          keyboardType: TextInputType.text,
          hintText: "search",
          colorEnableBorder: const Color(0XFFD1D1D1),
          onSaved: (newValue) => _filterData(),
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0xFF8A8A8A),
            size: 31.dg,
          ),
        ),
        filteredData!.isEmpty
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
        filteredData!.isEmpty ? const SizedBox.shrink() : _pageControl(),
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
          _buildHeader(widget.headers[_switchHeaders]),
          _buildHeader(widget.headers[_switchHeaders + 1]),
          ControlTableButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: R.colors.white,
            borderRadius: 50,
            iconSize: 16,
            onPressed: _switchHeaders == 0
                ? null
                : () {
                    setState(
                      () {
                        _switchHeaders -=
                            widget.headers.length % 2 == 0 ? 2 : 1;
                      },
                    );
                  },
          ),
          spacingH(8),
          ControlTableButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            color: R.colors.white,
            borderRadius: 50,
            iconSize: 16,
            onPressed: _switchHeaders == widget.headers.length - 2
                ? null
                : () {
                    setState(
                      () {
                        _switchHeaders +=
                            widget.headers.length % 2 == 0 ? 2 : 1;
                      },
                    );
                  },
          ),
        ],
      ),
    );
  }

  Column _tableBody() {
    final currentData = _currentData;

    return Column(
      children: currentData != null
          ? currentData.map((data) {
              int index = filteredData!.indexOf(data);
              final List<String?> dataBody = widget.dataExtractors
                  .map((extractor) => extractor(data))
                  .toList();

              int? indexCreatedAt = widget.headers.indexOf('Created At');
              var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
                  .parseUTC(indexCreatedAt != -1
                      ? dataBody[indexCreatedAt] ?? "0000-00-00T00:00:21Z"
                      : "0000-00-00T00:00:21Z")
                  .toLocal();
              String formattedDate = DateFormat("yyyy-MM-dd").format(dateValue);
              indexCreatedAt != -1
                  ? dataBody[indexCreatedAt] = formattedDate
                  : null;

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
                    _buildBody(dataBody[_switchHeaders] ?? 'empty'),
                    _buildBody(dataBody[_switchHeaders + 1] ?? 'empty'),
                    if (widget.onViewDetails != null &&
                        widget.dataIdExtractor != null)
                      GestureDetector(
                        onTap: () {
                          widget.onViewDetails?.call(
                            widget.dataIdExtractor!(data),
                          );
                        },
                        child: Icon(Icons.visibility, size: 20.sp),
                      ),
                  ],
                ),
              );
            }).toList()
          : [],
    );
  }

  void _filterData() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredData = data;
      } else {
        _currentPage = 1;
        filteredData = data?.where((data) {
          return widget.dataExtractors.any((extractor) {
            return extractor(data).toLowerCase().contains(query);
          });
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
          "$_currentPage Page of ${(filteredData != null && filteredData!.isNotEmpty ? (filteredData!.length / _dataPerPage).ceil() : 1)}",
        ),
        const Spacer(),
        ControlTableButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: _currentPage > 1 ? _goBack : null,
        ),
        spacingH(14),
        ControlTableButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: (_currentPage * _dataPerPage) < (filteredData?.length ?? 0)
              ? _loadMore
              : null,
        ),
      ],
    );
  }

  List<T>? get _currentData {
    if (filteredData == null || filteredData!.isEmpty) return [];
    final start = (_currentPage - 1) * _dataPerPage;
    final end = start + _dataPerPage;
    return filteredData?.sublist(
      start,
      end > (filteredData?.length ?? 0) ? filteredData!.length : end,
    );
  }

  void _loadMore() {
    if ((_currentPage * _dataPerPage) < (filteredData?.length ?? 0)) {
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
