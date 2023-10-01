import 'package:fluttertoast/fluttertoast.dart';

showToast(String message) {
  Fluttertoast.showToast(
    msg: message.trim(),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,

  );
}

