import 'package:flutter/material.dart';
import 'package:link_dev_task/app/utils/recources.dart';

class AppPlaceholderImage extends StatelessWidget {
  const AppPlaceholderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Resources.placeholder,
      fit: BoxFit.fill,
    );
  }
}
