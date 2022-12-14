import 'package:flutter/material.dart';
import 'package:instagram_clone/model/profile_card_model.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ProfileCardModel();

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 80,
              height: 80,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  model.getProfileImageUrl(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
            ),
            Text(
              model.getNickName(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('johnhan님 외 9명이 \n 팔로우합니다'),
            Text(model.getEmail()),
            const Padding(
              padding: EdgeInsets.only(top: 8),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("팔로우"),
            ),
          ],
        ),
      ),
    );
  }
}
