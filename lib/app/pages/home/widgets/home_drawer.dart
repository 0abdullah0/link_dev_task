import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_dev_task/app/utils/recources.dart';
import 'package:link_dev_task/app/utils/ui_functions.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: ListView(
        padding: const EdgeInsets.all(8).r,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(Resources.profile),
                radius: 30,
              ),
              title: Text(
                'Welcome',
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
              subtitle: Text(
                'Tony Roshdy',
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ),
          ListTile(
            onTap: () => _popUpSection(context, 'Explore'),
            leading: Image.asset(
              Resources.explore,
              width: 28.r,
              height: 28.r,
            ),
            title: Text(
              'Explore',
              style: TextStyle(fontSize: 18.sp, color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () => _popUpSection(context, 'Live Chat'),
            leading: Image.asset(
              Resources.live,
              width: 28.r,
              height: 28.r,
            ),
            title: Text(
              'Live Chat',
              style: TextStyle(fontSize: 18.sp, color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () => _popUpSection(context, 'Gallery'),
            leading: Image.asset(
              Resources.gallery,
              width: 28.r,
              height: 28.r,
            ),
            title: Text(
              'Gallery',
              style: TextStyle(fontSize: 18.sp, color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () => _popUpSection(context, 'Wish List'),
            leading: Image.asset(
              Resources.wishlist,
              width: 28.r,
              height: 28.r,
            ),
            title: Text(
              'Wish List',
              style: TextStyle(fontSize: 18.sp, color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () => _popUpSection(context, 'E-Magazine'),
            leading: Image.asset(
              Resources.eMagazine,
              width: 28.r,
              height: 28.r,
            ),
            title: Text(
              'E-Magazine',
              style: TextStyle(fontSize: 18.sp, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  void _popUpSection(BuildContext context, String sectionName) =>
      UiFunctions.showMyDialog(context, sectionName);
}
