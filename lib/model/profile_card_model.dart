import 'package:firebase_auth/firebase_auth.dart';

class ProfileCardModel {
  String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? 'No Email Adress';
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? 'No User Name';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://mblogthumb-phinf.pstatic.net/MjAyMTAzMThfMjQz/MDAxNjE2MDY1MzE4MDM3.jd1CH-2hDZel_CMIlX2Vahma4V0JsaWwBEKwrRyNLLQg.MBUXaB3g0qneuhIqm4a0EDC8U4YoVXSBLwmSurp577cg.PNG.tkfkdgowt13/6.png?type=w800';
  }
}
