import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  // Check for camera permission
  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  final _gap = const SizedBox(height: 8);

  final _key = GlobalKey<FormState>();

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();

  bool isObscure = true;

  InputDecoration _inputDecoration(String hintText, {IconData? icon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _gap, _gap, _gap, _gap, _gap, _gap, //gap
                  const Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Please enter your credentials to continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  _gap,
                  _gap,
                  _buildTextFormField(
                    labelText: 'First Name:',
                    hintText: 'Enter your first name',
                    controller: _fnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    labelText: 'Last Name:',
                    hintText: 'Enter your last name',
                    controller: _lnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    labelText: 'Phone no:',
                    hintText: 'Enter your phone number',
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    icon: Icons.phone,
                  ),
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
                  _buildTextFormField(
                    labelText: 'Height:',
                    hintText: 'Enter your height',
                    controller: _heightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your height';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    labelText: 'Weight:',
                    hintText: 'Enter your Weight',
                    controller: _weightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Weight';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    labelText: 'Age:',
                    hintText: 'Enter your age',
                    controller: _ageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    labelText: 'Gender:',
                    hintText: 'Enter your gender',
                    controller: _genderController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your gender';
                      }
                      return null;
                    },
                  ),
                  _gap,
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          // Register
                          var user = AuthEntity(
                            fname: _fnameController.text,
                            lname: _lnameController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            height: _heightController.text,
                            weight: _weightController.text,
                            age: _ageController.text,
                            gender: _genderController.text,
                          );
                          ref
                              .read(authViewModelProvider.notifier)
                              .registerUser(user);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  _gap,
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ref
                                    .read(authViewModelProvider.notifier)
                                    .openLoginView();
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
    );
  }
}
