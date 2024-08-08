import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/model/cv/user_education.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/error_handling.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  Future<void> eduSubmit(
      {required BuildContext context,
      required UserEducation userEducation}) async {
    try {
      var response = await http.post(
        Uri.parse(APIEndPoint.baseUrl +
            APIEndPoint.version +
            APIEndPoint.eduEndPoint.eduDetail),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: userEducation.toMap(),
      );
      if (!context.mounted) return;
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
