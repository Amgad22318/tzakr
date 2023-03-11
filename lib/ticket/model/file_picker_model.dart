import 'package:file_picker/file_picker.dart';

class FilePickerModel{
  final PlatformFile file;
  final String fileName;

  FilePickerModel(this.file, this.fileName);
}