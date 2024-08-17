import 'package:dartz/dartz.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:final_assignment/features/meal_plan/domain/usecases/meal_usecase.dart';
import 'package:final_assignment/features/meal_plan/presentation/viewmodel/meal_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'meal_test.mocks.dart';
import 'test_data/meal_entity_data.dart';

@GenerateNiceMocks([
  MockSpec<MealUsecase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;
  late MealUsecase mockMealUsecase;
  late List<MealEntity> lstMeals;
  setUp(
    () {
      mockMealUsecase = MockMealUsecase();
      lstMeals = MealTestData.getMealTestData();
      container = ProviderContainer(
        overrides: [
          mealViewModelProvider.overrideWith(
            (ref) => MealViewModel(mockMealUsecase),
          )
        ],
      );
    },
  );

  // Test initial state
  test('check meal initial state', () async {
    when(mockMealUsecase.getAllMeals(any))
        .thenAnswer((_) => Future.value(Right(lstMeals)));

    // Get all batches
    await container.read(mealViewModelProvider.notifier).getAllMeals();

    // Store the state
    final mealState = container.read(mealViewModelProvider);

    // Check the state
    expect(mealState.isLoading, false);
    expect(mealState.error, isNull);
    expect(mealState.lstMeals, isNotEmpty);
  });

  // Remove snackbar code from viewmodel vefore running this code
  test('add meal entity and return true if successfully added', () async {
    when(mockMealUsecase.getAllMeals(any))
        .thenAnswer((_) => Future.value(Right(lstMeals)));

    when(mockMealUsecase.addMeal(lstMeals[0]))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(mealViewModelProvider.notifier)
        .addMeal(lstMeals[0]);

    final batchState = container.read(mealViewModelProvider);

    expect(batchState.error, isNull);
  });

  tearDown(() {
    container.dispose();
  });
}