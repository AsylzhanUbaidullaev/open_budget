import 'package:drift/drift.dart' as dr;
import 'package:flutter/material.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/data/database.dart';
import 'package:open_budget/pages/home/provider/home_provider.dart';
import 'package:open_budget/pages/home/provider/offer_provider.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:provider/provider.dart';

class OfferProject extends StatefulWidget {
  OfferProject({Key? key}) : super(key: key);

  @override
  State<OfferProject> createState() => _OfferProjectState();
}

class _OfferProjectState extends State<OfferProject> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController uploaderName = TextEditingController();
  TextEditingController uploaderDescription = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController votesCount = TextEditingController();

  @override
  void initState() {
    title.text = 'title';
    description.text = 'description';
    uploaderName.text = 'uploaderName';
    uploaderDescription.text = 'uploaderDescription';
    price.text = 'price';
    address.text = 'address';
    votesCount.text = 'votesCount';
    super.initState();
  }

  bool status = true;
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return BaseProvider<OfferProjectProvider>(
      model: OfferProjectProvider(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: const Text('Project Submission'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListClumn(database, model),
          ),
        );
      },
    );
  }

  ListClumn(AppDatabase database, OfferProjectProvider model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: title,
        ),
        TextField(
          controller: description,
        ),
        TextField(
          controller: uploaderName,
        ),
        TextField(
          controller: uploaderDescription,
        ),
        TextField(
          controller: price,
        ),
        TextField(
          controller: address,
        ),
        TextField(
          controller: votesCount,
        ),
        Switch(
          value: status,
          onChanged: (value) => setState(() {
            status = value;
          }),
        ),
        ElevatedButton(
          onPressed: () => model.pickImage(),
          child: const Text('Pick Image'),
        ),
        // model.imageBytes == null
        //     ? const Text('No Image')
        //     : Image.memory(model.imageBytes!),
       model.isLoading
                ? CircularProgressIndicator()
                : Expanded(
                    child: SingleChildScrollView(
                      // child: SelectableText(model.base64Image!),
                      child: SelectableText(model.imageBytes.toString()),
                    ),
                  ),
        ElevatedButton(
          onPressed: () {
            final project = ProjectsCompanion(
              title: dr.Value(title.text),
              description: dr.Value(description.text),
              uploaderName: dr.Value(uploaderName.text),
              uploaderDescription: dr.Value(uploaderDescription.text),
              image: dr.Value(model.base64Image ?? ''),
              price: dr.Value(price.text),
              address: dr.Value(address.text),
              votesCount: dr.Value(votesCount.text),
              status: dr.Value(status),
            );

            database.insertProject(project);
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
