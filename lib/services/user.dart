import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:day12_login/models/post.dart';
import 'package:day12_login/models/user.dart';

import 'package:day12_login/services/utils.dart';

class UserService {
  UtilsService _utilsService = UtilsService();

  List<UserModel> _userListFromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserModel(
        id: doc.id,
        name: doc.data()['name'] ?? '',
        profileImageUrl: doc.data()['profileImageUrl'] ?? '',
        bannerImageUrl: doc.data()['bannerImageUrl'] ?? '',
        email: doc.data()['email'] ?? '',
      );
    }).toList();
  }

  UserModel _userFromFirebaseSnapshot(DocumentSnapshot snapshot) {
    return snapshot != null
        ? UserModel(
            id: snapshot.id,
            name: snapshot.data()['name'] ?? '',
            profileImageUrl: snapshot.data()['profileImageUrl'] ?? '',
            bannerImageUrl: snapshot.data()['bannerImageUrl'] ?? '',
            email: snapshot.data()['email'] ?? '',
          )
        : null;
  }

  Stream<UserModel> getUserInfo(uid) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .snapshots()
        .map(_userFromFirebaseSnapshot);
  }

  Stream<List<UserModel>> queryByName(search) {
    return FirebaseFirestore.instance
        .collection("users")
        .orderBy("name")
        .startAt([search])
        .endAt([search + '\uf8ff'])
        .limit(10)
        .snapshots()
        .map(_userListFromQuerySnapshot);
  }

  Stream<bool> isFollowing(uid, otherId) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("following")
        .doc(otherId)
        .snapshots()
        .map((snapshot) {
      return snapshot.exists;
    });
  }

  Future<void> followUser(uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('following')
        .doc(uid)
        .set({});

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('followers')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set({});
  }

  Future<void> unfollowUser(uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('following')
        .doc(uid)
        .delete();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('followers')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .delete();
  }

  Future<void> updateProfile(
      File _bannerImage, File _profileImage, String name) async {
    String bannerImageUrl = '';
    String profileImageUrl = '';

    if (_bannerImage != null) {
      bannerImageUrl = await _utilsService.uploadFile(_bannerImage,
          'user/profile/${FirebaseAuth.instance.currentUser.uid}/banner');
    }
    if (_profileImage != null) {
      profileImageUrl = await _utilsService.uploadFile(_profileImage,
          'user/profile/${FirebaseAuth.instance.currentUser.uid}/profile');
    }

    Map<String, Object> data = new HashMap();
    if (name != '') data['name'] = name;
    if (bannerImageUrl != '') data['bannerImageUrl'] = bannerImageUrl;
    if (profileImageUrl != '') data['profileImageUrl'] = profileImageUrl;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update(data);
  }
}
