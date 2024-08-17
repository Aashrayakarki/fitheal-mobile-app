
import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/splash/presentation/view/splash_view.dart';
import 'package:final_assignment/features/welcome/presentation/navigator/welcome_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashViewNavigatorProvider = Provider<SplashViewNavigator>((ref) {
  return SplashViewNavigator();
});

class SplashViewNavigator with WelcomeRoute{}

mixin SplashViewRoute {
  openSplashView() {
    NavigateRoute.popAndPushRoute(const SplashView());
  }
}
