import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../book_details_view.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookDetailsView()));
      },
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
                fit: BoxFit.fill,
                imageUrl: image),
          )),
    );
  }
}
