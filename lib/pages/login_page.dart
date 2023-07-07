import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(230, 255, 254, 254),
        body: SizedBox(
          width: double.infinity,
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
                Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 60,
                alignment: Alignment.center,
                child: Text("Login Encarregados", style: GoogleFonts.acme(fontSize: 30),),
              ),
              const SizedBox(
                height: 60,
              ),
              const Icon(Icons.person, size: 120, color: Colors.black,),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 30,
                alignment: Alignment.center,
                child: const Row( children: [
                  Expanded(flex: 2, child: Text("Informe seu usuario:")),
                  SizedBox(height: 20,),
                  Expanded(flex: 2, child: Text("Usuario"),),]
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 30,
                alignment: Alignment.center,
                child: const Row( children: [
                  Expanded(flex: 2, child: Text("Informe sua senha:")),
                  SizedBox(height: 20,),
                  Expanded(flex: 2, child: Text("Senha"),),]
                ),
              ),
              Expanded(child: Container(),),
              Container(
                width: double.infinity,
                color: Colors.amber,
                margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                height: 40,
                alignment: Alignment.center,
                child: const Text("Entrar"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 40,
                alignment: Alignment.center,
                child: const Text("Cadastre-se"),
              ),
              const SizedBox(
                height: 150,
              )
          ],
          ),
        ),
      ),
    );
  }
}