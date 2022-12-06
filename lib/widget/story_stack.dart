import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StoryStack extends StatefulWidget {
  const StoryStack({Key? key}) : super(key: key);

  @override
  _StoryStackState createState() => _StoryStackState();
}

class _StoryStackState extends State<StoryStack> {
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 60,
                height: 60,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isCheck = false;
                    });
                  },
                  child: Ink.image(
                    image: isCheck
                        ? const NetworkImage('https://i.imgur.com/9FcsDA0.png')
                        : const NetworkImage(
                            'https://i.imgur.com/blBWH2E.pngg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: InkWell(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://file2.nocutnews.co.kr/newsroom/image/2022/10/25/202210250517532480_0.jpg',
                  ),
                ),
                onTap: () {
                  setState(() {
                    isCheck = false;
                  });
                },
              ),
            ),
          ],
        ),
        Container(
          width: 60,
          height: 60,
          child: AutoSizeText(
            'jo_glasss',
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
