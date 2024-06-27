import 'package:news_app/Screens/SignIn/Models/signinmodels.dart';

abstract class SignInStates{}
class SignInInitialStates extends SignInStates{}
class SignInLoadingStates extends SignInStates{}
class SignInLoadedStates extends SignInStates{
  SignInModel signInModel;
  SignInLoadedStates({required this.signInModel});
}
class SignInErrorStates extends SignInStates{
  String errormsg;
  SignInErrorStates({required this.errormsg});
}