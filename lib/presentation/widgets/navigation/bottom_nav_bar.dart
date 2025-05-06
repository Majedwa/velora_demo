import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Theme.of(context).primaryColor,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            color: Colors.grey[600],
            tabs: const [
              GButton(
                icon: PhosphorIcons.house,
                text: 'الرئيسية',
              ),
              GButton(
                icon: PhosphorIcons.map_trifold,
                text: 'المسارات',
              ),
              GButton(
                icon: PhosphorIcons.compass,
                text: 'استكشف',
              ),
              GButton(
                icon: PhosphorIcons.map_pin,
                text: 'الخريطة',
              ),
              GButton(
                icon: PhosphorIcons.user,
                text: 'الملف',
              ),
            ],
            selectedIndex: currentIndex,
            onTabChange: (index) {
              switch (index) {
                case 0:
                  context.go('/');
                  break;
                case 1:
                  context.go('/paths');
                  break;
                case 2:
                  context.go('/explore');
                  break;
                case 3:
                  context.go('/map');
                  break;
                case 4:
                  context.go('/profile');
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}