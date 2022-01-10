import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// class CustomNetworkImage extends StatelessWidget {
//   final String image;
//   final  fit;
//
//   const CustomNetworkImage({Key key, @required this.image,this.fit}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     if (image == null || image == "https://easy-card.site/uploads/users/default.png") {
//       return
//         Container(
//           color: Colors.black,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Lottie.asset(
//               'assets/lolitJson/profile.json',
//               fit: BoxFit.fill,
//
//             ),
//           ),
//         );
//     }
//     try {
//       return Image.network(
//         image,
//         fit: fit ?? BoxFit.cover,
//         errorBuilder:
//             (BuildContext context, Object exception, StackTrace stackTrace) {
//           print('Error Handler');
//           return  Container(
//             color: Colors.black,
//             child: Lottie.asset(
//               'assets/lolitJson/errorNotFound.json',
//               fit: BoxFit.fill,
//
//             ),
//           );
//         },
//         loadingBuilder: (BuildContext context, Widget child,
//             ImageChunkEvent loadingProgress) {
//           if (loadingProgress == null) return child;
//           return Center(
//             child: CircularProgressIndicator(
//               color: MyColors.blueBlack2,
//               value: loadingProgress.expectedTotalBytes != null
//                   ? loadingProgress.cumulativeBytesLoaded /
//                   loadingProgress.expectedTotalBytes
//                   : null,
//             ),
//           );
//         },
//       );
//     } catch (e) {
//       print(e);
//       return  Container(
//         color: Colors.black,
//         child: Lottie.asset(
//           'assets/lolitJson/errorNotFound.json',
//           fit: BoxFit.fill,
//
//         ),
//       );
//     }
//   }
// }
//
//







class CustomNetworkImage extends StatelessWidget {
  final String image;
  final  fit;

  const CustomNetworkImage({Key key, @required this.image,this.fit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (image == null || image == "https://easy-card.site/uploads/users/default.png") {
      return
        Container(
          color: Colors.black,
          child: Center(
            child: Lottie.asset(
              'assets/lolitJson/errorNotFound.json',
              fit: BoxFit.cover,

            ),
          ),
        );
    }
    try {
      return FadeInImage.assetNetwork(
       image: image,
        fit: fit ?? BoxFit.cover,

        imageErrorBuilder:
            (BuildContext context, Object exception, StackTrace stackTrace) {
          print('Error Handler');
          return  Container(
            color: Colors.black,
            child: Center(
              child: Lottie.asset(
                'assets/lolitJson/errorNotFound.json',
                fit: BoxFit.cover,

              ),
            ),
          );
        },
        fadeInDuration: Duration(milliseconds: 500),
        // placeholder: "assets/appleLoading.gif",
        placeholder: "assets/placeholder.png",


        // loadingBuilder: (BuildContext context, Widget child,
        //     ImageChunkEvent loadingProgress) {
        //   if (loadingProgress == null) return child;
        //   return Center(
        //     child: CircularProgressIndicator(
        //       color: MyColors.blueBlack2,
        //       value: loadingProgress.expectedTotalBytes != null
        //           ? loadingProgress.cumulativeBytesLoaded /
        //               loadingProgress.expectedTotalBytes
        //           : null,
        //     ),
        //   );
        // },
      );
    } catch (e) {
      print(e);
      return  Container(
        color: Colors.black,
        child: Center(
          child: Lottie.asset(
            'assets/lolitJson/errorNotFound.json',
            fit: BoxFit.cover,

          ),
        ),
      );
    }
  }
}