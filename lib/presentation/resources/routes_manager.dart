import 'package:flutter/material.dart';
import 'package:tut_app/presentation/forget_password_screen/forget_password_screen.dart';
import 'package:tut_app/presentation/login_screen/login_screen.dart';
import 'package:tut_app/presentation/main_screen/main_screen.dart';
import 'package:tut_app/presentation/on_board_screen/on_boarding_view/on_board_screen.dart';
import 'package:tut_app/presentation/register_screen/register_screen.dart';
import 'package:tut_app/presentation/resources/string_manager.dart';
import 'package:tut_app/presentation/splash_screen/splash_screen.dart';
import 'package:tut_app/presentation/stores_details_screen/stores_details_screen.dart';

class Routes{
  static const String splashScreen='/';
  static const String onBoardingScreen='/onBoardScreen';
  static const String loginScreen='/loginScreen';
  static const String registerScreen='/registerScreen';
  static const String mainScreen='/mainScreen';
  static const String storeDetails='/StoreDetails';
  static const String forgetPassword='/forgetPassword';

}
class RouteGenerator{
  static Route<dynamic> getRoutes(RouteSettings settings){
    switch (settings.name){
      case Routes.splashScreen:
      return MaterialPageRoute(builder: (_)=>const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_)=>const OnBoardScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=>const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_)=>const RegisterScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_)=>const MainScreen());
      case Routes.storeDetails:
        return MaterialPageRoute(builder: (_)=>const StoresDetailsScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_)=>const ForgetPasswordScreen());
      default:
        return unDefinedRoute();
    }

  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(title: const Text(AppStrings.noRouteFound),),
        body: const Center(child:Text(AppStrings.noRouteFound),),
    ));
  }
}