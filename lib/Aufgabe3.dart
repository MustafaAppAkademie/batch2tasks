import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    FavoritesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plattformspezifische Bottom Navigation Bar'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: tabs,
      ),
      bottomNavigationBar: PlatformSpecificBottomNavigationBar(
        tabs: tabs,
        selectedIndex: _selectedIndex,
        onTabChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Tab Content'),
    );
  }
}

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Tab Content'),
    );
  }
}

class FavoritesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Tab Content'),
    );
  }
}

class PlatformSpecificBottomNavigationBar extends StatelessWidget {
  final List<Widget> tabs;
  final int selectedIndex;
  final Function(int) onTabChanged;

  PlatformSpecificBottomNavigationBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTabBar(
            items: getTabBarItems(),
            currentIndex: selectedIndex,
            onTap: onTabChanged,
          )
        : BottomNavigationBar(
            items: getBottomNavigationBarItems(),
            currentIndex: selectedIndex,
            onTap: onTabChanged,
          );
  }

  List<BottomNavigationBarItem> getBottomNavigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Platform.isIOS ? Icon(CupertinoIcons.home) : Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Platform.isIOS ? Icon(CupertinoIcons.search) : Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon:
            Platform.isIOS ? Icon(CupertinoIcons.heart) : Icon(Icons.favorite),
        label: 'Favorites',
      ),
    ];
  }

  List<BottomNavigationBarItem> getTabBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart),
        label: 'Favorites',
      ),
    ];
  }
}
