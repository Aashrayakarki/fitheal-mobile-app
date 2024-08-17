import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/splash/presentation/navigator/splash_view_navigator.dart';
import 'package:final_assignment/features/welcome/presentation/view/welcome_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final welcomeNavigatorProvider = Provider<WelcomeNavigator>((ref) {
  return WelcomeNavigator();
});

class WelcomeNavigator with SplashViewRoute, LoginViewRoute {}

mixin WelcomeRoute {
  openWelcomeView() {
    NavigateRoute.popAndPushRoute(const WelcomeView());
  }
}
