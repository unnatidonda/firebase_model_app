import 'package:flutter/material.dart';

import '../../data/dummy_data/third_dummy_data.dart';
import '../../model/forth_to_do_model.dart';

class ElevenScreen extends StatefulWidget {
  const ElevenScreen({super.key});

  @override
  State<ElevenScreen> createState() => _ElevenScreenState();
}

class _ElevenScreenState extends State<ElevenScreen> {
  List<TodoModelData> toDoModelList = [];

  @override
  void initState() {
    // TODO: implement initState
    toDoModelList = itemList.map((value) => TodoModelData.fromJson(value)).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/banner2.png",
                width: 405,
                height: 400,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50, top: 280),
                child: Text(
                  "Sneaker Collections",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFFFFFF),
                    fontFamily: "Teko",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 330),
                child: Container(
                  height: 40,
                  width: 178,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    "See All Collections",
                    style: TextStyle(
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Container(
            height: 84,
            width: 350,
            decoration: const BoxDecoration(
              color: Color(0xFF26282A),
            ),
            child: Image.asset(
              "assets/images/adidas.png",
              height: 64,
              width: 64,
            ),
          ),

          Expanded(
            child: GridView.builder(
              itemCount: toDoModelList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // itemList[index].image!
                  color: Color(0xFFF4F5F7),
                ),
                child: Container(
                  height: 294,
                  width: 171,
                  decoration: const BoxDecoration(
                    color: Color(0xFF000000),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              toDoModelList[index].image!,
                              height: 150,
                              width: 171,
                            ),
                            Container(
                              height: 25,
                              width: 82,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 5),
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1EBC24),
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      "5,113 Sold",
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          toDoModelList[index].itemname!,
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Men’s shoes",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF92989E),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          toDoModelList[index].price!,
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 20,
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 40,
                          width: 147,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Place Bid",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                fontFamily: "Satoshi",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 84,
            width: 350,
            decoration: const BoxDecoration(
              color: Color(0xFF26282A),
            ),
            child: Image.asset(
              "assets/images/nike.png",
              height: 64,
              width: 64,
            ),
          ),
          // SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              itemCount: toDoModelList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 320,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF4F5F7),
                ),
                child: Container(
                  height: 294,
                  width: 171,
                  decoration: const BoxDecoration(
                    color: Color(0xFF000000),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              toDoModelList[index].image!,
                              height: 150,
                              width: 171,
                            ),
                            Container(
                              height: 25,
                              width: 82,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 5),
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1EBC24),
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      "5,113 Sold",
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          toDoModelList[index].itemname!,
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 13,
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          "Men’s shoes",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF92989E),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          toDoModelList[index].price!,
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 20,
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 40,
                          width: 147,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Place Bid",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                fontFamily: "Satoshi",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
