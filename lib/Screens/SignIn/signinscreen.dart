import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Screens/Home/homescreen.dart';
import 'package:news_app/Screens/SignIn/Blocs/siginstates.dart';
import 'package:news_app/Screens/SignIn/Blocs/signinblocs.dart';
import 'package:news_app/Screens/SignIn/Controllers/signincontroller.dart';

import '../../Widgets/uihelper.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
        centerTitle: true,
      ),
      body: BlocConsumer<SignInBlocs,SignInStates>(listener: (context,state){
        if(state is SignInLoadedStates){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        }
        else if(state is SignInErrorStates){
           UiHelper.CustomDialog(state.errormsg, context);
        }
      },
      builder: (context,state){
        if(state is SignInLoadingStates){
          return Center(child: CircularProgressIndicator(),);
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField(
                emailController, "Enter Email", Icons.mail),
            UiHelper.CustomTextField(
                passwordController, "Enter Password", Icons.password),
            SizedBox(
              height: 30.h,
            ),
            UiHelper.CustomButton(() {
              SignInController.signIn(emailController.text.toString(), passwordController.text.toString(), context);
            }, "Sign In")
          ],
        );
      },
      )
    );
  }
}
