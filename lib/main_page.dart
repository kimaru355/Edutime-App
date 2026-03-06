import 'package:edutime/elevated_action_page.dart';
import 'package:edutime/home_page.dart';
import 'package:edutime/profile_page.dart';
import 'package:edutime/schedule_page.dart';
import 'package:edutime/venues_page.dart';
import 'package:flutter/material.dart';

import 'core/widgets/custom_bottom_navigation.dart';

class MainPage extends StatefulWidget {
  final UserRole userRole;

  const MainPage({super.key, required this.userRole});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _buildPages(),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        userRole: widget.userRole,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  /// Builds pages based on user role
  List<Widget> _buildPages() {
    if (widget.userRole == UserRole.student) {
      // 4 pages for students (no elevated action page)
      return [
        const HomePage(),
        const SchedulePage(),
        const VenuesPage(),
        const ProfilePage(),
      ];
    } else {
      // 5 pages for elevated roles (with elevated action page at index 2)
      return [
        const HomePage(),
        const SchedulePage(),
        const ElevatedActionPage(), // Index 2
        const VenuesPage(),
        const ProfilePage(),
      ];
    }
  }
}