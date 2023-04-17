import 'dart:io';

import 'package:flutter/services.dart';

abstract class SaveMemeImage {
  Future<File> call(Uint8List imageBytes, String imageId);
}
