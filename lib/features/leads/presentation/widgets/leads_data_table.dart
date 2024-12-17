import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/resources.dart';

class LeadsDataTable extends StatefulWidget {
  const LeadsDataTable({
    super.key,
  });

  @override
  State<LeadsDataTable> createState() => _LeadsDataTableState();
}

class _LeadsDataTableState extends State<LeadsDataTable> {
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
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            // Table header
            Container(
              color: const Color(0XFFF2F2F2),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              child: Row(
                children: [
                  _buildHeader("Name"),
                  _buildHeader("Lead Source"),
                  _buildHeader("Details"),
                  _buildHeader("More Info"),
                  const Icon(Icons.remove_red_eye, size: 20),
                ],
              ),
            ),
            // Table body
            Column(
              children: List.generate(10, (index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? R.colors.white
                        : const Color(0XFFF6F6F6),
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildBody("mohamed"),
                      _buildBody("Facebook"),
                      _buildBody("Details $index"),
                      _buildBody("More Info $index"),
                      const Icon(Icons.visibility, size: 20),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
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
      width: 150.w,
      alignment: Alignment.centerLeft,
      child: Text(text),
    );
  }
}
