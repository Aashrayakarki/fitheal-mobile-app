import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<MealEntity> mealList;

  const MealWidget({
    super.key,
    required this.ref,
    required this.mealList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Put this otherwise it will take all the space
      shrinkWrap: true,
      itemCount: mealList.length,
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.5),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // ref
            //     .read(batchViewmodelProvider.notifier)
            //     .getStudentsByBatch(context, batchList[index].batchId!);
          },
          child: Card(
            color: Colors.green[100],
            child: Center(
              child: Text(
                mealList[index].mealName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
