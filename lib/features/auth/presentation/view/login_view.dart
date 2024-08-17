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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _gap = const SizedBox(height: 8);
  bool isObscure = true;

  InputDecoration _inputDecoration(String hintText, {IconData? icon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black45),
      filled: true,
      fillColor: Colors.orange.withOpacity(0.1),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.orange, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.orangeAccent, width: 1),
      ),
      suffixIcon: icon != null ? Icon(icon, color: Colors.orangeAccent) : null,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    );
  }

  Widget _buildTextFormField({
    required String labelText,
    required String hintText,
    required TextEditingController controller,
    required String? Function(String?) validator,
    bool obscureText = false,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        _gap,
        TextFormField(
          controller: controller,
          decoration: _inputDecoration(hintText, icon: icon),
          validator: validator,
          obscureText: obscureText,
        ),
        _gap,
      ],
    );
  }

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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/fitheal.png'),
                      height: 140,
                      width: 200,
                    ),
                    _gap,
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
                        color: Colors.grey,
                      ),
                    ),
                    _gap, _gap,
                    _buildTextFormField(
                      labelText: 'Email address:',
                      hintText: 'Enter your email address',
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        // Regex pattern for email validation
                        final RegExp emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        );
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      icon: Icons.person,
                    ),
                    _buildTextFormField(
                      labelText: 'Password:',
                      hintText: 'Enter your password',
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: isObscure,
                      icon: isObscure ? Icons.visibility : Icons.visibility_off,
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
                    _gap, _gap,
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await ref
                              .read(authViewModelProvider.notifier)
                              .loginStudent(
                                _emailController.text,
                                _passwordController.text,
                              );
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
                    _gap, //gap

                    const Text(
                      'Or Login with',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),

                    _gap,

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
                    _gap, _gap, //gap
                    Center(
                      child: RichText(
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
                                color: Colors.orange,
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
