import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/application/auth/auth_controller.dart';
import 'package:whatsapp/application/routes/routes.dart';
import 'package:whatsapp/data/them/dark_theme.dart';
import 'package:whatsapp/data/them/light_theme.dart';
import 'package:whatsapp/firebase_options.dart';
import 'package:whatsapp/presentation/home/home_page.dart';
import 'package:whatsapp/presentation/userinfo/user_info_page.dart';
import 'package:whatsapp/presentation/welcom_page/welcom_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'whtasapp',
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: ThemeMode.system,
            home: ref.watch(userInfoAuthProvider).when(
            data: (user) {
              FlutterNativeSplash.remove();
              if (user == null) return const WelcomePage();
              return const HomePage();
            },
            error: (error, trace) {
              return const Scaffold(
                body: Center(
                  child: Text('Something wrong happened'), 
                ),
              );
            },
            loading: () => const SizedBox(),
          ),
       onGenerateRoute: Routes.onGenerateRoute,
        );
  }
}
