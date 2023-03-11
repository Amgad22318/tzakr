import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
