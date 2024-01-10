import 'dart:convert';

import 'package:flutter_application_1/photo.dart';
import 'package:http/http.dart' as http;

class photorepo{
  Future<List<Photo>> fetchPosts() async {
    final response = 
     await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if (response.statusCode == 200){
    List<dynamic> jsonPosts = json.decode(response.body);
    List<Photo> posts = jsonPosts.map((json) => Photo.fromJson(json)).toList();
    return posts;
  }else {
    throw Exception('Erreur de chargement');
}
}

Future<Photo> createPhoto(Photo photo) async {
  final response = await http.post(
    Uri.parse("https://jsonplaceholder.typicode.com/photos"),
    headers: {'Content-Type' : 'application/json'},
    body: jsonEncode(photo.toJson()),
  );

  if (response.statusCode == 201) {
    return Photo.fromJson(json.decode(response.body));

  } else {
    throw Exception('Ereeur de creation');
  }
}

}