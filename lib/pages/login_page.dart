import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listaccb/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userNameController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(230, 255, 254, 254),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    height: 60,
                    alignment: Alignment.center,
                    child: Text(
                      "Login Encarregados",
                      style: GoogleFonts.acme(fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 8,
                        child: Image.network(
                          "https://congregacaocristanobrasil.org.br/assets/images/logo-ccb-light.png",
                          height: 130,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        controller: userNameController,
                        onChanged: (value) {
                          debugPrint(value);
                        },
                        style: const TextStyle(color: Colors.black87),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            contentPadding: EdgeInsets.only(top: 0),
                            hintText: "Usuario",
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            )),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      height: 30,
                      child: TextField(
                        controller: passwordController,
                        obscureText: isObscureText,
                        onChanged: (value) {
                          debugPrint(value);
                        },
                        style: const TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          contentPadding: const EdgeInsets.only(top: 0),
                          hintText: "Senha",
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(
                                isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black87,
                              )),
                        ),
                      )),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 20),
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              if (userNameController.text.trim() ==
                                      "RenatoRodrigues" &&
                                  passwordController.text.trim() == "102030") {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Usuario ou senha incorretos")));
                              }
                              debugPrint(userNameController.text);
                              debugPrint(passwordController.text);
                            },
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber)),
                            child: Text(
                              "Entrar",
                              style: GoogleFonts.acme(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 40,
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Esqueceu a senha?",
                          style: GoogleFonts.acme(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 40,
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Cadastre-se",
                            style: GoogleFonts.acme(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ))),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
