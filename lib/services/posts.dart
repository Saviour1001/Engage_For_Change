import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PostService {
  Future savePost(text) async {
    await FirebaseFirestore.instance.collection("Posts").add({
      'Organization Name': text,
      'Organization Contact': "Hi",
      'Job Description': "Hi",
      'Job Type': "Hi",
      'Posted On': FieldValue.serverTimestamp(),
      'Apply by': FieldValue.serverTimestamp(),
    });
  }
}
