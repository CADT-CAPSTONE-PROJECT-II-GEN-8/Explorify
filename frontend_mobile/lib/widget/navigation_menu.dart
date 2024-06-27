import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/screens/home/home_screen.dart';
import 'package:frontend_mobile/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 0,
        selectedIndex: context.watch<NavigationProvider>().selectedIndex,
        onDestinationSelected: (index) {
          if (index == 3) {
            // Navigate to the profile screen using Navigator.pushNamed
            Navigator.pushNamed(context, '/profile');
          } else {
            // Update the selected index for other destinations
            context.read<NavigationProvider>().updateSelectedIndex(index);
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
            selectedIcon: Icon(
              Icons.home_rounded,
              color: AppColor.primary,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_document),
            label: 'Article',
            selectedIcon: Icon(
              Icons.edit_document,
              color: AppColor.primary,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'History',
            selectedIcon: Icon(
              Icons.history,
              color: AppColor.primary,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
            selectedIcon: Icon(
              Icons.person,
              color: AppColor.primary,
            ),
          ),
        ],
      ),
      body: context
          .watch<NavigationProvider>()
          .screens[context.watch<NavigationProvider>().selectedIndex],
    );
  }
}

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    const ProfileScreen(),
  ];

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
