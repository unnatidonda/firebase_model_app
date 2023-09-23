import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  userData() {
    try {
      fireStore.collection('student').where("age").get().then((value) {
        debugPrint("value.size------->${value.size}");

        for (var data in value.docs) {
          debugPrint("value.id------->${data.id}");
          debugPrint("value.docs------->${data.data()}");
        }
      });
    } on FirebaseException catch (error) {
      debugPrint("Firebase error------->$error");
    } catch (error) {
      debugPrint("error------->$error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home view"),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
