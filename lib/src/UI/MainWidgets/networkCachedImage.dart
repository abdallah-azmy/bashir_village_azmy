import 'package:bashir_village/src/Helpers/myColors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String image;
  final fit;

  const CustomCachedNetworkImage({Key key, @required this.image, this.fit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (image == null ||
        image == "https://easy-card.site/uploads/users/default.png") {
      return Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Lottie.asset(
            'assets/lolitJson/profile.json',
            fit: BoxFit.fill,
          ),
        ),
      );
    }
    try {
      return CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
            ),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        // progressIndicatorBuilder: (context, url, downloadProgress) =>
        //     Center(
        //       child: CircularProgressIndicator(
        //   value: downloadProgress.progress,
        //   color: MyColors.blueBlack2,
        // ),
        //     ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    } catch (e) {
      print(e);
      return Container(
        color: Colors.black,
        child: Lottie.asset(
          'assets/lolitJson/errorNotFound.json',
          fit: BoxFit.fill,
        ),
      );
    }
  }
}
