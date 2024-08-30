import 'package:flutter/material.dart';
import 'package:movies_app_c11/tabs/category_browse/category_browse/category_browse_tab.dart';
import 'package:movies_app_c11/tabs/home/home_tab.dart';
import 'package:movies_app_c11/tabs/search/search_tab.dart';
import 'package:movies_app_c11/tabs/watch_list/watch_list_tab.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: AppColors.blackColor,
                icon: ImageIcon(AssetImage('assets/images/Home icon.png')),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/search-icon.png')),
                label: 'Search'),
            BottomNavigationBarItem(
                label: 'Browse',
                icon: ImageIcon(AssetImage('assets/images/browse_icon.png'))),
            BottomNavigationBarItem(
                label: 'WatchList',
                icon:
                    ImageIcon(AssetImage('assets/images/watch_list_icon.png'))),
          ]),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
     CategoryBrowseTab(),
    const WatchListTab()
  ];
}
