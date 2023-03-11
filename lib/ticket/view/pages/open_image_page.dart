import 'package:flutter/material.dart';
import 'package:tzaker_task/core/view/widgets/default_network_image.dart';

class OpenImagePage extends StatelessWidget {
  const OpenImagePage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
            tag: imageUrl,
            child: DefaultNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
