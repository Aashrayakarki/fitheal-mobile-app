import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/auth/presentation/view/register_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerViewNavigatorProvider =
    Provider((ref) => RegisterViewNavigator());

// This class will call any view I call
class RegisterViewNavigator with LoginViewRoute {}

// Anyone who want to call register view
mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.popAndPushRoute(const RegisterView());
  }
}
