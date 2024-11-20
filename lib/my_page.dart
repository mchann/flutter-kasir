import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  File? imageFile;
  final imagePicker = ImagePicker();


  Future<void> getFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> getFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void showPictureDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pilih Sumber"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: const Text("Ambil dari Kamera"),
                  onTap: () {
                    Navigator.pop(context);
                    getFromCamera();
                  },
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  child: const Text("Pilih dari Galeri"),
                  onTap: () {
                    Navigator.pop(context);
                    getFromGallery();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: size.width,
            height: 250,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              color: Colors.blueGrey,
              strokeWidth: 1,
              dashPattern: const [5, 5],
              child: SizedBox.expand(
                child: FittedBox(
                  child: imageFile != null
                      ? Image.file(imageFile!, fit: BoxFit.cover)
                      : const Icon(Icons.image_outlined, color: Colors.blueGrey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: showPictureDialog,
              child: const Text("Pick Image"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                imageFile = null;
              });
            },
            child: const Text("Clear Image"),
          ),
        ],
      ),
    );
  }
}