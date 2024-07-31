import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/model/internship/company_profile.dart';
import 'package:frontend_mobile/model/internship/internship_posting.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/error_handling.dart';
import 'package:http/http.dart' as http;

class CompanyService {
  Future<List<CompanyProfile>> getCompanyDetails(
      BuildContext context) async {
    List<CompanyProfile> company = [];
    try {
      http.Response response = await http.get(Uri.parse(APIEndPoint.baseUrl +
          APIEndPoint.version +
          APIEndPoint.companyEndPoint.getCompanyDetails));

      if (!context.mounted) return company;
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          // showSnackBar(context, 'Success Display!');
          final data = jsonDecode(response.body);
          // debugPrint('$data');
          final List<dynamic> companyData = data['results'];
          // debugPrint('My Internship details: $internshipsData');
          for (int i = 0; i < data['results'].length; i++) {
            company.add(
              CompanyProfile.fromMap(companyData[i]),
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
    return company;
  }
}
