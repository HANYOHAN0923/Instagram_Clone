import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/account_appbar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AccountAppBar(),
      body: Column(children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage('https://i.imgur.com/KFXF6Po.jpg'),
            ),
            Column(
              children: <Widget>[
                Text('0'),
                Text('게시물'),
              ],
            ),
            Column(
              children: <Widget>[
                Text('10'),
                Text('팔로워'),
              ],
            ),
            Column(
              children: <Widget>[
                Text('13'),
                Text('팔로잉'),
              ],
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text('101'),
            Text('Colossians 3:23'),
          ],
        ),
        Row(
          children: <Widget>[
            TextButton(
              onPressed: () {},
              child: Text('프로필 편집'),
            ),
            TextButton(
              onPressed: () {},
              child: Icon(Icons.mobile_friendly),
            )
          ],
        ),
      ]),
      backgroundColor: Colors.white,
    );
  }
}
