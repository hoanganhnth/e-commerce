import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TSettingProfileTile extends StatelessWidget {
  const TSettingProfileTile(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.icon,
      this.trailing, this.onTap})
      : super(key: key);

  final String title, subTitle;
  final IconData icon;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          size: 28,
          color: TColors.primary,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        trailing: trailing,
      ),
    );
  }
}
