import 'package:flutter_application_1/core/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_application_1/features/auth/screen/signUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Container(
          padding: const EdgeInsets.all(40),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 120),
                  logo(),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Signup()),
                    ),
                    child: const Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: " Don't have an account? ",
                              style: TextStyle(fontSize: 15),
                            ),
                            TextSpan(
                              text: AppString.signUp,
                              style: TextStyle(
                                color: Color.fromARGB(255, 23, 42, 165),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    AppString.loginText,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    AppString.loginToContinue,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textGreyColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    AppString.email,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 15),
                  Textfield(
                    hintText: AppString.emailHint,
                    controller: email,
                    icon: AppIcons.email,
                    validator: AuthValidators.validateEmail,
                  ),

                  SizedBox(height: 35),
                  Text(
                    AppString.password,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Textfield(
                    hintText: AppString.password,
                    controller: password,
                    icon: AppIcons.password,
                    validator: AuthValidators.validatePassword,
                  ),
                  SizedBox(height: 50),

                  Buttom(
                    onPressed: () {
                      context.read<AuthCubitCubit>().login(
                        email.text,
                        password.text,
                      );

                      if (_formKey.currentState!.validate()) {
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
                    icon: AppIcons.login,
                    child: Text(AppString.loginText),
                  ),

                  SizedBox(height: 25),

                  Buttom(
                    onPressed: () {
                      context.read<AuthCubitCubit>().signinWithGoogle();
                    },
                    icon: AppIcons.google,
                    child: Text(AppString.loginWithGoogle),
                  ),

                  // SizedBox(height: 0),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppString.forgetThePassword,
                      style: TextStyle(
                        color: AppColors.textGreyColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // Text(AppString.donotHaveAnAccount),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // signUp() {}
}
