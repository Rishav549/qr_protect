import 'package:flutter/material.dart';

import '../components/custombuttons.dart';
import '../components/textfield.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  var name1Controller = TextEditingController();
  var phone1Controller = TextEditingController();
  var name2Controller = TextEditingController();
  var phone2Controller = TextEditingController();
  var name3Controller = TextEditingController();
  var phone3Controller = TextEditingController();

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
                  "Emergency Contacts",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),
                )),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: name1Controller,
              label: "Contact Person Name 1",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: phone1Controller,
              label: "Contact Person Number 1",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: name2Controller,
              label: "Contact Person Name 2",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: phone2Controller,
              label: "Contact Person Number 2",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: name3Controller,
              label: "Contact Person Name 3",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: phone3Controller,
              label: "Contact Person Number 3",
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                label: "Continue",
                onPressed: () {
                },
                backgroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
