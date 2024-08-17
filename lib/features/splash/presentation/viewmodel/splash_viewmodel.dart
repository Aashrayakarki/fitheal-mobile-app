import 'package:final_assignment/features/splash/presentation/navigator/splash_view_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashViewModelProvider = StateNotifierProvider<SplashViewModel, bool>(
  (ref) => SplashViewModel(ref.read(splashViewNavigatorProvider)),
);

class SplashViewModel extends StateNotifier<bool> {
  SplashViewModel(this.splashNavigator) : super(false);
  final SplashViewNavigator splashNavigator;
}
