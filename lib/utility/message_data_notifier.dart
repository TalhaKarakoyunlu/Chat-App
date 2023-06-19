import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';
import '../models/contact_data.dart';
import 'package:chat_app/models/message_data_2.dart';

import 'database_helper.dart';

class MessageDataNotifier with ChangeNotifier {

  List<MessageData2> _messages = [];
  List<MessageData2> get messages => _messages;

  DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> addNewMessage(String message, int senderId, int receiverId, String status) async {

    try {
      Results messageRows = await _databaseHelper.sendMessage(message, senderId, receiverId, status);

      late MessageData2 newMessage;

      for (var row in messageRows) {
        newMessage = MessageData2(
            id: row[0],
            message: row[1],
            sender_id: row[2],
            reciever_id: row[3],
            created_at: row[4],
            status: row[5]
        );
      }

      print(newMessage.message);
      print(newMessage.created_at);

      _messages.add(newMessage);

    } catch (e) {
      print('Error adding a new message: $e');
    }

  }


}