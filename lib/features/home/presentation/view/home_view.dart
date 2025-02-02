import 'package:final_assignment/features/exercise/presentation/view/exercise_view.dart';
import 'package:final_assignment/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:final_assignment/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:final_assignment/features/meal_plan/presentation/view/meal_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int selectedIndex = 0;
  List<Widget> lstScreen = [
    const DashboardView(),
    const ExerciseView(),
    const MealView(),
    const ProfileView(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstScreen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_gymnastics),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dining_rounded),
            label: 'Meal Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
