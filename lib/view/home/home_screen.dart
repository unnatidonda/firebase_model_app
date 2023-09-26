// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../data/res/constant/constant.dart';
// import '../add_edit_to_do_view/add_edit_to_do_view.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// enum SampleItem { itemOne, itemTwo, itemThree }
//
// class _HomeScreenState extends State<HomeScreen> {
//   SampleItem? selectedMenu;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double screenHeight = size.height;
//     double screenWidth = size.width;
//     EdgeInsets devicePadding = MediaQuery.of(context).viewPadding;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text(
//           "Home Screen",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: screenHeight / 30,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//       body: Constant.toDoModelList.isEmpty
//           ? const Center(
//               child: Text(
//                 "No To-Do Found",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             )
//           : ListView.separated(
//               itemCount: Constant.toDoModelList.length,
//               padding: const EdgeInsets.all(15),
//               separatorBuilder: (context, index) => const SizedBox(height: 15),
//               itemBuilder: (context, index) => Container(
//                 padding: const EdgeInsets.all(15),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: CupertinoColors.inactiveGray,
//                       blurRadius: 10,
//                       spreadRadius: 0,
//                       offset: Offset(0, 6),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Title: ${Constant.toDoModelList[index].title}",
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("SubTitle: ${Constant.toDoModelList[index].content}"),
//                         ],
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         setState(() {
//                           Constant.toDoModelList.removeAt(index);
//                         });
//                       },
//                       color: Colors.red,
//                       icon: const Icon(CupertinoIcons.delete),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => AddEditToDoView(index: index),
//                           ),
//                         ).then((value) {
//                           setState(() {});
//                         });
//                       },
//                       color: Colors.blue,
//                       icon: const Icon(CupertinoIcons.pen),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const AddEditToDoView(),
//             ),
//           ).then((value) {
//             setState(() {});
//           });
//         },
//         icon: const Icon(Icons.add),
//         label: const Text('Add To-do'),
//       ),
//       // Column(
//       //   children: [
//       //     Padding(
//       //       padding: const EdgeInsets.only(top: 30),
//       //       child: Column(
//       //         children: [
//       //           Container(
//       //             height: 280,
//       //             width: double.infinity,
//       //             color: Colors.greenAccent,
//       //             child: Row(
//       //               children: [
//       //                 const Column(
//       //                   children: [
//       //                     Text(
//       //                       textAlign: TextAlign.start,
//       //                       " # Student History : ",
//       //                       style: TextStyle(
//       //                         color: Colors.black,
//       //                         fontSize: 26,
//       //                         fontWeight: FontWeight.w700,
//       //                       ),
//       //                     ),
//       //                     Text(
//       //                       textAlign: TextAlign.start,
//       //                       " 1 Surname : Donda \n      Name : Unnati  \n      Hobby : Traveling  \n      Study : BCA running",
//       //                       style: TextStyle(
//       //                         color: Colors.black,
//       //                         fontSize: 26,
//       //                         fontWeight: FontWeight.w700,
//       //                       ),
//       //                     ),
//       //                     SizedBox(height: 50),
//       //                     Text(
//       //                       textAlign: TextAlign.start,
//       //                       "time:12.30 & 4.00",
//       //                       style: TextStyle(
//       //                         color: Colors.black,
//       //                         fontSize: 26,
//       //                         fontWeight: FontWeight.w700,
//       //                       ),
//       //                     ),
//       //                   ],
//       //                 ),
//       //                 Padding(
//       //                   padding: const EdgeInsets.only(left: 80),
//       //                   child: PopupMenuButton<SampleItem>(
//       //                     initialValue: selectedMenu,
//       //                     // Callback that sets the selected popup menu item.
//       //                     onSelected: (SampleItem item) {
//       //                       setState(() {
//       //                         selectedMenu = item;
//       //                       });
//       //                     },
//       //                     itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
//       //                       const PopupMenuItem<SampleItem>(
//       //                         value: SampleItem.itemOne,
//       //                         child: Text(
//       //                           "delete",
//       //                           style: TextStyle(
//       //                             fontWeight: FontWeight.w700,
//       //                             fontSize: 18,
//       //                             color: Colors.black,
//       //                           ),
//       //                         ),
//       //                       ),
//       //                       const PopupMenuItem<SampleItem>(
//       //                         value: SampleItem.itemTwo,
//       //                         child: Text(
//       //                           "Edite",
//       //                           style: TextStyle(
//       //                             fontWeight: FontWeight.w700,
//       //                             fontSize: 18,
//       //                             color: Colors.black,
//       //                           ),
//       //                         ),
//       //                       ),
//       //                     ],
//       //                   ),
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //           const SizedBox(height: 400),
//       //           Row(
//       //             mainAxisAlignment: MainAxisAlignment.center,
//       //             children: <Widget>[
//       //               const SizedBox(width: 280),
//       //               FloatingActionButton(
//       //                 onPressed: () {
//       //                   Navigator.push(
//       //                     context,
//       //                     MaterialPageRoute(
//       //                       builder: (context) => const TodoScreen(),
//       //                     ),
//       //                   );
//       //                 },
//       //                 child: const Icon(Icons.add),
//       //               ),
//       //             ],
//       //           ),
//       //         ],
//       //       ),
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }
