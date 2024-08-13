import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> saveImageLocally(String imagePath) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = imagePath.split('/').last;
    final localImage = File('${directory.path}/$fileName');

    // 이미지 복사
    final newImage = await File(imagePath).copy(localImage.path);
    return newImage.path;
  } catch (e) {
    print("Error saving image locally: $e");
    return '';
  }
}
