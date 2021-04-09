import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:day12_login/models/post.dart';

class PostService {
  List<PostModel> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PostModel(
        id: doc.id,
        orgName: doc.data()['Organization Name'] ?? '',
        orgContact: doc.data()['Organization Contact'] ?? '',
        State: doc.data()['State'] ?? '',
        City: doc.data()['City'] ?? '',
        Address: doc.data()['Address'] ?? '',
        jobTitle: doc.data()['Job Title'] ?? '',
        jobDescription: doc.data()['Job Description'] ?? '',
        arr: doc.data()['arr'] ?? '',
      );
    }).toList();
  }

  Future savePost(orgName, orgContact, State, City, Address, jobTitle,
      jobDescription, arr) async {
    await FirebaseFirestore.instance.collection("Posts").add({
      'Organization Name': orgName,
      'Organization Contact': orgContact,
      'State': State,
      'City': City,
      'Address': Address,
      'Job Title': jobTitle,
      'Job Description': jobDescription,
      'arr': arr,
      'Posted On': FieldValue.serverTimestamp(),
      'Apply by': FieldValue.serverTimestamp(),
      'User_id': FirebaseAuth.instance.currentUser.uid,
    });
  }

  Stream<List<PostModel>> getPostsByUser(uid) {
    return FirebaseFirestore.instance
        .collection("Posts")
        .where('User_id', isEqualTo: uid)
        .snapshots()
        .map(_postListFromSnapshot);
  }
}
