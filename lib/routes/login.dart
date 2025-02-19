import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_protect/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:qr_protect/components/custombuttons.dart';
import 'package:qr_protect/components/textfield.dart';
import 'package:qr_protect/routes/details.dart';
import 'package:qr_protect/routes/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade600,
        appBar: AppBar(
          title: const Center(
              child: Text(
            "QR Protect",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
          backgroundColor: Colors.black,
        ),
        body: BlocProvider(
          create: (_) => AuthenticationBloc(),
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationLoadingState) {
                const Center(child: CircularProgressIndicator());
              } else if (state is AuthenticationErrorState) {
                Fluttertoast.showToast(
                    msg: "Incorrect Phone Number or Password");
              } else if (state is AuthenticationLoggedInState) {
                Fluttertoast.showToast(msg: "Logged In");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Details();
                }));
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    controller: emailController,
                    label: "Email",
                    suffixIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    controller: passwordController,
                    label: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPass = !isPass;
                        });
                      },
                      icon: isPass
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.visibility_off),
                    ),
                    isPassword: !isPass,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomButton(
                      label: "Sign In",
                      onPressed: () {
                        context.read<AuthenticationBloc>().add(
                            AuthenticationLogInEvent(
                                email: emailController.text,
                                password: passwordController.text));
                      },
                      backgroundColor: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Signup();
                        }));
                      },
                      child: const Text(
                        "Create An Account/Sign Up",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ))
                ],
              );
            },
          ),
        ));
  }
}
