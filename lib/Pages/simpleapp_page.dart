import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_supabase/util/constantes.dart';

class SimpleApp extends StatefulWidget {
  const SimpleApp({super.key});

  @override
  State<SimpleApp> createState() => _SimpleAppState();
}

class _SimpleAppState extends State<SimpleApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Desarrollo App"),
      backgroundColor: const Color(0xffDE8971),),
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
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.book,
                    size: 200,
                    color: Colors.deepPurple,
                  ),
                  Text("Dentro de la App",
                  style: GoogleFonts.bebasNeue(color: Colors.black54, fontSize: 48),),

                  smallGap,]
              ),
            )
          )
        )
      )
    );  
  }
}