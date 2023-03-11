import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/view/widgets/default_error_widget.dart';
import 'package:tzaker_task/core/view/widgets/default_loading_indicator.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage({
    super.key,
    this.padding,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  });

  final double? padding;
  final double? height;
  final double? width;
  final String imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        height: height,

        width: width,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: DefaultLoadingIndicator(strokeWidth: 4.r,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return const DefaultErrorWidget();
        },
      );
    } else {
      return const DefaultErrorWidget();
    }
  }
}
