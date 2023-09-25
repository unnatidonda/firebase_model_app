import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/res/constant/constant.dart';
import '../../model/to_do_model.dart';
import '../name_model.dart';

class AddTodoScreeen extends StatefulWidget {
  final int? index;
  const AddTodoScreeen({super.key, this.index});

  @override
  State<AddTodoScreeen> createState() => _AddTodoScreeenState();
}

class _AddTodoScreeenState extends State<AddTodoScreeen> {
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


  List<NamesModel> namesList = [
    NamesModel(name: "Unnati", age: 19, profession: "Developer", image: "kusch", details: Details(fathername: "nileshbhai")),
    NamesModel(name: "Monika", age: 19, profession: "Banker", details: Details(fathername: "")),
    NamesModel(name: "Riddhi", age: 19, profession: "Business", details: Details(fathername: "")),
    NamesModel(name: "Krushika", age: 22, profession: "Doctor", details: Details(fathername: "")),
  ];

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<ToDoModel> toDoData = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    EdgeInsets devicePadding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "TodoScreen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body:
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    decoration: InputDecoration(
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

                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "Edit",
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
                  ],
                )
              ],
            ),
          ),
    );
  }
}
