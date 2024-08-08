import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/model/internship/internship_posting.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/error_handling.dart';
import 'package:http/http.dart' as http;

class InternshipService {
  Future<List<Internship>> getInternshipDetials(BuildContext context) async {
    List<Internship> internship = [];
    try {
      http.Response response = await http.get(Uri.parse(APIEndPoint.baseUrl +
          APIEndPoint.version +
          APIEndPoint.internEndPoint.getInternshipDetials));

      if (!context.mounted) return internship;
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          // showSnackBar(context, 'Success Display!');
          final data = jsonDecode(response.body);
          debugPrint('$data');
          final List<dynamic> internshipsData = data['results'];
          // debugPrint('My Internship details: $internshipsData');
          for (int i = 0; i < data['results'].length; i++) {
            internship.add(
              Internship.fromJson(internshipsData[i]),
            );
            // debugPrint('Results of list: ${internship[0]}');
          }
          // debugPrint("My Internship details: $internship");

          // // Navigator.pushNamed(context, RouteManager.verifyScreen,
          // // arguments: {'username': username, 'password': password});
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) =>
          //         VerifyPage(username: username, password: password)));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return internship;
  }
}
