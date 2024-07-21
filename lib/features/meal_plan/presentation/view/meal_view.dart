import 'dart:io';

import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:final_assignment/features/meal_plan/presentation/viewmodel/meal_view_model.dart';
import 'package:final_assignment/features/meal_plan/presentation/widgets/load_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class MealView extends ConsumerStatefulWidget {
  const MealView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddMealViewState();
}

class _AddMealViewState extends ConsumerState<MealView> {
  final mealNameController = TextEditingController();
  final mealTimeController = TextEditingController();
  final mealCaloriesController = TextEditingController();
  final mealProteinsController = TextEditingController();
  final mealCarbsController = TextEditingController();
  File? mealImageFile; 

  var gap = const SizedBox(height: 8);

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        mealImageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mealState = ref.watch(mealViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Management'),
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
                  'Add Meal',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              TextFormField(
                controller: mealNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Meal Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter meal name';
                  }
                  return null;
                },
              ),
              gap,
              TextFormField(
                controller: mealTimeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Meal Time',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter meal time';
                  }
                  return null;
                },
              ),
              gap,
              TextFormField(
                controller: mealCaloriesController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Meal Calories',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter meal calories';
                  }
                  return null;
                },
              ),
              gap,
              TextFormField(
                controller: mealProteinsController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Meal Proteins',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter protein level';
                  }
                  return null;
                },
              ),
              gap,
              TextFormField(
                controller: mealCarbsController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Meal Carbs',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter meal carbs';
                  }
                  return null;
                },
              ),
              gap,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: mealImageFile != null ? mealImageFile!.path : '',
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Meal Image',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: _pickImage,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    MealEntity meal = MealEntity(
                      mealName: mealNameController.text,
                      mealTime: mealTimeController.text,
                      mealCalories: mealCaloriesController.text,
                      mealProteins: mealProteinsController.text,
                      mealCarbs: mealCarbsController.text,
                      mealImage:
                          mealImageFile != null ? mealImageFile!.path : '',
                    );
                    ref.read(mealViewModelProvider.notifier).addMeal(meal);
                  },
                  child: const Text('Add Meal'),
                ),
              ),
              gap,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'List of Meals',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              if (mealState.isLoading) ...{
                const CircularProgressIndicator(),
              } else if (mealState.error != null) ...{
                Text(mealState.error!),
              } else if (mealState.lstMeals.isNotEmpty) ...{
                Expanded(
                  child: LoadMeal(
                    lstMeal: mealState.lstMeals,
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
