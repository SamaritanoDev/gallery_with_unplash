import 'package:flutter/material.dart';
import 'package:gallery_app/photos/views/photos_page.dart';

class App extends MaterialApp {
  
  const App({super.key})
      : super(
      
          home: const PhotosPage(),
        );
}
