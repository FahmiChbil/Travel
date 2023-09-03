import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:mylasttravelapp/Auth/presentation/widgets/default_sncakBar.dart';
import 'package:mylasttravelapp/Auth/presentation/widgets/default_text_form_field.dart';

import '../bloc/cubit/auth_cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static String id = "/sign_up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool obs2 = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("018a78"),
          elevation: 0,
        ),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoadingAuthState) {
              isLoading = true;
            } else if (state is SucceesAuthState) {
              isLoading = false;
              ScaffoldMessenger.of(context)
                  .showSnackBar(defaultSnack("Register Succees", Colors.black));
            } else if (state is FailureAuthState) {
              isLoading = false;
              ScaffoldMessenger.of(context)
                  .showSnackBar(defaultSnack(state.errorMessage, Colors.black));
            }
          },
          child: ModalProgressHUD(
              inAsyncCall: isLoading,
              progressIndicator: const CircularProgressIndicator(),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      DefaultTextFomField(
                        suff: null,
                        myHint: "Enter your email",
                        myLabel: "Email",
                        emailcontroller: emailController,
                        myvalidator: (value) {
                          if (value == null) {
                            return "please add valid email";
                          }
                          if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value) ==
                              false) {
                            return "not valid email ";
                          }
                          return null;
                        },
                        obs: false,
                      ),
                      DefaultTextFomField(
                          suff: IconButton(
                              onPressed: () {
                                setState(() {
                                  obs2 = !obs2;
                                });
                              },
                              icon: Icon(obs2 == false
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined)),
                          emailcontroller: passwordController,
                          myHint: "Your passsword",
                          myLabel: "Password",
                          myvalidator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter your password";
                            }
                            return null;
                          },
                          obs: obs2),
                      ElevatedButton(
                          style: const ButtonStyle(enableFeedback: false),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().signUp(
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                          child: const Text("Register"))
                    ],
                  ))),
        ));
  }
}
