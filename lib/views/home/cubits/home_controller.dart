import 'package:breaking_bad_api/views/home/models/home_model.dart';
import 'package:breaking_bad_api/views/home/states/home_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController extends Cubit<HomeStates> {
  HomeController() : super(HomeInitial());

  static HomeController of(context) => BlocProvider.of(context);

  Dio _dio = Dio();

  List<CharactersModel> charactersList = [];

  Future<void> getData() async {
    emit(HomeLoading());
    try {
      final response =
          await _dio.get('https://www.breakingbadapi.com/api/characters');
      final data = response.data as List;
      data.forEach((element) {
        CharactersModel homeModel = CharactersModel.fromJson(element);
        charactersList.add(homeModel);
      });
    } catch (e) {
      print(e.toString());
    }
    emit(HomeInitial());
  }
}
