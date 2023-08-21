import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_dev_task/app/utils/recources.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      shadowColor: Colors.transparent,
      toolbarHeight: 0.1.sh,
      title: Text(
        title,
        style: TextStyle(fontSize: 20.sp, color: Colors.white),
      ),
      backgroundColor: Colors.black,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16).r,
          child: Image.asset(
            Resources.search,
            width: 25.r,
            height: 25.r,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.1.sh);
}
