import 'package:dartz/dartz.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/exercise/domain/usecases/exercise_usecase.dart';
import 'package:final_assignment/features/exercise/presentation/viewmodel/exercise_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exercise_test.mocks.dart';
import 'test_data/exercise_entity_data.dart';

@GenerateNiceMocks([
  MockSpec<ExerciseUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;
  late ExerciseUseCase mockExerciseUseCase;
  late List<ExerciseEntity> lstExercises;
  setUp(
    () {
      mockExerciseUseCase = MockExerciseUseCase();
      lstExercises = ExerciseTestData.getExerciseTestData();
      container = ProviderContainer(
        overrides: [
          exerciseViewModelProvider.overrideWith(
            (ref) => ExerciseViewModel(mockExerciseUseCase),
          )
        ],
      );
    },
  );

  // Test initial state
  test('check exercise initial state', () async {
    when(mockExerciseUseCase.getAllExercises())
        .thenAnswer((_) => Future.value(Right(lstExercises)));

    // Get all batches
    await container.read(exerciseViewModelProvider.notifier).getAllExercises();

    // Store the state
    final exerciseState = container.read(exerciseViewModelProvider);

    // Check the state
    expect(exerciseState.isLoading, false);
    expect(exerciseState.error, isNull);
    expect(exerciseState.lstExercises, isNotEmpty);
  });

  // Remove snackbar code from viewmodel vefore running this code
  test('add exercise entity and return true if successfully added', () async {
    when(mockExerciseUseCase.getAllExercises())
        .thenAnswer((_) => Future.value(Right(lstExercises)));

    when(mockExerciseUseCase.addExercise(lstExercises[0]))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(exerciseViewModelProvider.notifier)
        .addExercise(lstExercises[0]);

    final exerciseState = container.read(exerciseViewModelProvider);

    expect(exerciseState.error, isNull);
  });

  tearDown(() {
    container.dispose();
  });
}


