import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/model/post_form.dart';
import 'package:instagram_clone/model/profile_card_model.dart';
import 'package:instagram_clone/screen/detail_post_screen.dart';
import 'package:instagram_clone/widget/account_appbar.dart';
import 'package:instagram_clone/widget/story_grid_view.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final model = ProfileCardModel();
    return Scaffold(
      appBar: AccountAppBar(),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  await model.updateProfileImage();
                  setState(() {});
                },
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.imgur.com/KFXF6Po.jpg'),
                ),
              ),
              Column(
                children: <Widget>[
                  StreamBuilder<QuerySnapshot<Post>>(
                      stream: model.postsStream,
                      builder: (context, snapshot) {
                        int count = 0;

                        if (snapshot.hasData) {
                          count = snapshot.data!.size;
                        }

                        return Text('${count}');
                      }),
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
          Expanded(
            child: StreamBuilder<QuerySnapshot<Post>>(
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

                List<Post> posts =
                    snapshot.data!.docs.map((e) => e.data()).toList();

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
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
