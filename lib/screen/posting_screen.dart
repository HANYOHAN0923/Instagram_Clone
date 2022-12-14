import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram_clone/model/posting_model.dart';

class Posting extends StatefulWidget {
  const Posting({super.key});

  @override
  State<Posting> createState() => _PostingState();
}

class _PostingState extends State<Posting> {
  final model = PostingModel();
  File? _image;

  bool isLoading = false;

  // TextController
  // https://devmg.tistory.com/185
  final _titleTextControlller = TextEditingController();
  @override
  void dispose() {
    _titleTextControlller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Post"),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              if (_image != null && _titleTextControlller.text.isNotEmpty) {
                setState(() {
                  isLoading = true;
                });

                await model.uploadPost(_titleTextControlller.text, _image!);

                setState(() {
                  isLoading = false;
                });

                // mounted: ??? async 함수 안에서 context를 사용하려면 사용해줘야한다
                if (mounted) {
                  Navigator.pop(context);
                }
              }
            },
            icon: const Icon(Icons.send),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _titleTextControlller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.grey[800],
                    ),
                    hintText: "Input Title",
                    fillColor: Colors.white70),
              ),
              ElevatedButton(
                onPressed: () async {
                  // image_picker
                  _image = await model.getImage();

                  setState(() {});
                },
                child: const Text("Images..."),
              ),
              if (isLoading) const CircularProgressIndicator(),
              if (_image != null)
                Image.file(
                  _image!,
                  width: 300,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
