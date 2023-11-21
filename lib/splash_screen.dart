import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salty_test/bloc/login/auth_bloc.dart';
import 'package:salty_test/features/Login/login_page.dart';
import 'package:salty_test/widget/bottom_nav.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3), () => authBloc.isUserLoggedIn()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Lottie.asset('assets/loading_animation.json')),
              );
            } else if (snapshot.data == true) {
              return const BottomNav();
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}
