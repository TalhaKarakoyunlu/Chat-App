class UserData {
  final int id;
  final String name;
  final String username;
  final String phoneNumber;
  final String email;
  final String password;
  final String? profilePictureURL;
  final dynamic last_update;

  UserData(
      {required this.name,
      required this.username,
      required this.phoneNumber,
      required this.email,
      required this.password,
      required this.profilePictureURL,
      required this.id,
      required this.last_update});
}
