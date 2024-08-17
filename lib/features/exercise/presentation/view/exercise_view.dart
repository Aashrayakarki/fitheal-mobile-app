import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/features/exercise/presentation/viewmodel/exercise_view_model.dart';
import 'package:final_assignment/features/home/presentation/widget/exercise_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseView extends ConsumerStatefulWidget {
  const ExerciseView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends ConsumerState<ExerciseView> {
  final ScrollController _scrollController = ScrollController();
  int _exercisePage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    // Initial data fetch
    ref.read(exerciseViewModelProvider.notifier).getAllExercises();
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
    }
  }

  void _nextExercisePage() {
    setState(() {
      _exercisePage++;
    });
    ref.read(exerciseViewModelProvider.notifier).getAllExercises();
  }

  @override
  Widget build(BuildContext context) {
    final exerciseState = ref.watch(exerciseViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises View'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(exerciseViewModelProvider.notifier).resetState();
              showMySnackBar(message: 'Refreshing...');
            },
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              // Handle logout or other actions if needed
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
          ],
        ),
      ),
    );
  }
}
