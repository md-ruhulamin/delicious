// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/model/model.dart';
import 'package:eshop/widget/snake_bar.dart';
import 'package:flutter/material.dart';

class FireStoreOperation extends StatefulWidget {
  @override
  _FireStoreOperationState createState() => _FireStoreOperationState();
}

class _FireStoreOperationState extends State<FireStoreOperation> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController editcontroller = TextEditingController();
  List<DocumentSnapshot> originalData = []; // Store the original Firestore data
  List<DocumentSnapshot> filteredData = []; // Store the filtered data
  final firestore = FirebaseFirestore.instance.collection('users').snapshots();
  CollectionReference refFirestore =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 90,
      ),
      // StreamBuilder(
      //     stream: firestore,
      //     builder:
      //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(child: CircularProgressIndicator());
      //       }
      //       if (snapshot.hasError) {
      //         return Text("Has error ${snapshot.error}");
      //       }
      //       return Expanded(
      //           child: ListView.builder(
      //         itemCount: snapshot.data!.docs.length,
      //         itemBuilder: ((context, index) {
      //           //   Map<dynamic, dynamic> mp = snapshot.data.docs;
      //           return ListTile(
      //             onTap: () {},
      //             title: Text(snapshot.data!.docs[index]['title'].toString()),
      //             subtitle: Text(snapshot.data!.docs[index].id.toString()),
      //             trailing: PopupMenuButton(
      //                 itemBuilder: (context) => [
      //                       PopupMenuItem(
      //                           value: 1,
      //                           child: ListTile(
      //                             onTap: () {
      //                               showMyUpdateDialog(
      //                                   snapshot.data!.docs[index]['title']
      //                                       .toString(),
      //                                   snapshot.data!.docs[index].id
      //                                       .toString());
      //                               setState(() {});
      //                             },
      //                             leading: Icon(
      //                               Icons.edit,
      //                             ),
      //                             title: Text("Edit"),
      //                           )),
      //                       PopupMenuItem(
      //                           value: 1,
      //                           onTap: () {
      //                             refFirestore
      //                                 .doc(snapshot.data!.docs[index].id
      //                                     .toString())
      //                                 .delete();
      //                           },
      //                           child: ListTile(
      //                             leading: Icon(
      //                               Icons.delete,
      //                             ),
      //                             title: Text("Delete"),
      //                           ))
      //                     ],
      //                 child: Icon(Icons.more_vert)),
      //           );
      //         }),
      //       ));
      //     })

      Expanded(
        child: FutureBuilder<List<MyData>>(
          future: fetchMyData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
              // CustomSnackBar(context, Text("Error: ${snapshot.error}"));
            } else {
              final myDataList = snapshot.data;
              return ListView.builder(
                itemCount: myDataList!.length,
                itemBuilder: (context, index) {
                  final myData = myDataList[index];

                  // final name = myData.name ?? "Unknown";
                  // final title = myData.title ?? "No Title";
                  return ListTile(
                    title: Text(myData.name),
                    subtitle: Text(myData.title),
                    // Display the image using an Image widget or other appropriate widget
                    // You can use myData.image to load the image.
                  );
                },
              );
            }
          },
        ),
      )
    ]));
  }

  Future<List<MyData>> fetchMyData() async {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    return querySnapshot.docs.map((doc) {
      final id = doc.id;
      final data = doc.data() as Map<String, dynamic>;
      return MyData.fromMap(data, id);
    }).toList();
  }



  Future<void> showMyUpdateDialog(String title, String id) async {
    editcontroller.text = title;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Update"),
            content: TextField(
              controller: editcontroller,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(" Cancel")),
              TextButton(
                  onPressed: () {
                    //    Navigator.pop(context);
                    try {
                      refFirestore
                          .doc(id)
                          .update({"title": editcontroller.text.toString()});

                      CustomSnackBar(context, Text("Update Successfull"));
                    } catch (e) {
                      CustomSnackBar(context, Text("Update Failed"));
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(" Update"))
            ],
          );
        });
  }
}
