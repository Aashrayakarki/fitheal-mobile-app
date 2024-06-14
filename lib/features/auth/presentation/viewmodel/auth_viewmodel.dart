import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/auth/presentation/navigator/register_navigator.dart';
import 'package:final_assignment/features/auth/presentation/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  final loginNavigator = ref.read(loginViewNavigatorProvider);
  final registerNavigator = ref.read(registerViewNavigatorProvider);

  return AuthViewModel(
      ref.read(authUseCaseProvider), loginNavigator, registerNavigator);
});

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.authUseCase, this.loginNavigator, this.registerNavigator)
      : super(AuthState.initial());

  final AuthUseCase authUseCase;
  final LoginViewNavigator loginNavigator;
  final RegisterViewNavigator registerNavigator;

  void obsurePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  void addStudent({required AuthEntity auth}) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.addStudent(auth);
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: l.error, color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: 'Student Added Successfully');
    });
  }

  void login({required String username, required String password}) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.login(username, password);
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: "Invalid Credentials", color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: 'Login Successful');
      // loginNavigator.openHomeView();
    });
  }

  void openLoginView() {
    registerNavigator.openLoginView();
  }

  void openRegisterView() {
    loginNavigator.openRegisterView();
  }
}
