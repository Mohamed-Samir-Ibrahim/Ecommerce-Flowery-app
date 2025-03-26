import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/presentation/home/tabs/cart/cart_screen.dart';
import 'package:flowery/presentation/home/tabs/category/category_screen.dart';
import 'package:flowery/presentation/home/tabs/home/home_screen.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: NavBarIcon(name: 'home_icon'),
            activeIcon: NavBarIcon(name: 'home_icon_active'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(name: 'category_icon'),
            activeIcon: NavBarIcon(name: 'category_icon_active'),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(name: 'cart_icon'),
            activeIcon: NavBarIcon(name: 'cart_icon_active'),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(name: 'profile_icon'),
            activeIcon: NavBarIcon(name: 'profile_icon_active'),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorManager.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Image.asset('assets/icon/$name.png'),
    );
  }
}
