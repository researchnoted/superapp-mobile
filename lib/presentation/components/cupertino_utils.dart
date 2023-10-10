import 'package:flutter/cupertino.dart';

void alertConfirmationDialogCupertino(
    BuildContext context, String title, String content) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text("Confirmation"),
        content: Text("Are you sure you want to continue?"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          CupertinoDialogAction(
            child: Text("Confirm"),
            onPressed: () {
              // Perform the action when the user confirms
              // onPressedCallback; // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
