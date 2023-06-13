import 'package:chat_app/models/user_data.dart';

class ContactData {
  final int id;
  final int userId;
  final int contactUserId;
  final String contactCustomName;
  UserData? contactUser; // Reference to the associated user
  final DateTime contactLastUpdate;

  ContactData({
    required this.id,
    required this.userId,
    required this.contactUserId,
    required this.contactCustomName,
    this.contactUser,
    required this.contactLastUpdate,
  });
}
