import 'package:superapp_mobile/presentation/components/card_Download.dart';
import 'package:superapp_mobile/presentation/components/constant.dart';
import 'package:superapp_mobile/presentation/components/search/searchBar.dart' as searchBar;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  final bool isPengumuman, isBerita, isBeranda, isFAQ;
  final String hintText;
  final String text;

  const SearchPage({
    Key? key,
    this.isPengumuman = false,
    this.isBerita = false,
    this.isBeranda = false,
    required this.hintText,
    this.isFAQ = false,
    required this.text,
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController textEditingController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: whiteBgPage,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              toolbarHeight: 80.h,
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleSpacing: 0,
              leading: Padding(
                padding: EdgeInsets.only(left: 7.8.w),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                      size: 24.sp,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              title: Padding(
                padding: EdgeInsets.only(left:10.w, right: 10.w, top: 20.h, bottom: 20.h),
                child: searchBar.SearchBar(
                    controller: textEditingController,
                    openKeyboard: true,
                    hintText: widget.hintText,
                    isSubmitted: (String keyword) {
                      isLoading = true;
                      // search(context, keyword);
                    },
                    searchType: searchBar.TypeSearchBar.withClear),
              ),
            ),
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03),
                child: Column(
                  children: [
                    
                    DownloadWidgetCard(category: 'category', noSurat: 'Laboratorium IV Peternakan', judulDokumen: 'Potensi Tumbuh Kembang Sapi Ternak Dengan Perlakuan Pangan Sehat', date: '14 November - 24 November 2023', urlDokumen: 'urlDokumen'),
                    DownloadWidgetCard(category: 'category', noSurat: 'Laboratorium IV Peternakan', judulDokumen: 'Potensi Tumbuh Kembang Sapi Ternak Dengan Perlakuan Pangan Sehat', date: '14 November - 24 November 2023', urlDokumen: 'urlDokumen'),
                    DownloadWidgetCard(category: 'category', noSurat: 'Laboratorium IV Peternakan', judulDokumen: 'Potensi Tumbuh Kembang Sapi Ternak Dengan Perlakuan Pangan Sehat', date: '14 November - 24 November 2023', urlDokumen: 'urlDokumen'),
                    DownloadWidgetCard(category: 'category', noSurat: 'Laboratorium IV Peternakan', judulDokumen: 'Potensi Tumbuh Kembang Sapi Ternak Dengan Perlakuan Pangan Sehat', date: '14 November - 24 November 2023', urlDokumen: 'urlDokumen')
                  ]
                ),
              ),
            )
        );
  }

}
