import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:flutter/material.dart';

class ExerciseWidget extends StatelessWidget {
  final List<ExerciseEntity> exerciseList;
  const ExerciseWidget({super.key, required this.exerciseList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: exerciseList.length,
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.yellow[100],
          child: Center(
            child: Text(
              '${exerciseList[index].exerciseName}, ${exerciseList[index].exerciseTime}, ${exerciseList[index].exerciseCalories}, ${exerciseList[index].exerciseLevel}, ${exerciseList[index].exerciseVideo}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
