import 'dart:convert';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:open_budget/base/base_bloc.dart';

class OfferProjectProvider extends BaseBloc {
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  Uint8List? imageBytes;
  String? base64Image;

  pickImage() async {
    image = await _picker.pickImage(source: ImageSource.camera);
    setLoading(true);
    imageBytes = await image!.readAsBytes();
    base64Image = base64.encode(imageBytes!);
    setLoading(false);
    // log(imageBytes.toString());
    notifyListeners();
  }
}
