// import 'package:flutter/material.dart';
// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';
import 'package:flutter_application_1/core/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();

  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  logo(),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      AppString.signUpnText,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),

                  InkWell(
                    onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()),
                    ),
                    child: const Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: AppString.haveAnAcount),
                            TextSpan(
                              text: "Register",
                              style: TextStyle(
                                color: Color.fromARGB(255, 23, 42, 165),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Text(AppString.donotHaveAnAccount),
                  SizedBox(height: 25),
                  Text(
                    AppString.username,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 5),
                  Textfield(
                    hintText: AppString.username,
                    controller: username,
                    icon: AppIcons.username,
                    validator: AuthValidators.validateUsername,
                  ),
                  SizedBox(height: 10),
                  Text(
                    AppString.email,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 5),
                  Textfield(
                    hintText: " Enter your email ",
                    controller: email,
                    icon: AppIcons.email,
                    validator: AuthValidators.validateEmail,
                  ),
                  SizedBox(height: 10),

                  Text(
                    AppString.password,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Textfield(
                    hintText: AppString.password,
                    controller: password,
                    icon: AppIcons.password,
                    validator: AuthValidators.validatePassword,
                  ),
                  SizedBox(height: 10),
                  Text(
                    AppString.confirmPassword,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Textfield(
                    hintText: "Confirm Password",
                    controller: confirmPass,
                    icon: Icons.lock,
                    validator: (value) =>
                        AuthValidators.validateConfirmPassword(
                          value,
                          confirmPass.text, // نمرر الباسورد الأصلي هنا
                        ),
                  ),

                  SizedBox(height: 10),
                  Text(
                    AppString.phone,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Textfield(
                    hintText: AppString.phone,
                    controller: phone,
                    icon: AppIcons.phone,
                    validator: AuthValidators.validatePhoneNumber,
                  ),
                  SizedBox(height: 20),
                  Buttom(
                    onPressed: () {
                      context.read<AuthCubitCubit>().signUp(
                        email.text.trim(),
                        password.text.trim(),
                        // plus username/phone if you add them
                      );
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Registration Successful'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppString.errorMessage),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    icon: AppIcons.signUp,
                    child: Text(AppString.signUp),
                  ),
                  // Buttom(onPressed: () {}, child: Text(AppString.loginText)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
