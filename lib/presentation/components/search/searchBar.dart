import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp_mobile/constant.dart';

class OptionFilter {
  String name;
  bool isChecked;

  OptionFilter({required this.name, required this.isChecked});
}

enum TypeSearchBar { regular, withClear, withFilter }

class SearchBar extends StatefulWidget {
  /// [required] for the 'withClear' [searchType]
  final TextEditingController? controller;
  final EdgeInsets? margin;
  final Color? iconColor;
  final bool? openKeyboard;
  final Function(String)? isSubmitted;
  final String hintText;
  final List<BoxShadow>? boxShadowList;

  /// [required] for the 'listOption' [searchType]
  final List<OptionFilter>? listOption;

  /// Search bar with clear requires [controller]
  /// Search bar with filter requires [listOption]
  /// Regular search bar doesn't requires anything
  final TypeSearchBar searchType;

  SearchBar({
    Key? key,
    this.margin = EdgeInsets.zero,
    this.iconColor = grey,
    this.openKeyboard = false,
    this.controller,
    this.isSubmitted,
    this.boxShadowList,
    this.listOption,
    required this.hintText,
    required this.searchType,
  }) : assert(
    (searchType == TypeSearchBar.regular) || 
      ((searchType == TypeSearchBar.withClear) && (controller != null)) ||
      ((searchType == TypeSearchBar.withFilter) && (listOption != null)),
      "\n\nRead firstly\nPleast give either 'controller' or 'listOption' parameter \nbecause search bar '.withClear' requires 'controller' and \nsearch bar '.withFilter' requires 'listOption'"
  ), super(key: key) ;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isCheckedAll = false;

  List<OptionFilter> cloneList(List<OptionFilter> list, List<OptionFilter> targetList) {
    for (OptionFilter option in list) {
      targetList.add(OptionFilter(name: option.name, isChecked: option.isChecked));
    }
    return targetList;
  }

  void updateList(List<OptionFilter> list, List<OptionFilter> targetList) {
    for (int i = 0; i < list.length; i++) {
      if (targetList[i].name == list[i].name) {
        targetList[i].isChecked = list[i].isChecked;
      }
    }
  }

  bool allChecked(List<OptionFilter> options) {
    return options.where((option) => option.isChecked == true).length == options.length;
  }

  @override
  Widget build(BuildContext context) {
    List<OptionFilter> cloneOptions = [];
    cloneList(widget.listOption ?? [], cloneOptions);

    return Container(
      width: double.infinity,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: widget.boxShadowList ?? 
          [
            const BoxShadow(
                color: Color.fromRGBO(92, 94, 97, 0.06),
                offset: Offset(0, 12),
                blurRadius: 16,
                spreadRadius: -4),
            const BoxShadow(
                color: Color.fromRGBO(92, 94, 97, 0.03),
                offset: Offset(0, 4),
                blurRadius: 6,
                spreadRadius: -2)
          ],
      ),
      child: CupertinoTextField(
        style: TextStyle(
          fontSize: 14.sp,
        ),
        controller: widget.controller,
        autofocus: widget.openKeyboard ?? false,
        onSubmitted: widget.isSubmitted,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        placeholder: widget.hintText,
        placeholderStyle: TextStyle(
          color: neutralCaption,
          fontSize: 14.sp,
          fontFamily: "Plus Jakarta Sans"),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        suffix: searchBarPrefix(widget.searchType),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: Colors.white,
        ),
      ),
    );
  }

  Widget searchBarPrefix(TypeSearchBar searchType) {
    switch (searchType) {
      case TypeSearchBar.withClear:
        return Container(
          margin: EdgeInsets.only(right: 20.sp),
          child: Image.asset(
            'assets/icons/search_active.png',
            width: 20.sp,
            color: widget.iconColor ?? grey6,
          )
        );
      case TypeSearchBar.regular: 
        return Container(
          margin: EdgeInsets.only(right: 20.sp),
          child: Image.asset(
            'assets/icons/search_active.png',
            width: 20.sp,
            color: widget.iconColor ?? grey6,
          )
        );
      default:
        return SizedBox();
    }
  }
}