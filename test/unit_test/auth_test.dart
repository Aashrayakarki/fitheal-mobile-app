import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
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
            (ref) => AuthViewModel(
                mockLoginViewNavigator,
                mockRegisterViewNavigator,
                mockHomeViewNavigator,
                mockAuthUsecase),
          )
        ],
      );
    },
  );

  test('check for the initial state in Auth state', () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
  });

  // Login test
  test('login test with valid email and password', () async {
    // Arrange
    when(mockAuthUsecase.loginUser('yb@gmail.com', '123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    when(mockAuthUsecase.loginUser('aashraya@gmail.com', 'hello'))
        .thenAnswer((_) => Future.value(
              Left(
                Failure(error: 'Invalid Credentials'),
              ),
            ));

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('yb@gmail.com', '123');

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
      return Future.value(email == correctEmail && password == correctPassword
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

//create an account with all details
  test(
    'Register new user test with all details test',
    () async {
      // Arrange
      when(mockAuthUsecase.registerUser(any)).thenAnswer((innovation) {
        final auth = innovation.positionalArguments[0] as AuthEntity;

        return Future.value(
          auth.fname.isNotEmpty &&
                  auth.lname.isNotEmpty &&
                  auth.email.isNotEmpty &&
                  auth.phone.isNotEmpty &&
                  auth.password.isNotEmpty &&
                  auth.email.contains('@') &&
                  auth.email.contains('.')
              ? const Right(true)
              : Left(
                  Failure(error: 'Invalid'),
                ),
        );
      });

      // Act
      await container
          .read(authViewModelProvider.notifier)
          .registerUser(const AuthEntity(
            fname: 'aashraya',
            lname: 'karki',
            phone: "9808750214",
            email: 'ak@gmail.com',
            password: '1234',
            height: '170',
            weight: '70',
            age: '21',
            gender: 'male'
          ));

      final state = container.read(authViewModelProvider);

      // Assert
      expect(state.isLoading, false);
      expect(state.error, null);
    },
  );
//register new user with existing email then it should show error else it should register the user
  test("Register new user existing", () async {
    const authEntity = AuthEntity(
      fname: 'Harru',
      lname: 'Greaves',
      phone: '9821346589',
      password: '123456',
      email: 'ak@gmail.com',
      height: '170',
      weight: '70',
      age: '21',
      gender: 'male'
    );

    const existingUserEntity = AuthEntity(
      fname: 'aashraya',
      lname: 'karki',
      phone: "9808750214",
      email: 'ak@gmail.com',
      password: '1234',
      height: '170',
      weight: '70',
      age: '21',
      gender: 'male'
    );

    when(mockAuthUsecase.registerUser(any)).thenAnswer((invocation) {
      final authEntity = invocation.positionalArguments[0] as AuthEntity;

      return Future.value(authEntity.email != existingUserEntity.email
          ? const Right(true)
          : Left(Failure(error: 'User already exists')));
    });

    when(mockAuthUsecase.registerUser(any)).thenAnswer((invocation) {
      final authEntity = invocation.positionalArguments[0] as AuthEntity;

      return Future.value(authEntity.email != existingUserEntity.email
          ? const Right(true)
          : Left(Failure(error: 'email already exists')));
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .registerUser(authEntity);

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  test('login test with invalid email and password', () async {
    // Arrange
    const correctEmail = 'ak@gmail.com';
    const correctPassword = '1234';

    when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
      final username = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(
          username == correctEmail && password == correctPassword
              ? const Right(true)
              : Left(Failure(error: 'Invalid Credentials')));
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('ak7@gmail.com', '123');

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  tearDown(
    () {
      container.dispose();
    },
  );
}
