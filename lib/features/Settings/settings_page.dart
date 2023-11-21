import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salty_test/bloc/login/auth_bloc.dart';
import 'package:salty_test/features/Login/login_page.dart';
import 'package:salty_test/widget/custom_text.dart';

import '../../utilities/color.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width,
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
                Get.defaultDialog(
                  title: 'Are you sure want to logout?',
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        await authBloc.logout();
                        Get.offAll(() => const LoginPage());
                      },
                      child: const CustomTextColorWithSize(
                          text: 'Yes', color: ColorConstant.black, size: 14),
                    ),
                  ),
                  cancel: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const CustomTextColorWithSize(
                          text: 'No', color: ColorConstant.black, size: 14),
                    ),
                  ),
                );
              },
              child: const CustomTextColorWithSize(
                text: 'Logout',
                color: Colors.white,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
