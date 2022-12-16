import 'package:flutter/material.dart';
import 'package:instagram_clone/model/profile_card_model.dart';
import '../model/post_form.dart';

class DetailPostScreen extends StatelessWidget {
  final Post post;
  const DetailPostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final model = ProfileCardModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '탐색 탭',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    model.getProfileImageUrl(),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.getEmail(),
                  ),
                  Text(
                    model.getNickName(),
                  ),
                ],
              ),
            ],
          ),
          Hero(
            tag: post.id, // required uniq value
            child: Image.network(
              post.imageUrl,
            ),
          ),
          Text(post.title),
        ],
      ),
    );
  }
}
