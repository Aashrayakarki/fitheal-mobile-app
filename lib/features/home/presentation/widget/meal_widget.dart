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
    return Container(
      constraints: BoxConstraints(
        maxHeight:
            MediaQuery.of(context).size.height * 0.75, // Adjust as needed
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: mealList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75, // Adjusted for better layout
        ),
        itemBuilder: (context, index) {
          final meal = mealList[index];
          final imageUrl = '${ApiEndpoints.imageUrl}${meal.mealImage}';

          return InkWell(
            onTap: () {
              _showMealDetails(context, meal);
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
      ),
    );
  }

  void _showMealDetails(BuildContext context, MealEntity meal) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(meal.mealName),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '${ApiEndpoints.imageUrl}${meal.mealImage}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                meal.mealDescription,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
