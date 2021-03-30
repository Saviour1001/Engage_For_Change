// This is the class used for each user of the application.
class UserModel {
  final String id;
  final String bannerImageUrl;
  final String profileImageUrl;
  final String name;
  final String email;

  UserModel(
      {this.id,
      this.bannerImageUrl,
      this.profileImageUrl,
      this.name,
      this.email});
}
