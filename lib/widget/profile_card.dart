import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              width: 80,
              height: 80,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://file2.nocutnews.co.kr/newsroom/image/2022/10/25/202210250517532480_0.jpg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
            ),
            const Text(
              '조유리',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('johnhan님 외 9명이 \n 팔로우합니다'),
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
