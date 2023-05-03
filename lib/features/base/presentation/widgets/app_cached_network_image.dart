import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String url;
  final Color? placeholderColor;
  final String? placeholder;
  final Color? imageColor;

  const AppCachedNetworkImage(
      {Key? key,
      this.width,
      this.height,
      required this.url,
         this.placeholder,
        this.placeholderColor,
      this.imageColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (width == 0 && height == 0) {
      return CachedNetworkImage(
        placeholder: (context, url) {
          return Container(
            color: placeholderColor ?? AppColors.canvasColor,
            child: Image.asset(placeholder??AppAssets.placeholder.imagePath, fit: BoxFit.cover),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            color: AppColors.canvasColor,
            child: Image.asset(placeholder??AppAssets.placeholder.imagePath, fit: BoxFit.cover),
          );
        },
        imageUrl: url,
        fit: BoxFit.cover,
        color: imageColor,
      );
    } else if (height == 0) {
      return CachedNetworkImage(
        placeholder: (context, url) {
          return Container(
            width: width,
            color: placeholderColor ?? AppColors.canvasColor,
            child: Image.asset(placeholder??AppAssets.placeholder.imagePath, fit: BoxFit.cover),

          );
        },
        errorWidget: (context, url, error) {
          return Container(
              width: width,
              color: AppColors.canvasColor,
              child: Image.asset(placeholder??AppAssets.placeholder.imagePath, fit: BoxFit.cover));
        },
        imageUrl: url,
        fit: BoxFit.cover,
        width: width,
        color: imageColor,
      );
    } else {
      return CachedNetworkImage(
        placeholder: (context, url) {
          // return const SizedBox.shrink();
          return Container(
              width: width,
              height: height,
              color: AppColors.canvasColor,
              child: Image.asset(placeholder??AppAssets.placeholder.imagePath, fit: BoxFit.cover));
        },
        errorWidget: (context, url, error) {
          return Image.asset(placeholder??AppAssets.placeholder.imagePath, fit: BoxFit.cover);
        },
        imageUrl: url,
        fit: BoxFit.cover,
        width: width,
        height: height,
        color: imageColor,
      );
    }
  }
}
