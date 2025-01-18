import 'package:flutter/material.dart';
import 'package:hr/features/addRequest/presentation/components/request_component.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/addRequest/presentation/screens/add_request_screen.dart';
import '../../features/checkIn/presentation/screens/check_in_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';

class Routes {
  static const String intialRoutes = '/';
   static const String welcomeScreen = '/welcomeScreen';
   static const String loginScreen = '/loginScreen';
   static const String homeScreen = '/homeScreen';
   static const String addRequestScreen = '/addRequestScreen';
   static const String checkInScreen = '/checkInScreen';
   static const String requestComponentScreen = '/requestComponentScreen';

}

class AppRoutes {
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      case  Routes.intialRoutes:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

        case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

        case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

        case Routes.addRequestScreen:
        return MaterialPageRoute(builder: (_) => const AddRequestScreen());


        case Routes.checkInScreen:
        return MaterialPageRoute(builder: (_) => const CheckInScreen());


        case Routes.requestComponentScreen:
        return MaterialPageRoute(builder: (_) => const RequestComponent());



      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Found Route")),
          ),
        );
    }
  }
}