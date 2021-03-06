import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/homeInfoPage.dart';
import 'package:flutter_app/makeAPost.dart';
import 'package:flutter_app/settingsPage.dart';
//import 'eachdest.dart';
import 'explore.dart';
import 'favorites.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() {
  goToNavigationBar();
}

void goToNavigationBar() {
  runApp(
    MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      InfoPage(),
      ExplorePage(),
      Posts(),
      TheFavoritesPage(),
      SettingsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColor: CupertinoColors.activeGreen,
        inactiveColor: CupertinoColors.activeGreen,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.explore),
        title: ("Explore"),
        activeColor: CupertinoColors.activeBlue,
        inactiveColor: CupertinoColors.activeBlue,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.pages),
        title: ("Posts"),
        activeColor: Colors.deepOrange[700],
        inactiveColor: Colors.orange[700],
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: ("Favorites"),
        activeColor: Colors.red[700],
        inactiveColor: Colors.pinkAccent[400],
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColor: CupertinoColors.systemPurple,
        inactiveColor: CupertinoColors.systemIndigo,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style8, // Choose the nav bar style with this property.
    );
  }
}
