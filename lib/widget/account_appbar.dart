import 'package:flutter/material.dart';

// can't be assigned to the parameter type 'preferredsizewidget'
// https://stackoverflow.com/questions/49015038/removing-the-drop-shadow-from-a-scaffold-appbar-in-flutter
class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AccountAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Row(
        children: <Widget>[
          const Icon(
            Icons.lock,
            color: Colors.black,
          ),
          const Text(
            "hanyohanyohan",
            style: TextStyle(color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.expand_more,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add_box,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
