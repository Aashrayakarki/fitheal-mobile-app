import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/auth/presentation/navigator/register_navigator.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:final_assignment/features/home/presentation/navigator/home_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
  MockSpec<RegisterViewNavigator>(),
  MockSpec<HomeViewNavigator>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUsecase;
  late ProviderContainer container;
  late LoginViewNavigator mockLoginViewNavigator;
  late RegisterViewNavigator mockRegisterViewNavigator;
  late HomeViewNavigator mockHomeViewNavigator;

  setUp(
    () {
      mockAuthUsecase = MockAuthUseCase();
      mockLoginViewNavigator = MockLoginViewNavigator();
      mockRegisterViewNavigator = MockRegisterViewNavigator();
      mockHomeViewNavigator = MockHomeViewNavigator();
      container = ProviderContainer(
        overrides: [
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(mockLoginViewNavigator, mockRegisterViewNavigator, mockHomeViewNavigator, mockAuthUsecase),
          )
        ],
      );
    },
  );

  test('check for the inital state in Auth state', () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
    expect(authState.imageName, isNull);
  });

  // Login test
  test('login test with valid username and password', () async {
    // Arrange
    when(mockAuthUsecase.loginUser('kiran', 'kiran123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    when(mockAuthUsecase.loginUser('kiran', 'kiran1234'))
        .thenAnswer((_) => Future.value(
              Left(
                Failure(error: 'Invalid Credentails'),
              ),
            ));

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('kiran', 'kiran123');

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  test('login test with valid username and password', () async {
    // Arrange
    const correctEmail = 'test';
    const correctPassword = 'test';

    when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
      final email = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(
          email == correctEmail && password == correctPassword
              ? const Right(true)
              : Left(Failure(error: 'Invalid')));
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('test', 'test');

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  test('Register User', () {});

  tearDown(
    () {
      container.dispose();
    },
  );
}