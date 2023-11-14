import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp_mobile/animation/FadeAnimation.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/presentation/components/customAppBar.dart';
import 'package:superapp_mobile/presentation/components/heading.dart';
import 'package:superapp_mobile/presentation/components/inkEffect.dart';
import 'package:superapp_mobile/presentation/components/input.dart';

class AddResearchPage extends StatefulWidget {
  const AddResearchPage({super.key});

  @override
  State<AddResearchPage> createState() => _AddResearchPageState();
}

class _AddResearchPageState extends State<AddResearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Penelitian"),
      backgroundColor: kwhite,
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
                  "Buat Penelitian",
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
      body: SingleChildScrollView(
        child: Column(
            
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeAnimation(
          1.0,
          Text(
            'Buat Penelitian Baru',
            style: TextStyle(
              color: Colors.black87,
                fontSize: 28.sp,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.01.sp
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        FadeAnimation(
          1.2,
          Text(
            'Make new research and get the best\nresearch results',
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 15,
              color: Colors.grey
            ),
          ),
        ),
      ],
    ),
    Input(type: TypeInput.text, label: 'Judul Penelitian', controller: TextEditingController()),
    Input(type: TypeInput.text, label: 'Judul Penelitian', controller: TextEditingController()),
    Input(type: TypeInput.text, label: 'Judul Penelitian', controller: TextEditingController()),
    Input(type: TypeInput.text, label: 'Judul Penelitian', controller: TextEditingController()),
    Input(type: TypeInput.text, label: 'Judul Penelitian', controller: TextEditingController()),
    Input(type: TypeInput.text, label: 'Judul Penelitian', controller: TextEditingController()),
    Input(type: TypeInput.text, label: 'Judul Penelitian', controller: TextEditingController()),
            ],
          ),
        )
    );
  }
}
