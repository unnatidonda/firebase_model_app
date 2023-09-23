import 'package:flutter/material.dart';

import '../name_model.dart';

class AddTodoScreeen extends StatefulWidget {
  const AddTodoScreeen({super.key});

  @override
  State<AddTodoScreeen> createState() => _AddTodoScreeenState();
}

class _AddTodoScreeenState extends State<AddTodoScreeen> {
  List<NamesModel> namesList = [
    NamesModel(name: "Unnati", age: 19, profession: "Developer", image: "kusch", details: Details(fathername: "nileshbhai")),
    NamesModel(name: "Monika", age: 19, profession: "Banker", details: Details(fathername: "")),
    NamesModel(name: "Riddhi", age: 19, profession: "Business", details: Details(fathername: "")),
    NamesModel(name: "Krushika", age: 22, profession: "Doctor", details: Details(fathername: "")),
  ];

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
          // ListView.builder(
          //     itemCount: namesList.length,
          //     itemBuilder: (context, index) {
          //       if (namesList[index].details.toString() == "null") {
          //       } else {
          //         return ListTile(
          //           title: Text(namesList[index].name.toString()),
          //           subtitle: Text(namesList[index].age.toString()),
          //           trailing: IconButton(
          //             icon: Icon(Icons.delete),
          //             onPressed: () {
          //               namesList.removeAt(index);
          //               setState(() {});
          //             },
          //           ),
          //         );
          //       }
          //     }));
          ListView(
        children: [
          Column(
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
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(22),
                    isDense: true,
                    hintText: "time picker",
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
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  decoration: InputDecoration(
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
        ],
      ),
    );
  }
}
