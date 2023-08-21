import 'package:flutter/material.dart';
import 'package:link_dev_task/app/widgets/app_placeholder_image.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({required this.imageUrl, super.key});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return const AppPlaceholderImage(); //do something
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const AppPlaceholderImage();
      },
    );
  }
}
