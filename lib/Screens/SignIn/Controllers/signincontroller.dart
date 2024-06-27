import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/SignIn/Blocs/signinblocs.dart';
import 'package:news_app/Widgets/uihelper.dart';

class SignInController{
 static signIn(String email,String password,BuildContext context){
    if(email=="" || password==""){
      return UiHelper.CustomDialog("Enter Required Field's", context);
    }
    else{
      context.read<SignInBlocs>().signin(email, password);
      log("Success");
    }
  }
}