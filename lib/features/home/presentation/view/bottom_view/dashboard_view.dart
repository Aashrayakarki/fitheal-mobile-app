import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/features/exercise/presentation/viewmodel/exercise_view_model.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exerciseState = ref.watch(exerciseViewModelProvider);

    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        if (_scrollController.position.extentAfter == 0) {
          ref.read(exerciseViewModelProvider.notifier).getAllExercises();
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard View'),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(exerciseViewModelProvider.notifier).resetState();
                showMySnackBar(message: 'Refreshing...');
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                ref.read(homeViewModelProvider.notifier).logout();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          color: Colors.green,
          onRefresh: () async {
            ref.read(exerciseViewModelProvider.notifier).resetState();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: exerciseState.lstExercises.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final exercises = exerciseState.lstExercises[index];

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Container(
                              width: double
                                  .infinity, // Ensure the container takes full width
                              height:
                                  170, // Adjusted height to accommodate the new tag
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width:
                                            240, // Set a fixed width for the image container
                                        height:
                                            150, // Set a fixed height for the image container
                                        alignment: Alignment.center,
                                        child: Image.network(
                                          '${ApiEndpoints.imageUrl}${exerciseState.lstExercises[index].exerciseVideo}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    // Use Expanded to let the text take the remaining space
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          exerciseState
                                              .lstExercises[index].exerciseName,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Handle long text
                                        ),
                                        Text(
                                          '${exerciseState.lstExercises[index].exerciseCalories} calories',
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Handle long text
                                        ),
                                        Text(
                                          '${exerciseState.lstExercises[index].exerciseTime} minutes',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Handle long text
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            exerciseState.lstExercises[index]
                                                .exerciseLevel,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                if (exerciseState.isLoading)
                  const CircularProgressIndicator(
                      color: Color.fromARGB(255, 255, 255, 255)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
