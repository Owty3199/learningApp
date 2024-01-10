import 'package:flutter/material.dart';
import 'package:flutter_application_1/photo.dart';
import 'package:flutter_application_1/PhotoRepository.dart'; // Assuming the photorepo class is in PhotoRepository.dart

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PhotoList(),
    );
  }
}

class PhotoList extends StatefulWidget {
  const PhotoList({Key? key}) : super(key: key);

  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  late final photorepo _photoRepo; // Corrected the class name to Photorepo

  @override
  void initState() {
    super.initState();
    _photoRepo = photorepo(); // Corrected the class name to Photorepo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo List'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: _photoRepo.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show a loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final List<Photo>? photos = snapshot.data;
            return ListView.builder(
              itemCount: photos!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(photos[index].title),
                  subtitle: Image.network(photos[index].thumbenailUrl),
                );
              },
            );
          }
        },
      ),
    );
  }
}
