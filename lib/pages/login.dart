import 'package:flutter/material.dart';
import 'package:jkuat_navigation/controllers/authController.dart';
import 'package:jkuat_navigation/utilities/toastDialog.dart';
import '../constants/AppStyle.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Sign In",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1.0,
                blurRadius: 1.0,
              ),
            ],
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Email Address",
                            hintStyle: TextStyle(fontSize: 13),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword
                                        ? hidePassword = false
                                        : hidePassword = true;
                                  });
                                },
                                icon: const Icon(Icons.remove_red_eye)),
                            hintText: "Password",
                            hintStyle: const TextStyle(fontSize: 13),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ToastDialogue()
                                .showToast("All fields Are Required", 0);
                          } else {
                            AuthController.loginUser(
                                context,
                                emailController.text.trim(),
                                passwordController.text.trim());
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppStyle.primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Forgot password?")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
