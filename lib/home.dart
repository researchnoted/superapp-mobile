import 'package:flutter/material.dart';
import 'package:superapp_mobile/auth/fetchs.dart';
import 'package:superapp_mobile/common/globals.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';
import 'package:superapp_mobile/news_detail_screen.dart';
import 'package:superapp_mobile/presentation/components/empty_research.dart';
import 'package:superapp_mobile/presentation/pages/home/research/createResearchPage.dart';
import 'package:superapp_mobile/presentation/pages/home/research/notificationResearchPage.dart';
import 'package:superapp_mobile/presentation/pages/home/research/scheduleResearchPage.dart';
import 'package:superapp_mobile/presentation/pages/home/research/searchResearchPage.dart';
import 'package:superapp_mobile/profile_screen.dart';
import 'package:superapp_mobile/common/utils.dart';
import 'app_styles.dart';
import 'size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  final String userRole;

  const Home({Key? key, required this.userRole}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: _selectedIndex == 0
              ? widget.userRole == 'Student'
                  ? HomeScreen()
                  : HomeScreenLecture()
              : _selectedIndex == 1
                  ? ScheduleResearchPage()
                  : _selectedIndex == 2
                      ? NotificationResearchPage() // Add the corresponding screen for index 2
                      : _selectedIndex == 3
                          ? ProfileScreen()
                          : NotificationResearchPage(), // Add the corresponding screen for index 3
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), // Adjust the radius as needed
            topRight: Radius.circular(20.0), // Adjust the radius as needed
          ),
          child: BottomAppBar(
            elevation: 0, // Remove the shadow
            child: SizedBox(
              height:
                  kBottomNavigationBarHeight, // Define the height of the BottomAppBar
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Adjust spacing as needed
                children: <Widget>[
                  IconButton(
                    icon: _selectedIndex == 0
                        ? SvgPicture.asset('assets/home_selected_icon.svg')
                        : SvgPicture.asset('assets/home_unselected_icon.svg'),
                    onPressed: () {
                      _onItemTapped(0);
                    },
                  ),
                  IconButton(
                    icon: _selectedIndex == 1
                        ? SvgPicture.asset('assets/bookmark_selected_icon.svg')
                        : SvgPicture.asset(
                            'assets/bookmark_unselected_icon.svg'),
                    onPressed: () {
                      _onItemTapped(1);
                    },
                  ),
                  SizedBox(width: 64.0), // Adjust the width to create space
                  IconButton(
                    icon: _selectedIndex == 2
                        ? SvgPicture.asset(
                            'assets/notification_selected_icon.svg')
                        : SvgPicture.asset(
                            'assets/notification_unselected_icon.svg'),
                    onPressed: () {
                      _onItemTapped(2);
                    },
                  ),
                  IconButton(
                    icon: _selectedIndex == 3
                        ? SvgPicture.asset('assets/profile_selected_icon.svg')
                        : SvgPicture.asset(
                            'assets/profile_unselected_icon.svg'),
                    onPressed: () {
                      _onItemTapped(3);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: const AddButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.0,
      height: 70.0,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => authRole == 'Student'
                  ? SearchResearchPage()
                  : CreateResearchPage()));
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> researchData = [];
  String? errorMessage;
  late Future<void> fetchDataFuture;

  @override
  void initState() {
    super.initState();
    // fetchDataFuture = fetchData();
  }

  Future<void> fetchData() async {
    final result = await getResearchs();

    setState(() {
      result.fold(
        (failure) {
          errorMessage = "Failed to fetch data";
        },
        (researchList) {
          // researchData = researchList.data;
          researchData = [];
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        children: [
          header(),
          const SizedBox(height: 30),
          SearchBar(),
          SizedBox(
            height: researchData.isEmpty
                ? MediaQuery.of(context).size.height / 6
                : 15,
          ),
          FutureBuilder<void>(
            future: fetchDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While data is being fetched, show a loading indicator.
                return Container(
                  margin: const EdgeInsets.only(
                      top: 60), // Set the margin you desire
                  child: const Center(
                    child: CircularProgressIndicator(
                      // Set the valueColor to your desired color
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF029456)),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                // If there's an error, display an error message.
                return Text('Error: ${snapshot.error}');
              } else {
                // Data has been fetched, conditionally render based on researchData.
                return researchData.isEmpty
                    ? const EmptyResearch()
                    : ResearchList(researchData: researchData);
              }
            },
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 19),
        ],
      ),
    );
  }

  // header of home
  Widget header() {
    return Row(
      children: [
        // user's profile picture
        Container(
          height: 51,
          width: 51,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: kLightBlue,
            image: const DecorationImage(
              image: NetworkImage(
                'https://cdn3d.iconscout.com/3d/premium/thumb/man-avatar-6299539-5187871.png',
              ),
            ),
          ),
        ),

        // space between profile picture & information
        const SizedBox(
          width: 16,
        ),

        // user's information
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // text welcome back
            Text(
              'Welcome Back!',
              style: kPoppinsBold.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 4,
              ),
            ),

            // the day user open the app
            Text(
              getCurrentFormattedDate(),
              style: kPoppinsRegular.copyWith(
                color: kGrey,
                fontSize: SizeConfig.blockSizeHorizontal! * 3,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ResearchList extends StatelessWidget {
  const ResearchList({
    super.key,
    required this.researchData,
  });

  final List<Data> researchData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      //  List of Research
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: researchData.length,
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext context, int index) {
          // Define the separator or gap between items.
          return SizedBox(height: 20); // Adjust the height as needed.
        },
        itemBuilder: (context, index) {
          final research = researchData[index];
          final research_cover = research.research_cover ?? '';

          // Container of Card Research
          return Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(
              right: 0,
            ),
            height: 304,
            width: 255,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              color: kWhite,
              boxShadow: [
                BoxShadow(
                  color: kDarkBlue.withOpacity(0.051),
                  offset: const Offset(0.0, 3.0),
                  blurRadius: 24.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            child: Column(
              children: [
                // Research Cover
                Container(
                  height: 164,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'http://192.168.43.63:8000/storage/${research.research_cover.replaceAll(r'\/', '/')}',
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),

                // Research Title & Description (Clickable)
                InkWell(
                  onTap: () {
                    // Navigate to NewsDetailScreen when the text is clicked
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewsDetailScreen()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${research.title}, unmatched. There is no other place like Bali in this world.',
                        style: kPoppinsBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Lecture's Profile Picture & Name & Research Date
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 19,
                          backgroundColor: kLightBlue,
                          backgroundImage: NetworkImage(
                            'https://blogger.googleusercontent.com/img/a/AVvXsEiRB_dB-wXqJdvt26dkR-vqOXUjacfxAQIgFNMHl_czjMNDOh6VZVc-muCczDKZh-VU0JqUYV1M9h25ZooLGqhVfwexQO6zNY1jxeMDu0-SpfEPe8xkF7re1eldAkKld9Ct1YzesFmHpQK9wlPK330AXA85gsmDBURTQm3i7r08g6vO7KNtAPyDgeUIaQ=s740',
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sam Aziz Ahwan',
                              style: kPoppinsSemibold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              ),
                            ),
                            Text(
                              'Sep 9, 2022',
                              style: kPoppinsRegular.copyWith(
                                color: kGrey,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                    // Research Share Icon
                    Container(
                      height: 38,
                      width: 38,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        color: kLightWhite,
                      ),
                      child: SvgPicture.asset(
                        'assets/share_icon.svg',
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// SearchBar Widget
class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: kWhite,
        boxShadow: [
          BoxShadow(
            color: kDarkBlue.withOpacity(0.051),
            offset: const Offset(0.0, 3.0),
            blurRadius: 24.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: kPoppinsRegular.copyWith(
                color: kBlue,
                fontSize: SizeConfig.blockSizeHorizontal! * 3,
              ),
              controller: TextEditingController(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                hintText: 'Search for research...',
                border: kBorder,
                errorBorder: kBorder,
                disabledBorder: kBorder,
                focusedBorder: kBorder,
                focusedErrorBorder: kBorder,
                hintStyle: kPoppinsRegular.copyWith(
                  color: kLightGrey,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF029456),
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/search_icon.svg',
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreenLecture extends StatefulWidget {
  const HomeScreenLecture({Key? key}) : super(key: key);

  @override
  _HomeScreenLectureState createState() => _HomeScreenLectureState();
}

class _HomeScreenLectureState extends State<HomeScreenLecture> {
  List<Data> researchData = [];
  String? errorMessage;
  late Future<void> fetchDataFuture;

  @override
  void initState() {
    super.initState();
    fetchDataFuture = fetchData();
  }

  Future<void> fetchData() async {
    final result = await getResearchs();

    setState(() {
      result.fold(
        (failure) {
          errorMessage = "Failed to fetch data";
        },
        (researchList) {
          // researchData = researchList.data;
          researchData = [];
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        children: [
          header(),
          const SizedBox(height: 30),
          SearchBar(),
          SizedBox(
            height: researchData.isEmpty
                ? MediaQuery.of(context).size.height / 6
                : 15,
          ),
          FutureBuilder<void>(
            future: fetchDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While data is being fetched, show a loading indicator.
                return Container(
                  margin: const EdgeInsets.only(
                      top: 60), // Set the margin you desire
                  child: const Center(
                    child: CircularProgressIndicator(
                      // Set the valueColor to your desired color
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF029456)),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                // If there's an error, display an error message.
                return Text('Error: ${snapshot.error}');
              } else {
                // Data has been fetched, conditionally render based on researchData.
                return researchData.isEmpty
                    ? const EmptyResearch()
                    : ResearchList(researchData: researchData);
              }
            },
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 19),
        ],
      ),
    );
  }

  // header of home
  Widget header() {
    return Row(
      children: [
        // user's profile picture
        Container(
          height: 51,
          width: 51,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: kLightBlue,
            image: const DecorationImage(
              image: NetworkImage(
                'https://cdn3d.iconscout.com/3d/premium/thumb/man-avatar-6299539-5187871.png',
              ),
            ),
          ),
        ),

        // space between profile picture & information
        const SizedBox(
          width: 16,
        ),

        // user's information
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // text welcome back
            Text(
              'Welcome Back!',
              style: kPoppinsBold.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 4,
              ),
            ),

            // the day user open the app
            Text(
              getCurrentFormattedDate(),
              style: kPoppinsRegular.copyWith(
                color: kGrey,
                fontSize: SizeConfig.blockSizeHorizontal! * 3,
              ),
            ),
          ],
        )
      ],
    );
  }
}
