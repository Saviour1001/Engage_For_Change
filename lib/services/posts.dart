import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:prototype/models/post.dart';

class PostService {
  List<PostModel> _postListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PostModel(
        id: doc.id,
        orgName: doc.data()['orgName'] ?? '',
        orgContact: doc.data()['orgName'] ?? '',
        jobType: doc.data()['jobType'] ?? '',
        jobDescription: doc.data()['jobDescription'] ?? '',
        Apply_by: doc.data()['Apply_by'] ?? 0,
        Posted_On: doc.data()['Posted_on'] ?? 0,
      );
    }).toList();
  }

  Future savePost(orgName, orgContact, jobType, jobDescription) async {
    await FirebaseFirestore.instance.collection("Posts").add({
      'Organization Name': orgName,
      'Organization Contact': orgContact,
      'Job Description': jobType,
      'Job Type': jobDescription,
      'Posted On': FieldValue.serverTimestamp(),
      'Apply by': FieldValue.serverTimestamp(),
      'User id': FirebaseAuth.instance.currentUser.uid,
    });
  }

  Stream<List<PostModel>> getPostsByUser(uid) {
    return FirebaseFirestore.instance
        .collection("Posts")
        .where('User id', isEqualTo: uid)
        .snapshots()
        .map(_postListFromSnapshots);
  }
}
