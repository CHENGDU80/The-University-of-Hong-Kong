enum ChatSender { client, sales }

class ChatMessage {
  final ChatSender sender;
  final String message;
  final DateTime time;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.time,
  });
}
