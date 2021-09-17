import 'dart:convert';
import 'package:breaking_bad_api/views/login/states/login_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginStates> {


  String idToken;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginController() : super(LoginInitial());

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    // asvasvavvsa
    // print('cancel order');
    return super.close();
  }

  static LoginController of(context) => BlocProvider.of(context);

  Future<String> login(String email, String password) async {
    emit(LoginLoading());
    final response = await Dio().post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA1h4pMtKoYT3enVNX8XHt0ZH6jXZ-S7ps',
        data: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}),
        options: Options(validateStatus: (status) {
      return status < 500;
    }));
    try{
    final data = response.data as Map;
    if (data.containsKey('idToken')) {
      idToken = data['idToken'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('idToken', idToken);
      return 'ok';
    } else
      emit(LoginInitial());
    return '>>>>error>>>>';
  }catch(e,s){
      print(e);
      print(s);

    }





    // @override
    // Future<void> closePasswordController() {
    //   print('Closed!');
    //   emailController.dispose();
    //   return super.close();
    // }
    // @override
    // Future<void> closeEmailController() {
    //   print('Closed!');
    //   passwordController.dispose();
    //   return super.close();
    // }


  }
  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('idToken');
  }
}
