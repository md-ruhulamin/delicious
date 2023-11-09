// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:eshop/model/category_model.dart';
import 'package:eshop/screen/firebase/operation/firestore_operation(rud).dart';
import 'package:eshop/widget/bigText.dart';
import 'package:eshop/widget/snake_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eshop/widget/round_button.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FireBaseAdd extends StatefulWidget {
  const FireBaseAdd({super.key});

  @override
  State<FireBaseAdd> createState() => FireBaseAddState();
}

class FireBaseAddState extends State<FireBaseAdd> {
  List<String> items = ['Pizza', 'Burgur', 'Noodles', 'Sushi', 'Cake', 'Juice'];
  String? selectedItem = "Pizza";
  final auth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref("Post");
  final firestore = FirebaseFirestore.instance;
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final ratingController = TextEditingController();
  final descriptionController = TextEditingController();
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

  Future<void> addDataToFirestore(String url) async {
    try {
      // Get a reference to the Firestore collection

      CollectionReference products =
          FirebaseFirestore.instance.collection('products');
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      // Add a document with data to the collection
      await products.doc(id).set({
        "name": "Vegetable Lo Mein",
        "description":
            "A savory and hearty vegetable lo mein with stir-fried noodles and a variety of vegetables.",
        "price": 10.99,
        "rating": 4.4,
        "category": selectedItem,
        'id': id,
        'image': url
      });

      Get.snackbar("FireStore", "${selectedItem!} is Added ",
          backgroundColor: Colors.amber, snackPosition: SnackPosition.TOP);

      print('Data added to Firestore');
    } catch (e) {
      // Handle the error here
      print('Error adding data to Firestore: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Add to FireStore Product Info',
          style: TextStyle(
            color: Colors.white, // Text color
            fontFamily: 'WorkSansSemiBold',
            fontSize: 20, // Font size
            // fontWeight: FontWeight.bold, // Font weight (e.g., FontWeight.bold)
            //   fontStyle: FontStyle.italic, // Font style (e.g., FontStyle.italic)
            //  letterSpacing: 2.0, // Letter spacing
            //  wordSpacing: 4.0, // Word spacing
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
              validator: (value) {
                if (value!.length < 5) {
                  return "Enter Valid Name";
                }
                return null;
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: "Description about product",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                  hintText: 'Price',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
              validator: (value) {
                if (value!.length < 1) {
                  return "Enter Valid Price";
                }
                return null;
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextFormField(
              controller: ratingController,
              decoration: InputDecoration(
                  hintText: "Rating",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        Center(
          child: InkWell(
            onTap: () {
              getImageGallery();
              setState(() {});
            },
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: _image != null
                  ? Image.file(_image!.absolute)
                  : Center(child: Icon(Icons.image)),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<String>(
            value: selectedItem,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: BigText(text: item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedItem = newValue!;
              });
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // GestureDetector(
            //   onTap: () {
            //     addDataToFirestore();
            //     String key = DateTime.now().millisecondsSinceEpoch.toString();

            //     databaseRef.child(key).set({
            //       'title': text1.text.toString(),
            //       'id': key,
            //       'name': 'ruhul amin'
            //     });
            //     CustomSnackBar(context, Text("Clicked Added"));

            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => FilterList()));
            //   },
            //   child: RoundButton(
            //     text: "Realtime",
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            GestureDetector(
              onTap: () async {
                // String key = DateTime.now().millisecondsSinceEpoch.toString();

                // try {
                //   firestore.collection('products').add({
                //     'title': text1.text.toString(),
                //     'id': key,
                //     'name': 'ruhul amin'
                //     // Add more fields as needed
                //   });
                //   CustomSnackBar(context, Text("Clicked Added"));
                // } catch (e) {
                //   CustomSnackBar(context, Text("Failed to Add $e"));
                // }
                firebase_storage.Reference ref = firebase_storage
                    .FirebaseStorage.instance
                    .ref(selectedItem! + DateTime.now().toString());
                firebase_storage.UploadTask uploadtask =
                    ref.putFile(_image!.absolute);
                await Future.value(uploadtask);
                var newurl = await ref.getDownloadURL();

                // databasereference
                //     .child('image')
                //     .set({'id': '12324', 'title': newurl.toString()});

                // CustomSnackBar(context, Text("image Uploaded"));

                addDataToFirestore(newurl.toString());
              },
              child: RoundButton(
                text: "Firestore",
              ),
            ),

            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => FireStoreOperation())));
                },
                child: RoundButton(text: "ShowFStore"))
          ],
        ),
        // Expanded(
        //   child: FirebaseAnimatedList(
        //     query: databaseRef,
        //     itemBuilder: (context, snapshot, animation, index) {
        //       String title = snapshot.child('title').value.toString();
        //       if (text1.text.isEmpty) {
        //         return ListTile(
        //           title: Text(title),
        //           subtitle: Text(snapshot.child('id').value.toString()),
        //         );
        //       } else if (title
        //           .toLowerCase()
        //           .contains(text1.text.toLowerCase().toString())) {
        //         return ListTile(
        //           title: Text(snapshot.child('title').value.toString()),
        //           subtitle: Text(snapshot.child('id').value.toString()),
        //         );
        //       } else {
        //         return Container();
        //       }
        //     },
        //   ),
        // ),
        // // Expanded(
        // //     child: StreamBuilder(
        //   stream: databaseRef.onValue,
        //   builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
        //     if (!snapshot.hasData) {
        //       return CircularProgressIndicator();
        //     } else {
        //       Map<dynamic, dynamic> map =
        //           snapshot.data!.snapshot.value as dynamic;

        //       List<dynamic> list = [];
        //       list.clear();
        //       list = map.values.toList();
        //       return ListView.builder(
        //           itemCount: snapshot.data!.snapshot.children.length,
        //           itemBuilder: (context, index) {
        //             return ListTile(
        //               title: Text(list[index]['id']),
        //               subtitle: Text(list[index]['title']),
        //             );
        //           });
        //     }
        //   },
        // ))
      ])),
    );
  }
}
