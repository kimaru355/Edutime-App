import 'package:edutime/core/constants/app_constants.dart';
import 'package:edutime/core/theme/app_text_styles.dart';
import 'package:edutime/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_shadows.dart';

/// Custom Bottom Navigation Bar with Role-Based Conditional Rendering
///
/// This widget provides a customizable bottom navigation bar that adapts
/// based on user roles:
/// - **Students**: 4 navigation items (Home, Schedule, Venues, Profile)
/// - **Elevated Roles**: 5 items with a centered circular action button
///
/// ## Usage Example:
/// ```dart
/// CustomBottomNavigation(
///   currentIndex: _currentIndex,
///   userRole: UserRole.student,
///   onTap: (index) {
///     setState(() {
///       _currentIndex = index;
///     });
///   },
/// )
/// ```
///
/// ## Index Mapping:
/// **Student (4 items):**
/// - 0: Home
/// - 1: Schedule
/// - 2: Venues
/// - 3: Profile
///
/// **Elevated Roles (5 items):**
/// - 0: Home
/// - 1: Schedule
/// - 2: Elevated Action (Circular Button)
/// - 3: Venues
/// - 4: Profile
///
/// Note: Venues and Profile shift indices when elevated mode is active.
class CustomBottomNavigation extends StatelessWidget {
  /// The currently selected navigation item index
  ///
  /// Must be between 0 and (items.length - 1)
  final int currentIndex;

  /// Callback triggered when a navigation item is tapped
  ///
  /// Receives the index of the tapped item as parameter
  final ValueChanged<int> onTap;

  /// The user's role, determines which navigation variant to display
  ///
  /// - [UserRole.student]: Shows 4 standard items
  /// - Other roles: Shows 5 items with elevated action button
  final UserRole userRole;

  const CustomBottomNavigation({super.key, required this.currentIndex, required this.onTap, required this.userRole});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = _buildNavItems(theme);

