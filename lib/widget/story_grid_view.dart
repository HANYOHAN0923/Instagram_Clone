import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/model/search_screen_model.dart';
import 'package:instagram_clone/screen/detail_post_screen.dart';

import '../model/post_form.dart';

class StoryGridView extends StatelessWidget {
  const StoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = SearchScreenModel();

    return StreamBuilder<QuerySnapshot<Post>>(
      stream: model.postsStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("알 수 없는 에러가 발생했습니다.");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Post> posts = snapshot.data!.docs.map((e) => e.data()).toList();

        return GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: posts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 열마다 아이템의 개수
            mainAxisSpacing: 2, // 각 아이템 별 간격
            crossAxisSpacing: 2, // 아니면 GridView()를 Padding()으로 감싸도 된다
          ),
          itemBuilder: (BuildContext context, int index) {
            final post = posts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPostScreen(post: post),
                  ),
                );
              },
              child: Hero(
                // animation
                tag: post.id, // required uniq value
                child: Image.network(
                  post.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
