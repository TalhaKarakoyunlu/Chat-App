import 'package:flutter/material.dart';

@immutable
class MessageData2 {
  final int id;
  final String message;
  final int sender_id;
  final int reciever_id;
  final DateTime created_at;
  final String status;

  const MessageData2({
        required this.id,
        required this.message,
        required this.sender_id,
        required this.reciever_id,
        required this.created_at,
        required this.status
  });
}