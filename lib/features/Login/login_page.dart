import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salty_test/bloc/login/auth_bloc.dart';
import 'package:salty_test/features/Home/home_page.dart';
import 'package:salty_test/utilities/color.dart';
import 'package:salty_test/widget/bottom_nav.dart';
import 'package:salty_test/widget/custom_text.dart';
import 'package:salty_test/widget/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child:  Form(
          key: _key,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomTextColorWithSize(
                    text: 'Login',
                    color: ColorConstant.black,
                    size: 30,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 15.0),
                const CustomTextColorWithSize(
                    text: 'Please Sign in to Continue',
                    color: ColorConstant.grey,
                    size: 16),
                const SizedBox(height: 15.0),
                const CustomTextColorWithSize(
                    text: 'Email', color: ColorConstant.black, size: 14),
                const SizedBox(height: 10.0),
                CustomTextField(
                    hintText: 'Enter Your Email',
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    obscureText: false),
                const SizedBox(height: 15.0),
                const CustomTextColorWithSize(
                    text: 'Password', color: ColorConstant.black, size: 14),
                const SizedBox(height: 10.0),
                CustomTextField(
                    hintText: 'Enter Your Password',
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true),
                const SizedBox(height: 15.0),
                const Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextColorWithSize(
                      text: 'Forgot Password?',
                      color: Colors.blueAccent,
                      size: 14,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(ColorConstant.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        try {
                          await authBloc.login(usernameController.text, passwordController.text);
                          authBloc.tokenStream.listen((String? token) {
                            if (token != null) {
                              Get.offAll(() => const BottomNav());
                            } else {
                              print('User Not Logged in');
                            }
                          });
                          //String? storedToken = await authBloc.getStoredToken();
                        } catch (error) {
                          print('Login Failed: $error');
                        }
                      }
                    },
                    child: const CustomTextColorWithSize(
                        text: 'Login',
                        color: Colors.white,
                        size: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextColorWithSize(
                        text: 'Don\'t have an account? ',
                        color: ColorConstant.black,
                        size: 14,
                        fontWeight: FontWeight.bold),
                    CustomTextColorWithSize(
                        text: 'Sign Up',
                        color: Colors.blueAccent,
                        size: 14,
                        fontWeight: FontWeight.bold),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    ));
  }
}
