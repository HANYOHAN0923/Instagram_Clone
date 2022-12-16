import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/model/post_form.dart';

class AccountModel {
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

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