    return SafeArea(
      child: Container(
        height: 84.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
          boxShadow: AppShadows.lgInverse,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) => _navItem(item: items[index], onTap: () => onTap(index), isSelected: currentIndex == index, theme: theme)),
        ),
      ),
    );
  }

  /// Builds the list of navigation items based on user role
  ///
  /// Returns different item configurations:
  /// - **Students**: 4 items without elevated action
  /// - **Elevated Roles**: 5 items with centered elevated action at index 2
  ///
  /// Each standard item includes:
  /// - Label text
  /// - Inactive (outlined) icon
  /// - Active (filled) icon
  ///
  /// The elevated item includes:
  /// - No label
  /// - Single icon (white)
  /// - Circular background styling
  List<_NavItemData> _buildNavItems(ThemeData theme) {
    if (userRole == UserRole.student) {
      // Standard 4-item layout for students
      return [
        _NavItemData(
          label: 'Home',
          icon: SvgIconSize.regular(assetPath: AppConstants.homeOutlinedIcon, color: theme.unselectedWidgetColor),
          activeIcon: SvgIconSize.regular(assetPath: AppConstants.homeFilledIcon, color: theme.primaryColor),
          isElevated: false,
        ),
        _NavItemData(
          label: 'Schedule',
          icon: SvgIconSize.regular(assetPath: AppConstants.calendarOutlinedIcon, color: theme.unselectedWidgetColor),
          activeIcon: SvgIconSize.regular(assetPath: AppConstants.calendarFilledIcon, color: theme.primaryColor),
          isElevated: false,
        ),
        _NavItemData(
          label: 'Venues',
          icon: SvgIconSize.regular(assetPath: AppConstants.locationOutlinedIcon, color: theme.unselectedWidgetColor),
          activeIcon: SvgIconSize.regular(assetPath: AppConstants.locationFilledIcon, color: theme.primaryColor),
          isElevated: false,
        ),
        _NavItemData(
          label: 'Profile',
          icon: SvgIconSize.regular(assetPath: AppConstants.userOutlinedIcon, color: theme.unselectedWidgetColor),
          activeIcon: SvgIconSize.regular(assetPath: AppConstants.userFilledIcon, color: theme.primaryColor),
          isElevated: false,
        ),
      ];
    } else {
      // 5-item layout for elevated roles (classrep, faculty rep, admin)
      // Note: Elevated action button is inserted at index 2 (center position)
      return [
        _NavItemData(
          label: 'Home',
          icon: SvgIconSize.regular(assetPath: AppConstants.homeOutlinedIcon, color: theme.unselectedWidgetColor),
          activeIcon: SvgIconSize.regular(assetPath: AppConstants.homeFilledIcon, color: theme.primaryColor),
          isElevated: false,
        ),
        _NavItemData(
          label: 'Schedule',
          icon: SvgIconSize.regular(assetPath: AppConstants.calendarOutlinedIcon, color: theme.unselectedWidgetColor),
          activeIcon: SvgIconSize.regular(assetPath: AppConstants.calendarFilledIcon, color: theme.primaryColor),
          isElevated: false,
        ),
        // Elevated action button (centered at index 2)
        _NavItemData.elevated(
          icon: SvgIconSize.regular(assetPath: AppConstants.addOutlinedIcon, color: AppColors.white),
        ),
        _NavItemData(
          label: 'Venues',
          icon: SvgIconSize.regular(assetPath: AppConstants.locationOutlinedIcon, color: theme.unselectedWidgetColor),
          activeIcon: SvgIconSize.regular(assetPath: AppConstants.locationFilledIcon, color: theme.primaryColor),
          isElevated: false,
        ),
        _NavItemData(
          label: 'Profile',
          icon: SvgIconSize.regular(assetPath: AppConstants.userOutlinedIcon, color: theme.unselectedWidgetColor),
          activeIcon: SvgIconSize.regular(assetPath: AppConstants.userFilledIcon, color: theme.primaryColor),
          isElevated: false,
        ),
      ];
    }
  }

  /// Builds an individual navigation item widget
  ///
  /// Renders two different variants:
  /// 1. **Standard Item**: Icon + Label with active/inactive states
  /// 2. **Elevated Item**: Circular button with white icon (no label)
  ///
  /// Parameters:
  /// - [item]: Data model containing icon, label, and configuration
  /// - [onTap]: Callback when item is tapped
  /// - [isSelected]: Whether this item is currently selected
  /// - [theme]: Theme data for color/styling access
  Widget _navItem({required _NavItemData item, required VoidCallback onTap, required bool isSelected, required ThemeData theme}) {
    // Elevated role item (circular button at center)
    if (item.isElevated) {
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque, // Ensures full area is tappable
        child: Center(
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(color: theme.primaryColor, shape: BoxShape.circle),
            child: item.icon,
          ),
        ),
      );
    }

    // Standard navigation item (icon + label)
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, // Ensures full area is tappable
      child: Center(
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4.h, // Spacing between icon and label
            children: [
              // Show active icon when selected, fallback to inactive icon
              isSelected ? (item.activeIcon ?? item.icon) : item.icon,

              // Only show label if it exists (not null for elevated items)
              if (item.label != null) ...[
                Text(
                  item.label!,
                  style: AppTextStyles.captionSemiBold.copyWith(color: isSelected ? theme.primaryColor : theme.unselectedWidgetColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Internal data model for navigation items
///
/// Represents a single navigation item's configuration including
/// icons, label, and whether it's the special elevated action button.
///
/// Use the default constructor for standard items and the [elevated]
/// factory for the centered elevated action button.
class _NavItemData {
  /// Display label shown below the icon
  ///
  /// Null for elevated items (they don't have labels)
  final String? label;

  /// Icon widget displayed in inactive state
  ///
  /// For standard items: outlined icon with gray color
  /// For elevated items: white icon
  final Widget icon;

  /// Icon widget displayed in active/selected state
  ///
  /// Typically a filled version of the icon with primary color
  /// Null for elevated items (they don't have active states)
  final Widget? activeIcon;

  /// Flag indicating if this is the elevated role action button
  ///
  /// When true:
  /// - Renders as circular button
  /// - No label
  /// - Always uses primary color background
  /// - Icon is white
  final bool isElevated;

  /// Creates a standard navigation item
  ///
  /// Standard items have:
  /// - A label
  /// - Both inactive and active icons
  /// - State-based color changes
  _NavItemData({this.label, required this.icon, this.activeIcon, required this.isElevated});

  /// Factory constructor for elevated role action button
  ///
  /// Creates a special navigation item with:
  /// - No label
  /// - Single white icon
  /// - Circular primary-colored background
  /// - No active state (always looks the same)
  ///
  /// Example:
  /// ```dart
  /// _NavItemData.elevated(
  ///   icon: SvgIconSize.regular(
  ///     assetPath: AppConstants.addOutlinedIcon,
  ///     color: AppColors.white,
  ///   ),
  /// )
  /// ```
  factory _NavItemData.elevated({required Widget icon}) {
    return _NavItemData(label: null, icon: icon, activeIcon: null, isElevated: true);
  }
}

/// User role enumeration
///
/// Defines the available user roles in the system.
/// Used to determine which navigation bar variant to display.
///
/// Roles:
/// - [student]: Standard user, sees 4 navigation items
/// - [classRepresentative]: Elevated role, sees 5 items with action button
/// - [facultyRepresentative]: Elevated role, sees 5 items with action button
/// - [admin]: Elevated role, sees 5 items with action button
enum UserRole {
  /// Standard student user (4 navigation items)
  student,

  /// Class representative (5 navigation items with elevated action)
  classRepresentative,

  /// Faculty representative (5 navigation items with elevated action)
  facultyRepresentative,

  /// Administrator (5 navigation items with elevated action)
  admin,
}
