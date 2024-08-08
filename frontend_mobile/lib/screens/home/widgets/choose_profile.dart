import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/screens/cv_generate/resume_screen.dart';
import 'package:frontend_mobile/screens/home/services/cv_generate_service.dart';

class ChooseProfile extends StatefulWidget {
  const ChooseProfile({
    super.key,
  });

  @override
  State<ChooseProfile> createState() => _ChooseProfileState();
}

class _ChooseProfileState extends State<ChooseProfile> {
  File? _imageFile;

  CvGenerateService cvGenerateService = CvGenerateService();
  @override
  Widget build(BuildContext context) {
    return _imageFile != null
        ? Column(
            children: [
              Image.file(_imageFile!),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_imageFile!.path);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CVScreen(
                              file: _imageFile,
                            )));
                    
                  },
                  child: const Text("Proceed"))
            ],
          )
        : DottedBorder(
            strokeWidth: 1,
            dashPattern: const [6, 6],
            strokeCap: StrokeCap.round,
            borderType: BorderType.Circle,
            radius: const Radius.circular(24),
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () => pickMedia(),
              child: SizedBox(
                height: 160,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image,
                      color: AppColor.secondary,
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "Select Image",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColor.secondary),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Future pickMedia() async {
    var dio = Dio();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'], // Restrict to PDF files only);
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = file.path.split('/').last;
      String filePath = file.path;

      FormData data = FormData.fromMap({
        'x-apikey': 'apikey',
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
      });

      // var response =
      //     dio.post("", data: data, onSendProgress: (int sent, int total) {
      //   print("$sent, $total");
      // });
      setState(() {
        _imageFile = File(result.files.single.path!);
      });
    }
    // showLoadingDialog(context);

    // final picker = ImagePicker();
    // try {
    //   final media = await picker.pickMultipleMedia();
    //   onFileSelected(media);
    // } catch (e) {
    //   showInfoSnackBar(context, "Some media/files cannot be selected !");
    // } finally {
    //   // close loading dialog
    //   Navigator.pop(context);
    // }
  }
}
