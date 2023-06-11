class ContactData {
  final int id;
  final int userId;
  final int contactUserId;
  final String contactCustomName;
  late final String contactName;
  final String contactUsername;
  final String contactPhoneNumber;
  final String contactEmail;
  final String? contactImageURL;
  final DateTime contactLastUpdate;

  ContactData({
    required this.id,
    required this.userId,
    required this.contactUserId,
    required this.contactCustomName,
    required this.contactName,
    required this.contactUsername,
    required this.contactPhoneNumber,
    required this.contactEmail,
    required this.contactImageURL,
    required this.contactLastUpdate,
  });
}
