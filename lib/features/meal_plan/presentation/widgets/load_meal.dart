import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/exercise/presentation/viewmodel/exercise_view_model.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:final_assignment/features/meal_plan/presentation/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadMeal extends StatelessWidget {
  final WidgetRef ref;
  final List<MealEntity> lstMeal;
  const LoadMeal({super.key, required this.lstMeal, required this.ref});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lstMeal.length,
      itemBuilder: ((context, index) => ListTile(
            title: Text(lstMeal[index].mealName),
            subtitle: Text(lstMeal[index].mealId ?? ""),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                        'Are you sure you want to delete ${lstMeal[index].mealName}?'),
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
                                .read(mealViewModelProvider.notifier)
                                .deleteMeal(lstMeal[index]);
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
