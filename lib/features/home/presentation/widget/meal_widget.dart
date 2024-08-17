import 'package:final_assignment/app/constants/api_endpoint.dart';
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
      shrinkWrap: true,
      itemCount: mealList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8, // Adjusted for better layout
      ),
      itemBuilder: (context, index) {
        final meal = mealList[index];
        final imageUrl = '${ApiEndpoints.imageUrl}${meal.mealImage}';

        return InkWell(
          onTap: () {
            // Handle tap event
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: Image(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.error, color: Colors.red),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.mealName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Time: ${meal.mealTime} min',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Calories: ${meal.mealCalories} kcal',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Proteins: ${meal.mealProteins} g',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Carbs: ${meal.mealCarbs} g',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
