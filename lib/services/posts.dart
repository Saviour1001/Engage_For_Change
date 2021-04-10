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
        ed: doc.data()['ed'] ?? '',
        co: doc.data()['co'] ?? '',
        hc: doc.data()['hc'] ?? '',
        yw: doc.data()['yw'] ?? '',
        ad: doc.data()['ad'] ?? '',
      );
    }).toList();
  }

  Future savePost(orgName, orgContact, State, City, Address, jobTitle,
      jobDescription, arr, ed, co, hc, yw, ad) async {
    await FirebaseFirestore.instance.collection("Posts").add({
      'Organization Name': orgName,
      'Organization Contact': orgContact,
      'State': State,
      'City': City,
      'Address': Address,
      'Job Title': jobTitle,
      'Job Description': jobDescription,
      'arr': arr,
      'ed': ed,
      'co': co,
      'hc': hc,
      'yw': yw,
      'ad': ad,
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
