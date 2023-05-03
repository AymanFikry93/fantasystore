import 'package:flutter/material.dart';

class ContactUsRow extends StatelessWidget {
  const ContactUsRow({Key? key, required this.title, required this.child}) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(alignment: Alignment.centerRight,child: Text(title,style: Theme.of(context).textTheme.headlineMedium,)),
        const SizedBox(height: 20,),
        child,
        const SizedBox(height: 25,),
      ],
    );
  }
}