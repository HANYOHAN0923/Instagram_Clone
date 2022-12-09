import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 30,
              height: 30,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://mblogthumb-phinf.pstatic.net/MjAyMTAzMThfMjQz/MDAxNjE2MDY1MzE4MDM3.jd1CH-2hDZel_CMIlX2Vahma4V0JsaWwBEKwrRyNLLQg.MBUXaB3g0qneuhIqm4a0EDC8U4YoVXSBLwmSurp577cg.PNG.tkfkdgowt13/6.png?type=w800',
                ),
              ),
            ),
            Text('_chaechae_1'),
            TextButton(onPressed: () {}, child: Text('팔로우')),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
              ),
            )
          ],
        ),
        SizedBox(
          width: 600,
          height: 300,
          child: Image.network(
            'https://img.hankyung.com/photo/202206/03.30205650.1.jpg',
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.chat_bubble),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share_arrival_time),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.imgur.com/KFXF6Po.jpg'),
              ),
            ),
            Text(
              'hanyoanyochamchimayo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '님 외 281,233명이 좋아합니다',
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              'jo_glssss',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('다시 한번 이번 엘범으로 글래시분들께 인사드릴\n수 있어서....')
          ],
        ),
        Text('댓글 6,011개 모두 보기'),
        Text('15시간 전 - 추천 게시물')
      ],
    );
  }
}
