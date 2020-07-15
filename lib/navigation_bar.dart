import 'package:flutter/material.dart';
import 'attraction_cool.dart';
import 'explore.dart';
import 'favorites.dart';

void main() {
  goToNavigationBar();
}

void goToNavigationBar() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // This widget is the root of your application.

  PageController _pageController = PageController();

  List<Widget> _screen = [CoolPage(), ExplorePage(), FavoritesPage()];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedFontSize: 20.0,
        unselectedFontSize: 20.0,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color:
                  _selectedIndex == 0 ? Colors.lightGreen : Colors.lightGreen,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              color: _selectedIndex == 1 ? Colors.orange : Colors.deepOrange,
            ),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _selectedIndex == 2 ? Colors.pink : Colors.pink,
            ),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
