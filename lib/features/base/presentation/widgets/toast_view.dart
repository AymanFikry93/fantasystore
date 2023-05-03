import 'package:flutter/material.dart';

class ToastView extends StatelessWidget {
  final bool isSuccess;
  final String message;

  const ToastView({Key? key, required this.isSuccess, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: (isSuccess ? Colors.green : Colors.red).withOpacity(0.8),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Theme.of(context).canvasColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
