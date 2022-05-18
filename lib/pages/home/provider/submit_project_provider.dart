import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:open_budget/data/database.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:path/path.dart' as p;

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:drift/drift.dart' as dr;
import 'package:provider/provider.dart';

class SubmitProjectProvider extends BaseBloc {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String district = 'nauryzbay'.tr();
  String category = 'all'.tr();
  // File? file;/
  List<File> files = [];
  List<String> fileNames = [];
  List<String> fileExtensions = [];
  Uint8List? imageBytes;
  String? _base64Image;
  AppDatabase? _database;

  final formKey = GlobalKey<FormState>();

  init(BuildContext context) {
    SizeConfig().init(context);
    _database = Provider.of<AppDatabase>(context);
    // titleController.text = 'title';
    // descriptionController.text = 'description';
    // authorController.text = 'uploaderName';
    // priceController.text = 'price';
    // addressController.text = 'address';
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pptx', 'doc', 'xlsx']);
    if (result != null) {
      final file = File(result.files.single.path!);
      files.add(file);
      fileNames.add(p.basename(file.path));
      fileExtensions.add(p.extension(file.path));
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: source);
    setLoading(true);
    imageBytes = await image!.readAsBytes();
    _base64Image = base64.encode(imageBytes!);
    setLoading(false);
    notifyListeners();
  }

  insertProject(context) {
    String filePaths = '';
    for (var element in files) {
      filePaths = filePaths + element.path + ',';
    }
    final project = ProjectsCompanion(
      title: dr.Value(titleController.text),
      description: dr.Value(descriptionController.text),
      uploaderName: dr.Value(authorController.text),
      uploaderDescription: dr.Value(category),
      image: dr.Value(_base64Image ?? ''),
      price: dr.Value(int.parse(priceController.text)),
      district: dr.Value(district),
      address: dr.Value(addressController.text),
      votesCount: dr.Value('0'),
      files: dr.Value(filePaths),
    );

    Navigator.of(context).pop(
      _database!.insertProject(project),
    );
  }

  List<String> districts = [
    'nauryzbay'.tr(),
    'alatau'.tr(),
    'zhetysu'.tr(),
    'almaly'.tr(),
    'bostandyk'.tr(),
    'medeu'.tr(),
    'auezov'.tr(),
    'turksib'.tr(),
  ];

  setDistrict(Object? value) {
    district = value.toString();
    notifyListeners();
  }

  List<String> categories = [
    'all'.tr(),
    'sidewalkArrangement'.tr(),
    'installation'.tr(),
    'creation'.tr(),
    'installationTwo'.tr(),
    'landscaping'.tr(),
    'construction'.tr(),
    'disposal'.tr(),
    'repair'.tr(),
  ];

  setCategory(Object? value) {
    category = value.toString();
    notifyListeners();
  }
}
