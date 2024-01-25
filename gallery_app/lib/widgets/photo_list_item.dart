import 'package:flutter/material.dart';
import 'package:gallery_app/photos/models/models.dart';

class PhotoListItem extends StatelessWidget {
  final Photo photo;

  const PhotoListItem({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 109,
        height: 95,
        decoration: BoxDecoration(
          color: color.secondary,
          image: DecorationImage(
            image: NetworkImage(photo.url.raw),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
