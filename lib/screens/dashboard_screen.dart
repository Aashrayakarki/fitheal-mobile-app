import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text("THIS IS THE DASHBOARD SCREEN",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dinner_dining), label: 'Meal Plans'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_gymnastics), label: 'Exercise'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
