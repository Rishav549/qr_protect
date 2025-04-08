import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_protect/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:qr_protect/components/custombuttons.dart';
import 'package:qr_protect/components/textfield.dart';
import 'package:qr_protect/utilities/localStorage.dart';
import 'package:qr_protect/utilities/logger.dart';

import 'details.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
              "QRSVr",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            )),
        backgroundColor: Colors.black,
      ),
      body: BlocProvider(
        create: (_) => AuthenticationBloc(),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationLoadingState) {
              const Center(child: CircularProgressIndicator());
            }
            if (state is AuthenticationLoggedInState) {
              Fluttertoast.showToast(msg: "Signed In");
              SecureLocalStorage.setValue("uid", state.uid);
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
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black),
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
                    label: "Sign Up",
                    onPressed: () async {
                      if (passwordController.text.length < 8) {
                        Fluttertoast.showToast(
                            msg: "Password must be at least 8 characters long",
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white);
                        return;
                      }
                      try {
                        context.read<AuthenticationBloc>().add(
                            AuthenticationCheckUserEvent(
                                email: emailController.text,
                                password: passwordController.text));
                      } catch (e) {
                        CustomLogger.error(e);
                      }
                    },
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
