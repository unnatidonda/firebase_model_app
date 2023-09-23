import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/dummy_data/dummy_data.dart';
import '../../model/second_to_do_model.dart';
import '../../model/to_do_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ToDoModelData> toDoModelList = []; // To Store List Of Map Data in List Of Model

  ToDoModelData? toDoModel; // To store map data in model

  SecondToDoModel? secondToDoModel; // To store map data in model with sub list of map to list of model and map to model store

  @override
  void initState() {
    // TODO: implement initState
    toDoModelList = toDoDummyList.map((value) => ToDoModelData.fromJson(value)).toList(); // To Convert List of Map Data In List Of Model to store

    toDoModel = ToDoModelData.fromJson(data); // to convert map data in model to store

    secondToDoModel = SecondToDoModel.fromJson(secondToDoData); // To convert map data in model with sub list of map to list of model and map to model converter

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To - Do List"),
      ),
      body: Column(
        children: [
          //? Only access main model data
          Text(
            "Title: ${secondToDoModel!.title}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("SubTitle: ${secondToDoModel!.content}"),

          const SizedBox(height: 15),

          //? Access main model sub model data
          Text(
            "Title: ${secondToDoModel!.subTodoMap!.title}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("SubTitle: ${secondToDoModel!.subTodoMap!.content}"),

          //? Access main model sub model list data
          Expanded(
            child: ListView.separated(
              itemCount: secondToDoModel!.subTodoList!.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(15),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: CupertinoColors.inactiveGray,
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title: ${secondToDoModel!.subTodoList![index].title}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("SubTitle: ${secondToDoModel!.subTodoList![index].content}"),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Colors.red,
                      icon: const Icon(CupertinoIcons.delete),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Colors.blue,
                      icon: const Icon(CupertinoIcons.pen),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
