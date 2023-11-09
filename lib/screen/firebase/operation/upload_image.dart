// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unnecessary_null_comparison

import 'dart:io';

import 'package:eshop/widget/round_button.dart';
import 'package:eshop/widget/snake_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  final picker = ImagePicker();
  DatabaseReference databasereference = FirebaseDatabase.instance.ref('post');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (PickedFile != null) {
        _image = File(pickedFile!.path);
      } else {
        print("No image picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                getImageGallery();
                setState(() {});
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(color: Colors.grey),
                child: _image != null
                    ? Image.file(_image!.absolute)
                    : Center(child: Icon(Icons.image)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () async {
                firebase_storage.Reference ref = firebase_storage
                    .FirebaseStorage.instance
                    .ref('/mobile' + DateTime.now().toString());
                firebase_storage.UploadTask uploadtask =
                    ref.putFile(_image!.absolute);
                await Future.value(uploadtask);
                var newurl = await ref.getDownloadURL();

                databasereference
                    .child('image')
                    .set({'id': '12324', 'title': newurl.toString()});

                CustomSnackBar(context, Text("image Uploaded"));
              },
              child: RoundButton(text: "Upload"))
        ],
      ),
    );
  }
}
