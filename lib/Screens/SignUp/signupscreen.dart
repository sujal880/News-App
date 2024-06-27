import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Screens/SignIn/signinscreen.dart';
import 'package:news_app/Screens/SignUp/Blocs/signupbloc.dart';
import 'package:news_app/Screens/SignUp/Blocs/signupstates.dart';
import 'package:news_app/Screens/SignUp/Controllers/signupcontroller.dart';
import 'package:news_app/Widgets/uihelper.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
        ),
        body: BlocConsumer<SignUpBloc, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpLoadedStates) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
            } else if (state is SignUpErrorStates) {
              UiHelper.CustomDialog(state.errormsg, context);
            }
          },
          builder: (context, state) {
            if (state is SignUpLoadingStates) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.CustomTextField(
                    emailController, "Enter Email", Icons.mail),
                UiHelper.CustomTextField(
                    passwordController, "Enter Password", Icons.password),
                UiHelper.CustomTextField(
                    usernameController, "Enter Username", Icons.person),
                SizedBox(
                  height: 30.h,
                ),
                UiHelper.CustomButton(() {
                  SignUpController.signUp(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                      usernameController.text.toString(),
                      context);
                }, "Sign Up")
              ],
            );
          },
        ));
  }
}
