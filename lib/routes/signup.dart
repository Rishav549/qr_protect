import 'package:flutter/material.dart';
import 'package:qr_protect/components/custombuttons.dart';
import 'package:qr_protect/components/textfield.dart';

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
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          "QR Protect",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        )),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            "Sign Up",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),
          )),
          const SizedBox(
            height: 20,
          ),
          CustomInputField(
            controller: nameController,
            label: "Name",
            suffixIcon: const Icon(Icons.person),
          ),
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
            controller: phoneController,
            label: "Phone Number",
            suffixIcon: const Icon(Icons.phone),
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Details();
                }));
              },
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
