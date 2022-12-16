import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/model/post_form.dart';

class ProfileCardModel {
  final _picker = ImagePicker();

  Future<void> updateProfileImage() async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      // 이미지 업로드
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child(
          'user/${FirebaseAuth.instance.currentUser?.uid}/profile/${DateTime.now().millisecondsSinceEpoch}.png'); // Storage 안에 특정 위치와 파일 이름 특정

      // 이미지 url 얻기
      await imageRef.putFile(File(xFile.path));
      final imageUrl = await imageRef.getDownloadURL();

      // 이미지 최종 업데이트
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(imageUrl);
    }
  }

  String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? 'No Email Adress';
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? 'No User Name';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://mblogthumb-phinf.pstatic.net/MjAyMTAzMThfMjQz/MDAxNjE2MDY1MzE4MDM3.jd1CH-2hDZel_CMIlX2Vahma4V0JsaWwBEKwrRyNLLQg.MBUXaB3g0qneuhIqm4a0EDC8U4YoVXSBLwmSurp577cg.PNG.tkfkdgowt13/6.png?type=w800';
  }

  final Stream<QuerySnapshot<Post>> postsStream = FirebaseFirestore.instance
      .collection('posts')
      .where(
        'userId',
        isEqualTo: FirebaseAuth.instance.currentUser?.uid,
      ) // 내가 쓴 글만
      .withConverter<Post>(
        fromFirestore: (snapshot, _) =>
            Post.fromJson(snapshot.data()!), // read data
        toFirestore: (post, _) => post.toJson(),
      )
      .snapshots();
}
