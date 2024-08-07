import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/model/cv/cv_model.dart';
import 'package:frontend_mobile/screens/login/services/token_service.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/error_handling.dart';
import 'package:http/http.dart' as http;

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
