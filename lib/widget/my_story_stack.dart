import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyStoryStack extends StatelessWidget {
  const MyStoryStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            const SizedBox(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.imgur.com/KFXF6Po.jpg'),
              ),
            ),
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.bottomRight,
              child: Stack(
                alignment: Alignment.center,
                children: const <Widget>[
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: FloatingActionButton(
                      onPressed: null,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: FloatingActionButton(
                      hoverElevation: 0,
                      focusElevation: 0,
                      elevation: 0,
                      onPressed: null,
                      child: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 3),
          width: 55,
          height: 55,
          child: const AutoSizeText(
            'My Story',
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
