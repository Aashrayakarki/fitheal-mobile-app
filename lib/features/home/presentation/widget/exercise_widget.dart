import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class ExerciseWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<ExerciseEntity> exerciseList;

  const ExerciseWidget({
    super.key,
    required this.ref,
    required this.exerciseList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: exerciseList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final exercise = exerciseList[index];
        final imageUrl =
            '${ApiEndpoints.imageUrl}${exercise.exerciseThumbnail}';

        return InkWell(
          onTap: () {
            _showExerciseVideo(context, exercise);
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
                        exercise.exerciseName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Calories: ${exercise.exerciseCalories} kcal',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Time: ${exercise.exerciseTime} min',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Level: ${exercise.exerciseLevel}',
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

  void _showExerciseVideo(BuildContext context, ExerciseEntity exercise) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(exercise.exerciseName),
          content: AspectRatio(
            aspectRatio: 16 / 9,
            child: ExerciseVideoPlayer(
                videoUrl: '${ApiEndpoints.imageUrl}${exercise.exerciseVideo}'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class ExerciseVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const ExerciseVideoPlayer({super.key, required this.videoUrl});

  @override
  _ExerciseVideoPlayerState createState() => _ExerciseVideoPlayerState();
}

class _ExerciseVideoPlayerState extends State<ExerciseVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    print('Loading video from URL: ${widget.videoUrl}'); // Log the URL
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.play();
        }
      }).catchError((error) {
        if (mounted) {
          setState(() {
            _isError = true;
          });
          if (kDebugMode) {
            print('Error loading video: $error');
          }
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isError) {
      return const Center(
        child:
            Text('Failed to load video', style: TextStyle(color: Colors.red)),
      );
    }

    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
