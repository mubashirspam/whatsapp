import 'package:flutter/material.dart';
import 'package:whatsapp/domain/user_model.dart';
import 'package:whatsapp/presentation/contact/contact_page.dart';
import 'package:whatsapp/presentation/home/home_page.dart';
import 'package:whatsapp/presentation/login/login_page.dart';
import 'package:whatsapp/presentation/userinfo/user_info_page.dart';
import 'package:whatsapp/presentation/login/verification_page.dart';
import 'package:whatsapp/presentation/welcom_page/welcom_page.dart';


class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String userInfo = 'user-info';
  static const String home = 'home';
  static const String contact = 'contact';
  static const String chat = 'chat';
  static const String profile = 'profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => VerificationPage(
            smsCodeId: args['smsCodeId'],
            phoneNumber: args['phoneNumber'],
          ),
        );
      case userInfo:
        final String? profileImageUrl = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => UserInfoPage(
            profileImageUrl: profileImageUrl,
          ),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case contact:
        return MaterialPageRoute(
          builder: (context) => const ContactPage(),
        );
      // case chat:
      //   final UserModel user = settings.arguments as UserModel;
      //   return MaterialPageRoute(
      //     builder: (context) => ChatPage(user: user),
      //   );
      // case profile:
      //   final UserModel user = settings.arguments as UserModel;
      //   return PageTransition(
      //     child: ProfilePage(user: user),
      //     type: PageTransitionType.fade,
      //     duration: const Duration(milliseconds: 800),
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('No Page Route Provided'),
              ),
            );
          },
        );
    }
  }
}