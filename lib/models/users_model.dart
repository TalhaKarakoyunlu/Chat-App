
class Users {

  final int? id;
  final String username;
  final String email;
  final String password;

  const Users({this.id, required this.email, required this.username, required this.password});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'password': password
  };

}