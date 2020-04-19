import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp/upload_image.dart';
import 'package:image_picker/image_picker.dart';

class TakeImage extends StatefulWidget {
  @override
  _TakeImageState createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  File imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[400],
      appBar: AppBar(
        title: Text("Plant disease"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            decideImageView(),
            SizedBox(height: 30),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Camera"),
              onPressed: () {
                openCamera();
              },
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue[800],
              child: Text("Gallery"),
              onPressed: () {
                openGallery();
              },
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.green[800],
              child: Text("Upload Image"),
              onPressed: () {
                UploadImage uploadImage = new UploadImage();
                uploadImage.uploadImage(imageFile);
              },
            ),
          ],
        ),
      ),
    );
  }

  openGallery() async {
    var picture = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 200, maxWidth: double.infinity);
    this.setState(() {
      imageFile = picture;
    });
  }

  openCamera() async {
    var picture = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 200, maxWidth: 400);
    this.setState(() {
      imageFile = picture;
    });
  }

  Widget decideImageView() {
    if (imageFile != null)
      return Image.file(imageFile);
    else
      return Text(
        "Please Select an image",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      );
  }
}
