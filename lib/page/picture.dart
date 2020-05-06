import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerPage> {
  var _imgPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ImagePicker"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _ImageView(_imgPath),
              RaisedButton(
                onPressed: _takePhoto,
                child: Text("拍照"),
              ),
              RaisedButton(
                onPressed: _openGallery,
                child: Text("选择照片"),
              ),
            ],
          ),
        ));
  } /*图片控件*/

  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }

  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 400,
    );

    _uploadData(image); //上传

    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }

  _uploadData(imageFile) async {
    FormData formData = new FormData.fromMap({
      "name": "wendux",
      "age": 25,
      "file": await MultipartFile.fromFile(
        imageFile.toString(),
        filename: "imageFileName.jpg",
      ),
    });
    var response = await Dio().post(
      "https://httpbin.org/post",
      data: formData,
    );
    print("上传结束:");
    print(response);
  }
}
