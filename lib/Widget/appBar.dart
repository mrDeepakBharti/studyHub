import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showAvatar;
  final bool showBackButton;
  final String? notificationIcon;
  final String? searchIcon;

  final VoidCallback? onAction1;
  final VoidCallback? onAction2;
  final String? avatarUrl;

  const CustomAppBar({
    Key? key,
    this.title,
    this.showAvatar = false,
    this.showBackButton = false,
    this.notificationIcon,
    this.searchIcon,
    this.onAction1,
    this.onAction2,
    this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            )
          : (showAvatar)
              ? Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundImage: avatarUrl != null
                        ? NetworkImage(avatarUrl!)
                        : AssetImage('asset/images/profile.png'),
                  ),
                )
              : null,
      title: title != null ? Text(title!) : null,
      actions: [
        if (notificationIcon != null)
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: onAction1,
              child: Container(
                height: 28.h,
                width: 18.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(notificationIcon!),
                        fit: BoxFit.contain)),
              ),
            ),
          ),
        if (searchIcon != null)
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: onAction2,
              child: Container(
                height: 28.h,
                width: 18.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(searchIcon!), fit: BoxFit.contain)),
              ),
            ),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
