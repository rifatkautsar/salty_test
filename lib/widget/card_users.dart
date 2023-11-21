import 'package:flutter/material.dart';

import '../utilities/color.dart';
import 'custom_text.dart';

class ItemCardUsers extends StatelessWidget {
  final String imgUrl;
  final String email;
  final String firstName;
  final String lastName;

  const ItemCardUsers(
      {super.key,
      required this.imgUrl,
      required this.email,
      required this.firstName,
      required this.lastName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(imgUrl),
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextColorWithSize(
                      text: email, color: ColorConstant.black, size: 14),
                  Row(
                    children: [
                      CustomTextColorWithSize(
                          text: firstName, color: ColorConstant.grey, size: 14),
                      const SizedBox(width: 2.0),
                      CustomTextColorWithSize(
                          text: lastName, color: ColorConstant.grey, size: 14),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
