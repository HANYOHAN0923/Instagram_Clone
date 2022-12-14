import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'post_form.dart';

class SearchScreenModel {
  final Stream<QuerySnapshot<Post>> postsStream = FirebaseFirestore.instance
      .collection('posts')
      .withConverter<Post>(
        fromFirestore: (snapshot, _) =>
            Post.fromJson(snapshot.data()!), // read data
        toFirestore: (post, _) => post.toJson(),
      )
      .snapshots();
}
