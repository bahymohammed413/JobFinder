import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jom/utlis.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'bahhhhy',
      home: const profilepage1(title: 'bahujdjepj'),
    );
  }
}

class profilepage1 extends StatefulWidget {
  const profilepage1({required this.title});
  final String title;
  @override
  State<profilepage1> createState() => _profilepage1State();
}

class _profilepage1State extends State<profilepage1> {
  Uint8List? _image;

  void selectimage() async {
    Uint8List img = await pickimage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 65,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 65,
                        backgroundImage: NetworkImage(
                            'https://static.vecteezy.com/system/resources/previews/020/765/399/non_2x/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg'),
                      ),
                Positioned(
                  child: IconButton(
                    onPressed: selectimage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                  bottom: -10,
                  left: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
