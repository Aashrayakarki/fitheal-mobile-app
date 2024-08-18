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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Profile Information",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 20),
                    _buildInfoRow("First Name",
                        currentUser.authEntity?.fname ?? "", "👤"),
                    _buildInfoRow(
                        "Last Name", currentUser.authEntity?.lname ?? "", "👤"),
                    _buildInfoRow("Phone Number",
                        currentUser.authEntity?.phone ?? "", "📞"),
                    _buildInfoRow(
                        "Height", currentUser.authEntity?.height ?? "", "📏"),
                    _buildInfoRow(
                        "Weight", currentUser.authEntity?.weight ?? "", "⚖️"),
                    _buildInfoRow(
                        "Age", currentUser.authEntity?.age ?? "", "🎂"),
                    _buildInfoRow(
                        "Gender", currentUser.authEntity?.gender ?? "", "🚻"),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildInfoRow(String label, String value, String emoji) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$emoji $label:",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
