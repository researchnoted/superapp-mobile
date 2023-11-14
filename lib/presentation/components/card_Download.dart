import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/presentation/components/constant.dart';
import 'package:superapp_mobile/presentation/components/cardStatusTahapan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:superapp_mobile/presentation/pages/research/detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadWidgetCard extends StatelessWidget {
  const DownloadWidgetCard(
      {Key? key,
      required this.category,
      required this.noSurat,
      required this.judulDokumen,
      required this.date,
      required this.urlDokumen})
      : super(key: key);

  final String category;
  final String noSurat;
  final String judulDokumen;
  final String date;
  final String urlDokumen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A5C5E61),
            spreadRadius: -4,
            blurRadius: 16,
            offset: Offset(0, 12), // changes position of shadow
          ),
          BoxShadow(
            color: Color(0x0D5C5E61),
            spreadRadius: -2,
            blurRadius: 6,
            offset: Offset(0, 4), // changes position of shadow
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Container(
        width: 358.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: category == 'dikti'
                        ? bimaCategoryDikti
                        : bimaCategoryDiksi,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.02),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                    child: Text(
                      category == 'dikti' ? 'Invivo' : 'Invitro',
                      style: TextStyle(
                        color: category == 'dikti'
                            ? Color.fromRGBO(28, 92, 173, 1)
                            : Color.fromRGBO(45, 119, 56, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: bimaNomorSurat,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.02),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                    child: Text(
                      noSurat,
                      style: TextStyle(
                        color: Color.fromRGBO(37, 42, 49, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              judulDokumen,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageIcon(
                  AssetImage('assets/icons/calendar_icon.png'),
                  size: 12.sp,
                  color: neutral40,
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  // '${FormatDate.formatDateStatic(this.date)}',
                  date,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: neutral40,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ImageIcon(
                //   AssetImage('assets/icons/icon_document.png'),
                //   size: 16.sp,
                //   color: neutral50,
                // ),
                // SizedBox(
                //   width: 10.w,
                // ),
                Expanded(
                  child: Text(
                    // '${FormatDate.formatDateStatic(this.date)}',
                    'Penelitian dilakukan untuk melihat perkembangan ketebalan daging sapi potong yang akan diintegrasikan pada ternak berikutnya.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: neutral50,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  DetailPage()));
              },
              child: Container(
                width: 318.w,
                height: 44.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: primary),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ImageIcon(
                    //   AssetImage('assets/icons/icon_download.png'),
                    //   size: 20.sp,
                    //   color: primary,
                    // ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      'Lihat Penelitian',
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse(urlDokumen);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch');
    }
  }
}
