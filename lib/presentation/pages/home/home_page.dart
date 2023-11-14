import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile/app_styles.dart';
import 'package:superapp_mobile/common/utils.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/presentation/components/searchPage.dart';
import 'package:superapp_mobile/presentation/pages/notification/notification_page.dart';
import 'package:superapp_mobile/presentation/pages/research/add_page.dart';
import 'package:superapp_mobile/presentation/pages/schedule/schedule_page.dart';
import 'package:superapp_mobile/profile_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// index menu selected
  int _selectedIndexMenu = 0;

  /// function to set new state of index menu selected
  void _onItemMenuTapped(int index) {
    setState(() {
      _selectedIndexMenu = index;
    });
  }

  Future<String> getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('roleSelectedForRegister') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: _selectedIndexMenu == 0 ?
          _homeScreen(context) : _selectedIndexMenu == 1 ? SchedulePage() : _selectedIndexMenu == 2 ? const NotificationPage() : _selectedIndexMenu == 3 ? const ProfileScreen() : const Center(child: Text("DEFAULT"))
      ),
        bottomNavigationBar: _bottomNavigationBar(),
        floatingActionButton: _addButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _addButton() {
    return FutureBuilder(
      future: getPrefs(), 
      builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Return a loading indicator while the future is being resolved
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Handle any errors that occurred during the Future computation
            return Text('Error: ${snapshot.error}');
          } else {
            String rolePrefs = snapshot.data ?? '';
            return SizedBox(
              width: 70.0,
              height: 70.0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => rolePrefs == 'Student' ? const SearchPage(hintText: 'Cari penelitian ...', text: 'layanan') : const AddResearchPage()));
                },
                backgroundColor: const Color(0xFF029456),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 36.0,
                ),
              ),
            );
          }
      }
    );
  }

  ClipRRect _bottomNavigationBar() {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomAppBar(
          elevation: 0, 
          child: SizedBox(
            height:
                kBottomNavigationBarHeight + 15.0,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: _selectedIndexMenu == 0
                      ? SvgPicture.asset('assets/home_selected_icon.svg')
                      : SvgPicture.asset('assets/home_unselected_icon.svg'),
                  onPressed: () {
                    _onItemMenuTapped(0);
                  },
                ),
                IconButton(
                  icon: _selectedIndexMenu == 1
                      ? SvgPicture.asset('assets/bookmark_selected_icon.svg')
                      : SvgPicture.asset(
                          'assets/bookmark_unselected_icon.svg'),
                  onPressed: () {
                    _onItemMenuTapped(1);
                  },
                ),
                const SizedBox(width: 64.0),
                IconButton(
                  icon: _selectedIndexMenu == 2
                      ? SvgPicture.asset(
                          'assets/notification_selected_icon.svg')
                      : SvgPicture.asset(
                          'assets/notification_unselected_icon.svg'),
                  onPressed: () {
                    _onItemMenuTapped(2);
                  },
                ),
                IconButton(
                  icon: _selectedIndexMenu == 3
                      ? SvgPicture.asset('assets/profile_selected_icon.svg')
                      : SvgPicture.asset(
                          'assets/profile_unselected_icon.svg'),
                  onPressed: () {
                    _onItemMenuTapped(3);
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }

  Widget _homeScreen(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
          children: [
            _header(context),
            SizedBox(height: 30.h),
            _searchbar(context),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Image.asset('assets/empty-state.png', 
                      width: 150.w, 
                      height: 150.w),
                    ),
                    Text('Empty Research', style: kPoppinsBold.copyWith(fontSize: 16.sp)),
                    SizedBox(height: 4.h),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          'Go click the + button to add and find your research',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: kPoppinsRegular.copyWith(
                            color: Color(0xFF8B8B8B),
                            fontSize: 14.sp
                          )
                        )
                      ),
                    )
                  ],
                )
              ),
            )
          ]
        ),
      )
    );
  }



  InkWell _searchbar(BuildContext context) {
    return InkWell(
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (builder) => const SearchPage(
                isBeranda: true,
                hintText: 'Cari penelitian ...',
                text: 'Layanan',
              )));
            },
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(krderRadius),
                  color: kwhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87.withOpacity(0.051),
                      offset: const Offset(0.0, 3.0),
                      blurRadius: 24.0,
                      spreadRadius: 0.0,
                    )
                  ]
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: kPoppinsRegular.copyWith(
                          color: kblue,
                          fontSize: 15.sp,
                        ),
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 13.h),
                          hintText: 'Cari penelitian ...',
                          border: kborder,
                          errorBorder: kborder,
                          disabledBorder: kborder,
                          focusedBorder: kborder,
                          focusedErrorBorder: kborder,
                          hintStyle: kPoppinsRegular.copyWith(
                            color: Colors.black87.withOpacity(0.56),
                            fontSize: 13.sp,
                          )
                        ),
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF029456),
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/search_icon.svg'),
                      )
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Row _header(BuildContext context) {
    return Row(
        children: [
          Container(
            height: 51.w,
            width: 51.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(krderRadius),
              color: kLightBlue,
              image: const DecorationImage(image: NetworkImage('https://cdn3d.iconscout.com/3d/premium/thumb/man-avatar-6299539-5187871.png'))
            ),
          ),

          SizedBox(width: 16.h,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back!',
                style: kPoppinsBold.copyWith(
                  fontSize: 17.sp,
                )
              ),

              Text(
                getCurrentFormattedDate(),
                style: kPoppinsRegular.copyWith(
                  color: kGrey,
                  fontSize: 13.sp,
                )
              )
            ],
          )
        ],
      );
  }
}