import 'package:flutter/material.dart';
import 'package:gallery_app/photos/views/widgets.dart';

class PhotosDetail extends StatelessWidget {
  final String urlPhoto;

  const PhotosDetail({
    super.key,
    required this.urlPhoto,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: const NavigationCustom(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 19, right: 19),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SearchCustom(),
              const SizedBox(height: 27),
              Expanded(
                child: Container(
                  width: 347,
                  height: 653,
                  decoration: BoxDecoration(
                    color: color.tertiary,
                    image: DecorationImage(
                      image: NetworkImage(urlPhoto),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
