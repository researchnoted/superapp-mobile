import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/presentation/components/constant.dart';
import 'package:superapp_mobile/presentation/components/customAppBar.dart';
import 'package:superapp_mobile/presentation/components/inkEffect.dart';
import 'package:superapp_mobile/presentation/components/cardBeasiswa.dart';
import 'package:superapp_mobile/presentation/components/detailDaftarUnduhanBeasiswa.dart';
import 'package:superapp_mobile/showWebsite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class DetailPage extends StatelessWidget {
 

  DetailPage({Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Penelitian"),
      backgroundColor: kwhite,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 27, 16, 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _card(context),
                SizedBox(
                  height: 27.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    "Dosen Pembimbing",
                    style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: primary),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 10.w),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/placeholder.png",
                        width: 60.w,
                        height: 60.w,
                      ),
                      SizedBox(width: 10.w),
                      Text("Ali Bardadi, S.Kom, M.Si\nalibardadi@gmail.com")
                    ],
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    "Deskripsi Research",
                    style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: primary),
                  ),
                ),
                _keterangan('Penelitian dilakukan untuk melihat perkembangan ketebalan daging sapi potong yang akan diintegrasikan pada ternak berikutnya.'),
                SizedBox(
                  height: 13.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: const Divider(thickness: 1.0,),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Mulai",
                              style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: primary),
                            ),
                            SizedBox(
                  height: 5.h,
                ),
                          const Text(
                            'Selasa, 14 November'
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(
                              "Selesai",
                              style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: primary),
                            ),
                            SizedBox(
                  height: 5.h,
                ),
                            const Text(
                            'Rabu, 24 November'
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(
                                "Location",
                                style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: primary),
                              ),
                              SizedBox(
                  height: 5.h,
                ),
                              const Text(
                              'Laboratorium IV Peternakan'
                            ),
                          ],
                        ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(
                                "List Jadwal Recording",
                                style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: primary),
                              ),
                              SizedBox(
                  height: 13.h,
                ),
                              Container(
              child: DatePicker(DateTime.now(),
                  height: 100,
                  width: 60,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: const Color(0xFF029456),
                  selectedTextColor: kwhite,
                  dateTextStyle: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      color: kGrey))),
                          ],
                        ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: const Divider(thickness: 1.0,),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Jumlah Perlakuan",
                              style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: primary),
                            ),
                            SizedBox(
                  height: 5.h,
                ),
                          const Text(
                            '5'
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(
                              "Jumlah Ulangan",
                              style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: primary),
                            ),
                            SizedBox(
                  height: 5.h,
                ),
                            const Text(
                            '3'
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 16.w),
//                   child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [Text(
//                                 "Komponen",
//                                 style: TextStyle(
//                                     fontFamily: 'Plus Jakarta Sans',
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: primary),
//                               ),
//                               SizedBox(
//                   height: 5.h,
//                 ),
//                              const Row(
// children: [
// Text(
// "BK",
// style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.w600,
// )
// ),
// Text(
// "Bahan Kering",
// style: TextStyle(
// fontSize: 11,
// fontWeight: FontWeight.w400,
// )
// )
// ],
// )
//                           ],
//                         ),
//                 ),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: kwhite, boxShadow: [
          const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 25,
            spreadRadius: 0,
            offset: Offset(0, 6),
          )
        ]),
        child: Container(
          height: 100.h,
          padding:
              EdgeInsets.only(top: 26.h, bottom: 16.h, left: 16.w, right: 16.w),
          child: InkEffect(
            boxDecoration: BoxDecoration(
              // border: Border.all(color: red),
              color:primary,
              borderRadius: BorderRadius.circular(5.r),
            ),
            onTap: () {
            },
            child: Container(
              width: 358.w,
              height: 45.h,
              child: Center(
                child: Text(
                  "Gabung Penelitian",
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 16.sp,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _card(context) {
    return Container(
                decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: [
                      const BoxShadow(
                        color: shadow,
                        spreadRadius: 0,
                        blurRadius: 40,
                        offset: Offset(0, 16), // changes position of shadow
                      ),
                    ]),
                width: 358.w,
                padding: EdgeInsets.only(
                    top: 20.h, bottom: 16.h, left: 16.w, right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: greenBackground,
                                  ),
                                  child: Text(
                                    "Invivo",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.02.sp,
                                      color: green3,
                                    ),
                                  ),
                                )
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Text("Laboratorium IV Peternakan",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: neutral40,
                                    letterSpacing: -0.02.sp)),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Potensi Tumbuh Kembang Sapi Ternak",
                              maxLines: 2,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 24.sp,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.01.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0.r),
                                color: neutralBackground,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/calendar.png",
                                    width: 12.w,
                                    height: 13.33.w,
                                    color: neutral60,
                                  ),
                                  SizedBox(width: 10.w),
                                  Flexible(
                                          child: RichText(
                                              text: TextSpan(children: [
                                          TextSpan(
                                              text: "Dilaksanakan pada ",
                                              style: TextStyle(
                                                  color: neutral50,
                                                  fontSize: 12.sp,
                                                  fontFamily: 'Plus Jakarta Sans',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.02.sp)),
                                          TextSpan(
                                              text: "14 November - 24 November 2023",
                                              style: TextStyle(
                                                fontFamily: 'Plus Jakarta Sans',
                                                  color: neutral50,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: -0.02.sp))
                                        ])))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
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
                      'Unduh Guidebook',
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
                          ]),
                    )
                  ],
                ),
              );
  }

  Widget _tag(String penerimaName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: blueBackground,
      ),
      child: Text(
        penerimaName,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w200,
          letterSpacing: -0.02.sp,
          color: blue4,
        ),
      ),
    );
  }

  Widget _keterangan(data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.w, right: 9.w),
          child: Html(
            data: data,
            onLinkTap: (((url, context, attributes, element) {
              // return launchURL(url!);
            })),
            style: {
              "p": Style(
                letterSpacing: 0.5,
                fontFamily: 'Plus Jakarta Sans',
                padding: EdgeInsets.zero,
                margin: Margins.zero,
                color: neutral80,
                fontWeight: FontWeight.w400,
              ),
            },
          ),
        ),
      ],
    );
  }

  Widget _persyaratan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Text(
            "Persyaratan",
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.w600, color: blue2),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.w, right: 9.w),
          child: Html(
            data: "TEST",
            onLinkTap: (((url, context, attributes, element) {
              // return launchURL(url!);
            })),
            style: {
              "p": Style(
                letterSpacing: 0.5,
                padding: EdgeInsets.zero,
                margin: Margins.zero,
                color: neutral80,
                fontWeight: FontWeight.w400,
              ),
            },
          ),
        ),
      ],
    );
  }

  Widget _cardButuhInfoDetail(BuildContext context) {
    return InkEffect(
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: appBarGradient,
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowWebsite(
            title: 'Beasiswa',
            link: 'https://beasiswa.kemdikbud.go.id/',
          ),
        ),
      ),
      child: Container(
        height: 96.sp,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17.0, left: 20, bottom: 14),
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    color: Color(0xff248DDA),
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/kedaireka/icon_banner_info_kedaireka.png")),
                    borderRadius: BorderRadius.circular(5.r)),
              ),
            ),
            SizedBox(
              width: 16.sp,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Butuh Informasi lebih detail? ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Kunjungi website > ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: green,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget htmlContent(String content) {
    return Html(
      data: content,
      onLinkTap: (((url, context, attributes, element) {
        // return launchURL(url!);
      })),
      style: {
        "p": Style(
          color: neutral80,
          fontWeight: FontWeight.w400,
        ),
      },
    );
  }
}
