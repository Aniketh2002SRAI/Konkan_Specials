import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  const CachedImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setWidth(150),
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        height: ScreenUtil().setHeight(150),
          width: ScreenUtil().setWidth(150),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[500]!,
              highlightColor: Colors.white,
              child: Container(color: Colors.grey[300]),
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: Colors.grey[300],
      ),
    );
  }
}
