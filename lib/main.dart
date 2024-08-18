import 'package:flutter/material.dart';
import 'package:login_supabase/Pages/home_page.dart';
import 'package:login_supabase/Pages/signin_page.dart';
import 'package:login_supabase/Pages/signup_page.dart';
import 'package:login_supabase/Pages/simpleapp_page.dart';
import 'package:login_supabase/util/constantes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {

  await Supabase.initialize(
    url: "tu url de supabase",
    anonKey: "tu key de supabase");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: client.auth.currentSession != null ? '/simpleapp' : '/',
      routes: {
        '/' : (context) => const HomePage(),
        '/signin' : (context) => const SignInPage(),
        '/signup' : (context) => const SignUpPage(),
        '/simpleapp' : (context) => const SimpleApp(),
      },
    );
  }
}
