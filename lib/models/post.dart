import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String jobDescription;
  final String jobTitle;
  final String State;
  final String City;
  final String Address;
  final String orgName;
  final String orgContact;
  final Timestamp Posted_On;
  final Timestamp Apply_by;

  PostModel(
      {this.id,
      this.orgName,
      this.orgContact,
      this.State,
      this.City,
      this.Address,
      this.jobTitle,
      this.jobDescription,
      this.Apply_by,
      this.Posted_On});
}
