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
                // ref.read(batchViewModelProvider.notifier).getBatches();
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
            // Switch(
            //     value: isDark,
            //     onChanged: (value) {
            //       setState(() {
            //         isDark = value;
            //         // ref.read(isDarkThemeProvider.notifier).updateTheme(value);
            //       });
            //     }),
          ],
        ),
        body: RefreshIndicator(
          color: Colors.green,
          onRefresh: () async {
            ref.read(exerciseViewModelProvider.notifier).resetState();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: 380,
                              height: 150,
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
                                    padding: const EdgeInsets.only(right: 10),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          "assets/images/fitheal.png",
                                          width: 150,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        // '${ApiEndpoints.imageUrl}${exerciseState.lstExercises[index].exerciseVideo}',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.45 *
                                        MediaQuery.of(context).size.width,
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
                                        ),
                                        Text(
                                          exerciseState.lstExercises[index]
                                              .exerciseCalories,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          '${exerciseState.lstExercises[index].exerciseTime} minutes',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
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
