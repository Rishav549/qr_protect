import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:qr_protect/components/textfield.dart';
import 'package:qr_protect/repo/details/image.dart';
import 'package:qr_protect/routes/contact.dart';
import 'package:qr_protect/utilities/logger.dart';

import '../components/custombuttons.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var vehicleController = TextEditingController();
  var bloodGroupController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var medicationController = TextEditingController();

  PlatformFile? _image;
  String imageUrl = '';

  Future<void> _pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _image = result.files.first;
        });
        imageUrl = (await uploadImage(_image!))!;
        CustomLogger.info(imageUrl);
      } else {
        // User canceled the picker
        print('No files selected');
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }

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
              "Details",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white),
            )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Upload Image:",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: _pickImage,
                    child: const Text(
                      "Choose File",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: nameController,
              label: "Name",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: phoneController,
              label: "Phone Number",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: addressController,
              label: "Address",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: vehicleController,
              label: "Vehicle Registration Number",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: bloodGroupController,
              label: "Blood Group",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: heightController,
              label: "Height",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: weightController,
              label: "Weight",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              controller: medicationController,
              label: "Other Medical Information(If Any)",
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                label: "Continue",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Contact(
                      name: nameController.text,
                      phone: phoneController.text,
                      vehicle: vehicleController.text,
                      address: addressController.text,
                      bloodGrp: bloodGroupController.text,
                      height: heightController.text,
                      weight: weightController.text,
                      medication: medicationController.text,
                      image: imageUrl,
                    );
                  }));
                },
                backgroundColor: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
