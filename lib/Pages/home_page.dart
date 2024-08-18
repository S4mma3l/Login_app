import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_supabase/util/constantes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),
      backgroundColor: const Color(0xffDE8971),
      ),
      body: Container(
        decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: <Color>[
                Color(0xffDE8971),
                Color(0xff7B6079),
                Color(0xffA7D0CD),
                Color(0xffFFE9D6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //icono
                  const Icon(
                    Icons.apps,
                    size: 200,
                    color: Colors.deepPurple,),
                  smallGap,
                  //texto
                  Text(
                    "Hola, Bienvenido",
                    style: GoogleFonts.anton(color:const Color(0xff2A629A), fontSize: 48),
                     ),
                  largeGap,
                  //boton de ingreso
                  MaterialButton(onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Container(
                              padding: const EdgeInsets.all(14.0),
                              decoration: BoxDecoration(color: const Color(0xffDE8971),
                              borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text("Sign In"),
                            ),
                  ),
                  smallGap,
                  //boton de registro
                  MaterialButton(onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(color: const Color(0xffDE8971),
                              borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text("Sign Up"),
                            ),
                  ),
                  smallGap,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}