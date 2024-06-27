import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Screens/SignIn/Blocs/signinblocs.dart';
import 'package:news_app/Screens/SignUp/Blocs/signupbloc.dart';
import 'package:news_app/Screens/Splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SignUpBloc()),
          BlocProvider(create: (_) => SignInBlocs()),
        ],
        child: MaterialApp(
            title: 'News App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: false,
            ),
            home: SplashScreen()),
      ),
    );
  }
}
