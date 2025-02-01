import 'package:image_picker/image_picker.dart';

class ChooseImage {
  final ImageSource source;

  ChooseImage(this.source);

  Future<XFile?> getImage() async {
    // Check and request permissions
    // if (await _requestStoragePermission()) {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      return XFile(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }
  // else {
  //   print('Permission denied.');
  //   return null;
  // }
}

  // Future<bool> _requestStoragePermission() async {
  //   PermissionStatus status = await Permission.storage.status;

  //   if (status.isDenied || status.isRestricted) {
  //     // Request permission if denied
  //     status = await Permission.storage.request();
  //   }

  //   if (status.isGranted) {
  //     print('Storage permission granted.');
  //     return true;
  //   } else {
  //     print('Storage permission denied.');
  //     return false;
  //   }
  // }

