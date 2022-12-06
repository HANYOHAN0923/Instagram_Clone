import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/my_story_stack.dart';
import 'package:instagram_clone/widget/story_stack.dart';
import 'package:instagram_clone/widget/profile_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 38,
          child: Image.asset(
            'assets/images/instagram.png',
            fit: BoxFit.cover,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(Icons.add_box),
          ),
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(Icons.chat),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Text("Welcome to Instagram."),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
              ),
              MyStoryStack(),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
              ),
              StoryStack(),
            ],
          ),
          ProfileCard(),
        ],
      ),
    );
  }
}
