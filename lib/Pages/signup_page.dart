import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_supabase/util/constantes.dart';



class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> createUser({
    required final String email,
    required final String password,
  }) async {
    final response = await client.auth.signUp(
      email: email,
      password: password,
    ); 
    final error = response.user;
    if (error == null) {
      return true;
    } else {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up"),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.apps,
                  size: 200,
                  color: Colors.deepPurple,),

                  Text("Registrate",
                  style: GoogleFonts.bebasNeue(color: const Color(0xff2A629A), fontSize: 48),),

                  largeGap,
              
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffA7D0CD),
                        borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: ("Email"),
                          ),
                        ),
                      ),
                    ),
                  ),

                  smallGap,
              
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffA7D0CD),
                        borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: ("Password"),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),
                  ),

                  smallGap,
              
                  MaterialButton(
                    onPressed: () async {
                      final userValue = await createUser(email: 
                      _emailController.text, password: 
                      _passwordController.text);
                      if (userValue == true) {
                        Navigator.pushReplacementNamed(context, '/signin');
                        context.showErrorMessage("Exito");
                      }
                    }, 
                    child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(color: const Color(0xffDE8971),
                              borderRadius: BorderRadius.circular(12),
                              ),
                          child: const Text("Sign Up"),
                        ),
                    )
              
              
              
                ],),
            ),
          ),
        ),),
    );
  }
}


