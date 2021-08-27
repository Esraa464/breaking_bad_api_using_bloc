import 'dart:convert';
import 'package:breaking_bad_api/views/signUp/states/sign_up_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController extends Cubit<SignUpStates> {
  SignUpController() : super(SignUpInitial());

  SignUpController of(context) => BlocProvider.of(context);

  Future<String> signUp(String email, String password) async {
    emit(SignUpLoading());
    final response = await Dio().post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA1h4pMtKoYT3enVNX8XHt0ZH6jXZ-S7ps',
        data: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}),
        options: Options(validateStatus: (status) {
      return status < 500;
    }));
    final data = response.data as Map;
    if (data.containsKey('idToken')) {
      return 'ok';
    } else
      emit(SignUpInitial());
    return '>>>>error,please try again>>>>';
  }
}
