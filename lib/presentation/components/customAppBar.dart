import 'package:superapp_mobile/presentation/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final TextStyle? textStyle;
  final Widget? flexibleSpace;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;
  final double? paddingBottom;

  const CustomAppBar(
      {Key? key,
      this.title,
      this.titleWidget,
      this.textStyle,
      this.flexibleSpace,
      this.leading,
      this.bottom,
      this.centerTitle,
      this.paddingBottom,
      this.actions = const []})
      : super(key: key);
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle ?? true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: leading,
      title: titleWidget ??
          Text(
            title ?? "",
            style: textStyle ??
                TextStyle(
                    color: white,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    fontSize: 20.sp),
          ),
      flexibleSpace: flexibleSpace ??
          Container(
              decoration: BoxDecoration(
            gradient: appBarGradient,
          )),
      bottom: bottom,
      
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
