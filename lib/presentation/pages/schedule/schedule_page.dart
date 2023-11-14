import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:superapp_mobile/presentation/components/card_Download.dart';
import 'package:superapp_mobile/presentation/components/customAppBar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});
  
  @override
  State<StatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: '', leading: Text("")),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
            child: Column(
              children: [
                _header(),
                const SizedBox(height: 20),
                _scheduleList(),
                const SizedBox(height: 20),
                Column(
                    children: [
                      DownloadWidgetCard(category: 'category', noSurat: 'Laboratorium IV Peternakan', judulDokumen: 'Potensi Tumbuh Kembang Sapi Ternak Dengan Perlakuan Pangan Sehat', date: '14 November - 24 November 2023', urlDokumen: 'urlDokumen'),
                      DownloadWidgetCard(category: 'category', noSurat: 'Laboratorium IV Peternakan', judulDokumen: 'Potensi Tumbuh Kembang Sapi Ternak Dengan Perlakuan Pangan Sehat', date: '14 November - 24 November 2023', urlDokumen: 'urlDokumen'),
                    ],
                  ),
              ],
            ),
          )
        )
    );
  }

  Container _scheduleList() {
    return Container(
            child: DatePicker(DateTime.now(),
                height: 100,
                width: 60,
                initialSelectedDate: DateTime.now(),
                selectionColor: const Color(0xFF029456),
                selectedTextColor: white,
                dateTextStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    color: grey)));
  }

  Row _header() {
    return Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align items to the start (left)
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
          children: <Widget>[
            SizedBox(height: 40),
            Expanded(
              child: Text(
                "Schedule Research",
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
  }
}
