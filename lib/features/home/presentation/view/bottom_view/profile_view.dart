import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(profileViewModelProvider);

    if (currentUser.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.network(
                  '${ApiEndpoints.imageUrl}${currentUser.authEntity!.image!}'),
            ),
            const SizedBox(height: 10),
            Text(
              "First Name : ${currentUser.authEntity?.fname ?? ""}",
              style: const TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      );
    }
  }
}

