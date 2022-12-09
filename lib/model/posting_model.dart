import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PostingModel {
  final _picker = ImagePicker();

  Future<File?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;
    return File(image.path);

    /*
    return File(image!.path);
    위에서 image가 XFile? 이라서 nullable 사용불가능
    */
  }
}

// https://stackoverflow.com/questions/74726200/flutter-dart-whats-difference-betweent-these-codes