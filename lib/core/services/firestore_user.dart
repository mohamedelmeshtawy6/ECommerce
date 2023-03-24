import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('user');

  Future<void> addUserToFirestoe(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> currentUser(String userid) async {
    return await _userCollectionRef.doc(userid).get();
  }
}
