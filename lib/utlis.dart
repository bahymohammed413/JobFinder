import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickimage(ImageSource source) async {
  final ImagePicker _imagepicker = ImagePicker();
  XFile? _file = await _imagepicker.pickImage(source: source);
  if (_file != Null) {
    return await _file?.readAsBytes();
  }
  print('no image selected');
}
