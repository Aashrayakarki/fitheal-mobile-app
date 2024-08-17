import 'package:final_assignment/features/splash/presentation/navigator/splash_view_navigator.dart';
import 'package:final_assignment/features/welcome/presentation/navigator/welcome_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final welcomeViewModelProvider = StateNotifierProvider<WelcomeViewModel, bool>(
  (ref) => WelcomeViewModel(ref.read(welcomeNavigatorProvider), ref.read(splashViewNavigatorProvider)),
);

class WelcomeViewModel extends StateNotifier<bool> {
  WelcomeViewModel(this.welcomeNavigator, this.splashViewNavigator) : super(false);
  final WelcomeNavigator welcomeNavigator;
  final SplashViewNavigator splashViewNavigator;

  openWelcomeView() {
    splashViewNavigator.openWelcomeView();
  }

  openLoginView() {
    welcomeNavigator.openLoginView();
  }
}
