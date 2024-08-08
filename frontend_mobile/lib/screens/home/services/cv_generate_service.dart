import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/model/cv/cv_model.dart';
import 'package:frontend_mobile/screens/login/services/token_service.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/error_handling.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class CvGenerateService {
  // fetch all cv information
  Future<CV> getCV(BuildContext context) async {
    CV cv = CV(
        cvId: 0,
        userEducation: [],
        userSkill: [],
        userMajor: [],
        userLanguage: [],
        userAward: [],
        description: 'none',
        jobTitle: 'none',
        userCompany: [],
        reference: 'none');
    TokenService tokenService = TokenService();
    final token = await tokenService.getAccessToken();
    debugPrint('$token');
    try {
      http.Response response = await http.get(
        Uri.parse(APIEndPoint.baseUrl +
            APIEndPoint.version +
            APIEndPoint.authEndPoint.getCV),
        headers: {
          'Content-Type': 'application/json;',
          'Authorization': 'Bearer $token'
        },
      );
      debugPrint(response.body);
      debugPrint("got data");
      if (!context.mounted) return cv;
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          final resBody = json.decode(response.body);
          final body = resBody['body'];
          debugPrint('$body');
          debugPrint('$resBody');
          // CV.fromJson(
          //   jsonEncode(jsonDecode(response.body)[i]),
          // ),
          cv = CV.fromMap(body);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
      debugPrint("Error fetching data: $e"); // Log the error message
    }
    debugPrint(cv.description);
    return cv;
  }

  Future<void> myCV({
    required BuildContext context,
    required File imageFile,
    required int templateId,
  }) async {
    TokenService tokenService = TokenService();
    final token = await tokenService.getAccessToken();
    debugPrint('$token');
    try {
      // http.Response response = await http.post(
      //   Uri.parse(APIEndPoint.baseUrl +
      //       APIEndPoint.version +
      //       APIEndPoint.cvEndPoint.cvDetail),
      //   headers: {
      //     'Content-Type': 'application/json; charset=UTF-8',
      //     'Authorization': 'Bearer $token'
      //   },
      //   body: jsonEncode(
      //     {
      //       "image_file": imageFiile,
      //       'template': templateId,
      //     },
      //   ),
      // );
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(APIEndPoint.baseUrl +
                APIEndPoint.version +
                APIEndPoint.cvEndPoint.cvDetail)
            .replace(queryParameters: {'template': templateId.toString()}),
      );
      request.headers['Authorization'] = 'bearer $token';
      request.fields['template'] = templateId.toString();
      request.files.add(http.MultipartFile(
        'image_file',
        imageFile.readAsBytes().asStream(),
        imageFile.lengthSync(),
        filename: imageFile.path.split('/').last,
      ));
      final response = await request.send();
      // Convert the StreamedResponse to a Response

      print('Response: $response');
      if (!context.mounted) return;

      if (response.statusCode == 200) {
        debugPrint('File uploaded successfully');

        // Create a file to save the response
        // var outputFile =
        //     File(await getLocalFilePath(imageFile.path.split('/').last));

        // // Open a sink to write the response to the file
        // var fileSink = outputFile.openWrite();

        // // Write response stream to the file
        // await for (var chunk in response.stream) {
        //   fileSink.add(chunk);
        // }

        // // Close the sink
        // await fileSink.close();

        // Print the path of the saved file
        // print('File saved to: ');
      } else {
        debugPrint('File upload failed: ${response.statusCode}');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return;
  }

  Future<String> getLocalFilePath(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$fileName';
  }
}



    // required BuildContext context,
    // required cvId,
    // required User user,
    // required String description,
    // required String jobTitle,
    // required UserCompany userCompany,
    // required UserEducation userEducation,
    // required Skill userSkill,
    // required Major userMajor,
    // required Language userLanguage,
    // required UserAward userAward,
