import 'package:flutter/material.dart';
import 'package:moviebooker/core/colors.dart';
import 'package:moviebooker/core/icons.dart'; // Import the icons file

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10), // Adjust padding as needed
      decoration: BoxDecoration(
        color: AppColors.darkPurple, // Dark background color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: AppColors.darkPurple,
          selectedItemColor: Colors.white, // Active icon color
          unselectedItemColor: Colors.grey, // Inactive icon color
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: ImageIcon(AssetImage(AppIcons.dashboard)),
              ), // Adjust icon size
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: ImageIcon(AssetImage(AppIcons.watch)),
              ), // Adjust icon size
              label: 'Watch',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: ImageIcon(AssetImage(AppIcons.media)),
              ), // Adjust icon size
              label: 'Media Library',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: ImageIcon(AssetImage(AppIcons.more)),
              ), // Adjust icon size
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}
