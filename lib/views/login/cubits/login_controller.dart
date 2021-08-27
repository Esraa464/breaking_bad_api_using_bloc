import 'dart:convert';
import 'package:breaking_bad_api/views/login/states/login_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginStates> {
  String idToken;

  LoginController() : super(LoginInitial());

  LoginController of(context) => BlocProvider.of(context);

  Future<String> login(String email, String password) async {
    emit(LoginLoading());
    final response = await Dio().post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA1h4pMtKoYT3enVNX8XHt0ZH6jXZ-S7ps',
        data: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}),
        options: Options(validateStatus: (status) {
      return status < 500;
    }));
    final data = response.data as Map;
    if (data.containsKey('idToken')) {
      idToken = data['idToken'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('idToken', idToken);
      return 'ok';
    } else
      emit(LoginInitial());
    return '>>>>error>>>>';
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('idToken');
  }
}
