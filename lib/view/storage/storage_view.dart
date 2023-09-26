import 'package:firebase_model_app/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StorageView extends StatefulWidget {
  const StorageView({super.key});

  @override
  State<StorageView> createState() => _StorageViewState();
}

class _StorageViewState extends State<StorageView> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  selectImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      debugPrint("Image path ------>> ${image!.path}");
      sendImage();
    }
  }

  sendImage() async {
    try {
      Reference reference = FirebaseStorage.ref().child("image/123/12345678.png");

      var link = await reference.getDownloadURL();
      debugPrint("Download link ----> $link");
    } on FirebaseException catch (error) {
      debugPrint("Firebase error ----> $error");
      Utils().showSnackBar(context: context, content: "Firebase error ----> $error");
    } catch (error) {
      Utils().showSnackBar(context: context, content: "Error ----> $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              sendImage();
            },
            child: const Text("Select Image"),
          ),
        ],
      ),
    );
  }
}
