import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salty_test/services/repository.dart';

import '../../data/model/users_model.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final Service service;
  HomePageBloc({required this.service}) : super(HomePageInitial()) {
    on<HomePageEvent>((event, emit) async{
      emit(HomePageLoading());
      try{
        final List<UserData> userList = await service.fetchDataUsers(2);
        emit(HomePageLoaded(userModel: userList));
      } catch (error) {
        emit(HomePageError(message: error.toString()));
      }
    });
  }
}
