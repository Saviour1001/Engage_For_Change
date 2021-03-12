import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String jobDescription;
  final String jobType;
  final String orgName;
  final String orgContact;
  final Timestamp Posted_On;
  final Timestamp Apply_by;

  PostModel(
      {this.id,
      this.Apply_by,
      this.jobDescription,
      this.jobType,
      this.orgContact,
      this.orgName,
      this.Posted_On});
}
