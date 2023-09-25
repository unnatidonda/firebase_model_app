import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_model_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../data/res/constant/constant.dart';
import '../../model/to_do_model.dart';

class AddEditToDoView extends StatefulWidget {
  final ToDoModel? toDoModel;
  final String? id;
  final int? index;
  const AddEditToDoView({
    super.key,
    this.index,
    this.toDoModel,
    this.id,
  });

  @override
  State<AddEditToDoView> createState() => _AddEditToDoViewState();
}

class _AddEditToDoViewState extends State<AddEditToDoView> {
  String time = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  TimeOfDay timeOfDay = TimeOfDay.now();
  Future displayTimePicker(BuildContext context) async {
    var timeData = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );

    if (timeData != null) {
      setState(() {
        // time = "${timeData.hour}:${timeData.minute}";
        time = timeData.format(context);
      });
    }
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  setToDo() {
    try {
      firestore.collection("ToDoFire").add({
        "title": titleController.text.trim(),
        "content": contentController.text.trim(),
        "time": time,
      }).then((value) {
        Utils().showToastMessage(content: "ToDo successfully add");
        Navigator.pop(context);
      });
    } on FirebaseException catch (error) {
      debugPrint("Firebase error --------> $error");
      Utils().showSnackBar(context: context, content: "Firebase error --------> $error");
    } catch (error) {
      Utils().showSnackBar(context: context, content: "Firebase error --------> $error");
    }
  }

  upDatToDo() {
    try {
      firestore.collection("ToDoFire").doc(widget.id).update({
        "title": titleController.text.trim(),
        "content": contentController.text.trim(),
        "time": time,
      }).then((value) {
        Utils().showToastMessage(content: "ToDo successfully add");
        Navigator.pop(context);
      });
    } on FirebaseException catch (error) {
      debugPrint("Firebase error --------> $error");
      Utils().showSnackBar(context: context, content: "Firebase error --------> $error");
    } catch (error) {
      Utils().showSnackBar(context: context, content: " $error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    if (widget.index != null) {
      titleController.text = Constant.toDoModelList[widget.index!].title!;
      contentController.text = Constant.toDoModelList[widget.index!].content!;
      time = Constant.toDoModelList[widget.index!].time!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    EdgeInsets devicePadding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          widget.index == null ? "Add To-do" : "Edit To-Do",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(22),
                    isDense: true,
                    hintText: "Unnati Donda",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(22),
                    isDense: true,
                    hintText: "contact",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => displayTimePicker(context),
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black54, width: 1.2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(time.isEmpty ? "hh : mm" : time),
                      const SizedBox(width: 8),
                      const Icon(Icons.date_range_rounded),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight / 2),
              Row(
                children: [
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.green),
                      fixedSize: MaterialStatePropertyAll(
                        Size(screenWidth / 2.3, screenHeight / 16),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    // onPressed: onPress ?? () {},

                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "Add",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.green),
                      fixedSize: MaterialStatePropertyAll(
                        Size(screenWidth / 2.3, screenHeight / 16),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    // onPressed: onPress ?? () {},

                    onPressed: () {
                      if (widget.index != null) {
                        //? To Edit to-do model in to-doModel list
                        Constant.toDoModelList[widget.index!] = ToDoModel(
                          title: titleController.text,
                          content: contentController.text,
                          time: time,
                        );
                        setState(() {});
                      } else {
                        //? To add to-do model in to-doModel list
                        Constant.toDoModelList.add(
                          ToDoModel(
                            title: titleController.text,
                            content: contentController.text,
                            time: time,
                          ),
                        );
                        setState(() {});
                      }
                      Navigator.pop(context);
                    },
                    child: Text(widget.index == null ? "Add To-do" : "Edit To-Do"),
                  ),
                  // child: const Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       textAlign: TextAlign.center,
                  //       "Edit",
                  //       style: TextStyle(
                  //         fontSize: 17,
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.w500,
                  //         fontFamily: "Poppins",
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
