class UserData {
  final int id;
  late final String name;
  final String username;
  final String phoneNumber;
  final String email;
  final String password;
  final String? profilePictureURL;
  final DateTime registration_date;
  final DateTime last_update;

  UserData(
      {required this.name,
      required this.username,
      required this.phoneNumber,
      required this.email,
      required this.password,
      required this.profilePictureURL,
      required this.id,
        required this.registration_date,
      required this.last_update});
}
