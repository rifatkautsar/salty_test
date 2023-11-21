import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:salty_test/services/repository.dart';
import 'package:salty_test/widget/card_users.dart';

import '../../bloc/home/home_page_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomePageBloc(service: Service())..add(LoadUserData()),
      child: Scaffold(
        body: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            if (state is HomePageLoading) {
              return Center(
                child: LoadingAnimationWidget.flickr(
                    leftDotColor: Colors.red,
                    rightDotColor: Colors.blue,
                    size: 20),
              );
            } else if (state is HomePageLoaded) {
              final user = state.userModel;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemCardUsers(
                          imgUrl: user[index].avatar,
                          email: user[index].email,
                          firstName: user[index].firstName,
                          lastName: user[index].lastName);
                    },
                    itemCount: user.length),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
