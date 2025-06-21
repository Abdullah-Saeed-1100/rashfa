import '../utils/error_message.dart';

validInput(String val, int min, int max) {
  if (val.isEmpty) {
    return ErrorMessage.messageInputEmpty;
  }
  if (val.length < min) {
    return "$ErrorMessage.messageInputMin  $min";
  }
  if (val.length > max) {
    return "$ErrorMessage.messageInputMax  $max";
  }
}
