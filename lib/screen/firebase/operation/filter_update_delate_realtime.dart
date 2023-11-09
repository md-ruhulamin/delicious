// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/widget/bigText.dart';
import 'package:eshop/widget/round_button.dart';
import 'package:eshop/widget/snake_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FilterList extends StatefulWidget {
  FilterList({super.key});

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  final auth = FirebaseAuth.instance;

  final databaseRef = FirebaseDatabase.instance.ref("Post");

  final filterController = TextEditingController();
  final editcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          BigText(
            text: "Show  Data From Firebase",
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                controller: filterController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              String key = DateTime.now().millisecondsSinceEpoch.toString();
              databaseRef.child(key).set({
                'title': filterController.text.toString(),
                'id': key,
                'name': 'ruhul amin'
              });
              CustomSnackBar(context, Text("Clicked Added"));

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FilterList()));
            },
            child: RoundButton(
              text: "Submit",
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseRef,
              itemBuilder: (context, snapshot, animation, index) {
                String title = snapshot.child('title').value.toString();
                if (filterController.text.isEmpty) {
                  return ListTile(
                    title: Text(title),
                    subtitle: Text(snapshot.child('id').value.toString()),
                    trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                  value: 1,
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showMyDialog(
                                          title,
                                          snapshot
                                              .child('id')
                                              .value
                                              .toString());
                                    },
                                    leading: Icon(
                                      Icons.edit,
                                    ),
                                    title: Text("Edit"),
                                  )),
                              PopupMenuItem(
                                  value: 2,
                                  onTap: () {
                                    databaseRef
                                        .child(snapshot
                                            .child('id')
                                            .value
                                            .toString())
                                        .remove();
                                    // Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.delete,
                                    ),
                                    title: Text("Delete"),
                                  ))
                            ],
                        child: Icon(Icons.more_vert)),
                  );
                } else if (title
                    .toLowerCase()
                    .contains(filterController.text.toLowerCase().toString())) {
                  return ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                    subtitle: Text(snapshot.child('id').value.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),

          // Expanded(
          //   child: FutureBuilder<List<DocumentSnapshot>>(
          //     future: getDataFromFirestore(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return CircularProgressIndicator(
          //           color: Colors.amber,
          //         ); // Show a loading indicator while fetching data.
          //       } else if (snapshot.hasError) {
          //         return Text('Error: ${snapshot.error}');
          //       } else {
          //         // Display the data from Firestore in a ListView
          //         return ListView.builder(
          //           itemCount: snapshot.data!.length,
          //           itemBuilder: (context, index) {
          //             // Access the data using snapshot.data[index].data()
          //             Map<String, dynamic> userData =
          //                 snapshot.data![index].data() as dynamic;
          //             String key = userData['title'];
          //             if (filterController.text.isEmpty) {
          //               print("Empty " + key);
          //               return ListTile(
          //                 title: Text(key),
          //                 subtitle: Text(userData['id']),
          //               );
          //             } else if (key.toLowerCase().toString().contains(
          //                 filterController.text.toLowerCase.toString())) {
          //               print("No  Empty " + key);
          //               return ListTile(
          //                 title: Text(key),
          //                 subtitle: Text(userData['id']),
          //               );
          //             } else {
          //               print("No match " + key);
          //               return Container();
          //             }
          //           },
          //         );
          //       }
          //     },
          //   ),
          //   )
        ],
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
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
                    Navigator.pop(context);
                    try {
                      databaseRef
                          .child(id)
                          .update({'title': editcontroller.text.toString()});
                      CustomSnackBar(context, Text("Update Successfull"));
                    } catch (e) {
                      CustomSnackBar(context, Text("Update Failed"));
                    }
                  },
                  child: Text(" Update"))
            ],
          );
        });
  }
}
