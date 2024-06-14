import 'package:final_assignment/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'karkeez');
  final _passwordController = TextEditingController(text: 'Arsenal');
  final _gap = const SizedBox(height: 8);
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Welcome to Fitheal',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Hello there, sign in to continue!',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    _gap, _gap, _gap, _gap, _gap, _gap, //gap
                    TextFormField(
                      key: const ValueKey('username'),
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    _gap, _gap, _gap, _gap, //gap
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: authState.obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            authState.obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            ref
                                .read(authViewModelProvider.notifier)
                                .obsurePassword();
                          },
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        {
                          if (_formKey.currentState!.validate()) {
                            ref.read(authViewModelProvider.notifier).login(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                );
                          }
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    _gap, _gap, //gap

                    const Text(
                      'Or Login with',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),

                    _gap, _gap, //gap

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Color.fromARGB(255, 206, 201, 201),
                          width: 1.0,
                        ),
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/google.ico',
                              height: 20.0,
                              width: 35.0,
                            ),
                            const SizedBox(
                              width: 60.0,
                            ),
                            const Text(
                              'Connect with Google',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Brand Bold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _gap,
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(243, 0, 70, 221),
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/facebook.ico',
                                height: 35.0,
                                width: 30.0,
                              ),
                              const SizedBox(
                                width: 60.0,
                              ),
                              const Text(
                                'Connect with Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Brand Bold',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _gap, _gap, _gap, _gap, //gap
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Register',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ref
                                    .read(authViewModelProvider.notifier)
                                    .openRegisterView();
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
