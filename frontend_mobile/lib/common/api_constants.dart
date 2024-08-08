class APIEndPoint {
  static const String baseUrl = 'http://10.0.2.2:8989/api';
  static const String version = '/v1';
  static _AuthEndPoint authEndPoint = _AuthEndPoint();
  static _InternshipEndPoint internEndPoint = _InternshipEndPoint();
  static _CompanyEndPoint companyEndPoint = _CompanyEndPoint();
  static _PostEndPoint postEndPoint = _PostEndPoint();
  static _EduEndPoint eduEndPoint = _EduEndPoint();
  static _CVEndPoint cvEndPoint = _CVEndPoint();
}

class _AuthEndPoint {
  final String register = "/account/create/";
  final String login = "/account/generate/";
  final String getToken = "/account/login_with_otp/";
  final String getCV = "/cv-form-data/";
}

class _InternshipEndPoint {
  final String getInternshipDetials = "/internship-posts/list/";
}

class _CompanyEndPoint {
  final String getCompanyDetails = "/company/list/";
}

class _PostEndPoint {
  final String getPostList = "/posts/list/";
}

class _EduEndPoint {
  final String eduDetail = "/cv/user-educations/";
}

class _CVEndPoint {
  final String cvDetail = '/cv-form-data/';
}
