import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/exercise/presentation/viewmodel/exercise_view_model.dart';
import 'package:final_assignment/features/exercise/presentation/widgets/load_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseView extends ConsumerStatefulWidget {
  const ExerciseView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddExerciseViewState();
}

class _AddExerciseViewState extends ConsumerState<ExerciseView> {
  final exerciseNameController = TextEditingController();
  final exerciseTimeController = TextEditingController();
  final exerciseCaloriesController = TextEditingController();
  final exerciseLevelController = TextEditingController();
  final exerciseVideoController = TextEditingController();

  var gap = const SizedBox(height: 8);
  @override
  Widget build(BuildContext context) {
    var exerciseState = ref.watch(exerciseViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Management'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              gap,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Add Exercise',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              TextFormField(
                controller: exerciseNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Exercise Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter exercise name';
                  }
                  return null;
                },
              ),
              gap,
              TextFormField(
                controller: exerciseTimeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Exercise Time',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter exercise time';
                  }
                  return null;
                },
              ),
              gap,
              TextFormField(
                controller: exerciseCaloriesController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Exercise Calories',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter exercise calories';
                  }
                  return null;
                },
              ),
              gap,
              TextFormField(
                controller: exerciseLevelController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Exercise Level',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter exercise level';
                  }
                  return null;
                },
              ),
              gap,
              TextFormField(
                controller: exerciseVideoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Exercise Video',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter exercise video';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ExerciseEntity exercise = ExerciseEntity(
                        exerciseName: exerciseNameController.text,
                        exerciseTime: exerciseTimeController.text,
                        exerciseCalories: exerciseCaloriesController.text,
                        exerciseLevel: exerciseLevelController.text,
                        exerciseVideo: exerciseVideoController.text);
                    ref
                        .read(exerciseViewModelProvider.notifier)
                        .addExercise(exercise);
                  },
                  child: const Text('Add Exercise'),
                ),
              ),
              gap,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'List of Exercises',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              if (exerciseState.isLoading) ...{
                const CircularProgressIndicator(),
              } else if (exerciseState.error != null) ...{
                Text(exerciseState.error!),
              } else if (exerciseState.lstExercises.isNotEmpty) ...{
                Expanded(
                  child: LoadExercise(
                    lstExercise: exerciseState.lstExercises,
                    ref: ref,
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
