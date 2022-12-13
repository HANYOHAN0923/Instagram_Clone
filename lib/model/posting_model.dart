import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final postsRef =
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              fromFirestore: (snapshot, _) =>
                  Post.fromJson(snapshot.data()!), // read data
              toFirestore: (post, _) => post.toJson(), // write data
            );

    postsRef.add(
      Post(
        userId: FirebaseAuth.instance.currentUser?.uid ?? 'No User Id',
        title: title,
        imageUrl:
            'https://mblogthumb-phinf.pstatic.net/MjAyMTAzMThfMjQz/MDAxNjE2MDY1MzE4MDM3.jd1CH-2hDZel_CMIlX2Vahma4V0JsaWwBEKwrRyNLLQg.MBUXaB3g0qneuhIqm4a0EDC8U4YoVXSBLwmSurp577cg.PNG.tkfkdgowt13/6.png?type=w800',
      ),
    );
  }
}
