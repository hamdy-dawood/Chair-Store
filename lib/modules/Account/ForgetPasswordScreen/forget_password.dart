import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../animation/animation.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showTopSnackBar(
        context,
        const CustomSnackBar.success(
          message: "password reset link sent! check your email",
        ),
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
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFC6B68),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFFF5EFF1),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: w,
        height: h,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: const Text("Forget password",
                        style: TextStyle(
                            color: Color(0xFFFC6B68),
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: const Text(
                        "Enter your Email and we send you a password reset link",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 22)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FadeAnimation(
                    delay: 1.5,
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  FadeAnimation(
                    delay: 2,
                    child: GestureDetector(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          print(_emailController);
                          passwordReset();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
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
                              'Reset',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
