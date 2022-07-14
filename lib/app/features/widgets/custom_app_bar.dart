import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/constants/locators.dart';
import '../../common/styles/app_colors.dart';
import '../../common/styles/app_fonts.dart';
import '../../common/styles/app_icons.dart';
import '../../common/utils/extensions.dart';
import 'custom_text.dart';

class AppBarData {
  static title(String title) {
    return CustomText.bold(
      text: title,
      size: AppFont.font24,
      color: AppColor.black,
    );
  }

  static arrowBackIcon({VoidCallback? callback}) {
    return IconButton(
      icon: SvgPicture.asset(
        AppIcons.arrowBack,
        height: 28.h,
        color: AppColor.grey900,
      ),
      onPressed: callback?? ()=> Locators.navigation.navigateBack(),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashRadius: 30.r,
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title,
    this.leading,
    Key? key,
  }) : super(key: key);
  final Widget? title;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? Container(),
      backgroundColor: AppColor.transparent,
      elevation: 0.0,
      leading: leading ?? Container(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
