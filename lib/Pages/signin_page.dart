import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_supabase/util/constantes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  // Función que maneja el inicio de sesión
  Future<String?> userLogin({
    required final String email,
    required final String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user != null) {
        return user.id;
      } else {
        return null; // Devuelve null si no se obtiene un usuario
      }
    } catch (e) {
      print('Error during login: $e');
      return null; // Devuelve null en caso de error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In"),
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
                  const Icon(
                    Icons.apps,
                    size: 200,
                    color: Colors.deepPurple,
                  ),
                  Text("Inicia Sesion",
                  style: GoogleFonts.bebasNeue(color: const Color(0xff2A629A), fontSize: 48),),

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
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email"),
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
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password"),
                            obscureText: true,
                        ))
                      
                    ),
                  ),
                  smallGap,
                  isLoading
                      ? const CircularProgressIndicator()
                      : MaterialButton(
                          onPressed: () async {
                            // Inicia el estado de carga
                            setState(() {
                              isLoading = true;
                            });
              
                            // Llamada al método de inicio de sesión
                            final loginValue = await userLogin(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
              
                            // Verifica si el widget sigue montado
                            if (!mounted) return;
              
                            // Finaliza el estado de carga
                            setState(() {
                              isLoading = false;
                            });
              
                            // Navega o muestra un mensaje según el resultado
                            if (loginValue != null) {
                              Navigator.pushReplacementNamed(context, '/simpleapp');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Correo o Contraseña Incorrecto!"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(color: const Color(0xffDE8971),
                              borderRadius: BorderRadius.circular(12),
                              ),
                          child: const Text("Sign In"),
                        )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

