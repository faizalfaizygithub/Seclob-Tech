import 'package:flutter/material.dart';
import 'package:profile/view/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    const ProfilePage(),
    Icon(
      Icons.search,
    ),
    const Icon(Icons.camera)
  ];

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedFontSize: 17,
          unselectedFontSize: 14,
          backgroundColor: Theme.of(context).colorScheme.primary,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      body: pages[currentPage],
    );
  }
}
