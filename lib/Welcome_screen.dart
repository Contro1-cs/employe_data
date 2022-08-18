
import 'package:flutter/material.dart';
import 'package:rest/add_page.dart';
import 'package:rest/home_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    AddPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Text("Home page", style: TextStyle(fontSize: 55),),),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        iconSize: 30,
        selectedFontSize: 13,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.black45,

        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Color(0xffF3EDF5)),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "Add",backgroundColor: Color(0xffF3EDF5)),
          // BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Color(0xffF3EDF5)),
          // BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search",backgroundColor: Color(0xffF3EDF5)),
          // BottomNavigationBarItem(icon: Icon(Icons.add),label: "Add",backgroundColor: Color(0xffF3EDF5)),
          // BottomNavigationBarItem(icon: Icon(Icons.apartment),label: "Events",backgroundColor: Color(0xffF3EDF5)),
          // BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile",backgroundColor: Color(0xffF3EDF5)),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

    );
  }


}
