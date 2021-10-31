import 'package:flutter/material.dart';
import '/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
      tabs: icons
          .asMap()
          .map(
            (index, element) => MapEntry(
              index,
              Tab(
                icon: Icon(
                  element,
                  color: index == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30.0,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
