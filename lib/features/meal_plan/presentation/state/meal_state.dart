import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';

class MealState {
  final bool isLoading;
  final String? error;
  final int page;
  final bool hasReachedMax;
  final List<MealEntity> lstMeals;

  const MealState({
    required this.isLoading,
    required this.error,
    required this.page,
    required this.hasReachedMax,
    required this.lstMeals,
  });

  factory MealState.initial() => const MealState(
        isLoading: false,
        error: null,
        page: 0,
        hasReachedMax: false,
        lstMeals: [],
      );

  MealState copyWith({
    bool? isLoading,
    String? error,
    int? page,
    bool? hasReachedMax,
    List<MealEntity>? meals,
  }) {
    return MealState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      lstMeals: meals ?? lstMeals,
    );
  }

  @override
  String toString() =>
      'ProductState { products: ${lstMeals.length}, isLoading: $isLoading, hasMaxReached: $hasReachedMax, page: $page }';
}
