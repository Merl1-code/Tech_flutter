import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> updatePassword(String password) async {
  final User user = FirebaseAuth.instance.currentUser;

  final String answer = await user.updatePassword(password).then((_) {
    return 'Succesfull changed password';
  }).catchError((dynamic error) {
    return 'Password can\'t be changed' + error.toString();
  });
  return answer;
}

Future<String> updateEmail(String email) async {
  final User user = FirebaseAuth.instance.currentUser;

  final String answer = await user.updateEmail(email).then((_) {
    return 'Successfully changed email';
  }).catchError((dynamic error) {
    return 'Email can\'t be changed' + error.toString();
  });
  return answer;
}

Future<String> getProfilPicture() async {
  final String userId = FirebaseAuth.instance.currentUser.uid;

  final DocumentSnapshot doc = await FirebaseFirestore.instance
      .collection('profilPictures')
      .doc(userId)
      .get();

  final String picture = doc['picture'] as String;
  return picture;
}

Future<void> setProfilPicture(String picture) async {
  final String userId = FirebaseAuth.instance.currentUser.uid;

  await FirebaseFirestore.instance
      .collection('profilPictures')
      .doc(userId)
      .set(
    <String, String>{'picture': picture},
  );
}