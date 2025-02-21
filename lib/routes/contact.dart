import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_protect/models/userDetails.dart';
import 'package:qr_protect/routes/home.dart';

import '../bloc/details_bloc/details_bloc.dart';
import '../components/custombuttons.dart';
import '../components/textfield.dart';

class Contact extends StatefulWidget {
  String name;
  String phone;
  String address;
  String vehicle;
  String bloodGrp;
  String height;
  String weight;
  String medication;

  Contact(
      {super.key,
      required this.name,
      required this.phone,
      required this.address,
      required this.vehicle,
      required this.bloodGrp,
      required this.height,
      required this.weight,
      required this.medication});

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
        body: BlocProvider(
            create: (_) => DetailsBloc(),
            child: BlocConsumer<DetailsBloc, DetailsStates>(
                listener: (context, state) {
              if (state is DetailsLoadingState) {
                const Center(child: CircularProgressIndicator());
              } else if (state is DetailsErrorState) {
                Fluttertoast.showToast(msg: "Error Uploading The data");
              } else if (state is DetailsLoadedState) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Home();
                }));
              }
            }, builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text(
                      "Emergency Contacts",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.white),
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
                          UserDetails newData = UserDetails(
                              name: widget.name,
                              phone: widget.phone,
                              address: widget.address,
                              vehicle: widget.vehicle,
                              bloodGrp: widget.bloodGrp,
                              height: widget.height,
                              weight: widget.weight,
                              medication: widget.medication,
                              name1: name1Controller.text,
                              phone1: phone1Controller.text,
                              name2: name2Controller.text,
                              phone2: phone2Controller.text,
                              name3: name3Controller.text,
                              phone3: phone3Controller.text);
                          context
                              .read<DetailsBloc>()
                              .add(DetailsPostEvent(data: newData));
                        },
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            })));
  }
}
