import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/exercise/presentation/viewmodel/exercise_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadExercise extends StatelessWidget {
  final WidgetRef ref;
  final List<ExerciseEntity> lstExercise;
  const LoadExercise({super.key, required this.lstExercise, required this.ref});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lstExercise.length,
      itemBuilder: ((context, index) => ListTile(
            title: Text(lstExercise[index].exerciseName),
            subtitle: Text(lstExercise[index].exerciseId ?? ""),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                        'Are you sure you want to delete ${lstExercise[index].exerciseName}?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ref
                                .read(exerciseViewModelProvider.notifier)
                                .deleteExercise(lstExercise[index]);
                          },
                          child: const Text('Yes')),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            ),
          )),
    );
  }
}
