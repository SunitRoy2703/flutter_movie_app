import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie_app.dart';
import 'package:flutter_riverpod/all.dart';

void main(){
  runApp(ProviderScope(child
      : MyApp()));
}