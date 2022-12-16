import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/model/post_form.dart';

class PostingModel {
  final _picker = ImagePicker();

  Future<File?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;
    return File(image.path);

    /* https://stackoverflow.com/questions/74726200/flutter-dart-whats-difference-betweent-these-codes
    return File(image!.path);
    위에서 image가 XFile? 이라서 nullable 사용불가능
    */
  }

  Future<void> uploadPost(String title, File imageFile) async {
    // 이미지 업로드
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child(
        'postImages/${DateTime.now().millisecondsSinceEpoch}.png'); // Storage 안에 특정 위치와 파일 이름 특정

    // 이미지 url 얻기
    await imageRef.putFile(imageFile);
    final imageUrl = await imageRef.getDownloadURL();

    // 게시물 업로드
    final postsRef =
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              fromFirestore: (snapshot, _) =>
                  Post.fromJson(snapshot.data()!), // read data
              toFirestore: (post, _) => post.toJson(), // write data
            );

    // Firestore의 Collection > Document의 주소를 미리 만들기
    final postDoc = postsRef.doc();

    postsRef.add(
      Post(
        id: postDoc.id,
        userId: FirebaseAuth.instance.currentUser?.uid ?? 'No User Id',
        title: title,
        imageUrl: imageUrl,
      ),
    );
  }
}
