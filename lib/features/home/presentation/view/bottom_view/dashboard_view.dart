import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/features/exercise/presentation/viewmodel/exercise_view_model.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:final_assignment/features/home/presentation/widget/exercise_widget.dart';
import 'package:final_assignment/features/home/presentation/widget/meal_widget.dart';
import 'package:final_assignment/features/meal_plan/presentation/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final ScrollController _scrollController = ScrollController();
  int _exercisePage = 1;
  int _mealPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    // Initial data fetch
    ref.read(exerciseViewModelProvider.notifier).getAllExercises();
    ref.read(mealViewModelProvider.notifier).getAllMeals();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(exerciseViewModelProvider.notifier).getAllExercises();
      ref.read(mealViewModelProvider.notifier).getAllMeals();
    }
  }

  void _nextExercisePage() {
    setState(() {
      _exercisePage++;
    });
    ref.read(exerciseViewModelProvider.notifier).getAllExercises();
  }

  void _nextMealPage() {
    setState(() {
      _mealPage++;
    });
    ref.read(mealViewModelProvider.notifier).getAllMeals();
  }

  @override
  Widget build(BuildContext context) {
    final exerciseState = ref.watch(exerciseViewModelProvider);
    final mealState = ref.watch(mealViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard View'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(exerciseViewModelProvider.notifier).resetState();
              ref.read(mealViewModelProvider.notifier).resetState();
              showMySnackBar(message: 'Refreshing...');
            },
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              ref.read(homeViewModelProvider.notifier).logout();
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Exercises Available',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ExerciseWidget(
                      ref: ref,
                      exerciseList: exerciseState.lstExercises,
                    ),
                  ),
                  if (exerciseState.lstExercises.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _nextExercisePage,
                            child: const Text('Show more exercises'),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Meal Plans Available',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: MealWidget(
                      ref: ref,
                      mealList: mealState.lstMeals,
                    ),
                  ),
                  if (mealState.lstMeals.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _nextMealPage,
                            child: const Text('Show more meal plans'),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
