import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/photos/bloc/photo_bloc.dart';
import 'package:gallery_app/photos/views/photos_list.dart';
import 'package:gallery_app/photos/views/widgets.dart';
import 'package:http/http.dart' as http;

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigationCustom(),
      body: BlocProvider(
        create: (_) =>
            PhotoBloc(httpClient: http.Client())..add(PhotoFetched()),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 19, right: 19),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchCustom(),
                SizedBox(height: 27),
                Expanded(
                  child: PhotosList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

