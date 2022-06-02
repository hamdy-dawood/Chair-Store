import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../animation/animation.dart';
import '../../../main.dart';
import '../ForgetPasswordScreen/forget_password.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showSignUpPage;

  const LoginScreen({Key? key, required this.showSignUpPage}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                  color: Color(0xFFFC6B68), strokeWidth: 5),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (error) {
      print(error);
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: error.message.toString(),
        ),
      );
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF5EFF1),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: w,
        height: h,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                FadeAnimation(
                  delay: 1,
                  child: Text(
                    'Hey,\nLogin Now.',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  delay: 1.5,
                  child: Row(
                    children: [
                      Text('if you are new/',
                          style:
                              TextStyle(color: Colors.black, fontSize: 13)),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: widget.showSignUpPage,
                        child: const Text('Create New',
                            style: TextStyle(
                                color: Color(0xFFFC6B68),
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FadeAnimation(
                  delay: 2,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (_emailController) {
                      print(_emailController);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email must be not empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFC6B68),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFC6B68),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Email',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 15),
                        prefixIcon: const Icon(
                          FontAwesomeIcons.solidEnvelope,
                          size: 20,
                          color: Color(0xFFFC6B68),
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  delay: 2.5,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    onChanged: (_passwordController) {
                      print(_passwordController);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must be not empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFC6B68),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFC6B68),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Password',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 15),
                        prefixIcon: const Icon(
                          FontAwesomeIcons.solidEnvelope,
                          size: 20,
                          color: Color(0xFFFC6B68),
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  delay: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?/',
                          style:
                              TextStyle(color: Colors.black, fontSize: 13)),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgetPassword();
                          }));
                        },
                        child: const Text('Reset',
                            style: TextStyle(
                                color: Color(0xFFFC6B68),
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                FadeAnimation(
                  delay: 3.5,
                  child: GestureDetector(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        print(_emailController);
                        print(_passwordController);
                        signIn();
                      }
                    },
                    child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFFFC6B68),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFC6B68),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: const Center(
                            child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  delay: 4,
                  child: Center(
                      child: Text(
                    'Or connect using',
                    style: TextStyle(color: Colors.black),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  delay: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/icons/facebook.png',
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/icons/apple.png',
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/icons/google.png',
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
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
