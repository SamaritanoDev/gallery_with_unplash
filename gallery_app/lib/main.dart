import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/app.dart';
import 'package:gallery_app/simple_bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}
