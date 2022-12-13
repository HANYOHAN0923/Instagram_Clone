import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:instagram_clone/screen/tab_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // StreamBuilder(): 스트림 데이터를 기반으로 UI로 변경해주는 위젯
    // FirebaseAuth.instance: Firebase를 통해 인증을 하는 객체에 정보
    // .authStateChanges(): 로그인 여부를 알려주는 스트림
    // stream: 수시로 변경되는 데이터를 처리하는 타입
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      // snapshop: <User>는 Firebase에서 로그인한 객체에 대한 정보
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            // PROVIDED BY: flutterfire_ui/auth.dart
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
            headerBuilder: (context, constraints, _) {
              return Text('data');
            },
          );
        }
        return const TabScreen();
      },
    );
  }
}
