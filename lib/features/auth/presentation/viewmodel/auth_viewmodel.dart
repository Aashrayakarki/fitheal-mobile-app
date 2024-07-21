import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/auth/presentation/navigator/register_navigator.dart';
import 'package:final_assignment/features/auth/presentation/state/auth_state.dart';
import 'package:final_assignment/features/home/presentation/navigator/home_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(loginViewNavigatorProvider),
    ref.read(registerViewNavigatorProvider),
    ref.read(homeViewNavigatorProvider),
    ref.read(authUseCaseProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.loginNavigator, this.registerNavigator, this.homeNavigator,
      this.authUseCase)
      : super(AuthState.initial());
  final AuthUseCase authUseCase;
  final LoginViewNavigator loginNavigator;
  final RegisterViewNavigator registerNavigator;
  final HomeViewNavigator homeNavigator;

  Future<void> registerUser(AuthEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.registerUser(user);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showMySnackBar(message: failure.error, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Successfully registered");
      },
    );
  }

  Future<void> loginUser(String email, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.loginUser(email, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showMySnackBar(message: "Incorrect Password", color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Successfully logged in");
        openHomeView();
      },
    );
  }

  void openLoginView() {
    registerNavigator.openLoginView();
  }

  void openRegisterView() {
    loginNavigator.openRegisterView();
  }

  void openHomeView() {
    loginNavigator.openHomeView();
  }
}
