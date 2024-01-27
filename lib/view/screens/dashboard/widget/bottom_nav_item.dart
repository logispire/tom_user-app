import 'package:flutter/material.dart';
import 'package:sixam_mart/util/colors.dart';
class BottomNavItem extends StatelessWidget {
  final IconData iconData;
  final Function? onTap;
  final bool isSelected;
  const BottomNavItem(
      {Key? key, required this.iconData, this.onTap, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: Icon(iconData,
            color: isSelected ? bottomSelectedColor: bottomUnSelectedColor,
            // color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
            size: 25),
        onPressed: onTap as void Function()?,
      ),
    );
  }
}
