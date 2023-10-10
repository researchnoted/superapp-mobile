import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile/animation/FadeAnimation.dart';
import 'package:superapp_mobile/app_styles.dart';
import 'package:superapp_mobile/auth/fetchs.dart';
import 'package:superapp_mobile/common/globals.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';
import 'package:superapp_mobile/home.dart';
import 'package:superapp_mobile/news_detail_screen.dart';
import 'package:superapp_mobile/presentation/components/empty_research.dart';
import 'package:superapp_mobile/size_config.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class ScheduleResearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScheduleResearchPageState();
}

class _ScheduleResearchPageState extends State<ScheduleResearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: HomeScreen(),
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
          researchData = researchList.data;
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
          Row(
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
          ),
          const SizedBox(height: 20),
          Container(
              child: DatePicker(DateTime.now(),
                  height: 100,
                  width: 60,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: const Color(0xFF029456),
                  selectedTextColor: kWhite,
                  dateTextStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      color: kGrey))),
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
                    top: 60,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
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
