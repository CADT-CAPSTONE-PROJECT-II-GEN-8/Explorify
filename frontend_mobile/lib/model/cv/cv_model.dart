import 'dart:convert';

import 'package:frontend_mobile/model/cv/user_company_model.dart';
import 'package:frontend_mobile/model/cv/language_model.dart';
import 'package:frontend_mobile/model/cv/major_model.dart';
import 'package:frontend_mobile/model/cv/skill_model.dart';
import 'package:frontend_mobile/model/cv/user_award_model.dart';
import 'package:frontend_mobile/model/cv/user_education.dart';
import 'package:frontend_mobile/model/cv/user_model.dart';

// Assuming you have models for User, UserCompany, UserEducation, Skill, Major, Language, and UserAward

class CV {
  final int cvId;
  final User? user;
  final String? description;
  final String? jobTitle;
  final List<UserCompany>? userCompany;
  final List<UserEducation>? userEducation;
  final List<Skill>? userSkill;
  final List<Major>? userMajor;
  final List<Language>? userLanguage;
  final List<UserAward>? userAward;

  CV({
    required this.cvId,
    this.user,
    this.description,
    this.jobTitle,
    this.userCompany,
    required this.userEducation,
    required this.userSkill,
    required this.userMajor,
    required this.userLanguage,
    required this.userAward,
  });

  // CV copyWith({
  //   int? cvId,
  //   User? user,
  //   String? description,
  //   String? jobTitle,
  //   UserCompany? userCompany,
  //   UserEducation? userEducation,
  //   Skill? userSkill,
  //   Major? userMajor,
  //   Language? userLanguage,
  //   UserAward? userAward,
  // }) {
  //   return CV(
  //     cvId: cvId ?? this.cvId,
  //     user: user ?? this.user,
  //     description: description ?? this.description,
  //     jobTitle: jobTitle ?? this.jobTitle,
  //     userCompany: userCompany ?? this.userCompany,
  //     userEducation: userEducation ?? this.userEducation,
  //     userSkill: userSkill ?? this.userSkill,
  //     userMajor: userMajor ?? this.userMajor,
  //     userLanguage: userLanguage ?? this.userLanguage,
  //     userAward: userAward ?? this.userAward,
  //   );
  // }

  factory CV.fromMap(Map<String, dynamic> map) {
    return CV(
      cvId: map['cv_id'] as int,
      user: map['user'] != null
          ? User.fromMap(map['user'] as Map<String, dynamic>)
          : null, // Assuming User has a fromMap factory
      description: map['description'] as String?,
      jobTitle: map['job_title'] as String?,
      userCompany: map['user_companies'] != null
          ? List<UserCompany>.from(
              (map['user_companies'] as List<dynamic>).map(
                (item) => UserCompany.fromMap(item as Map<String, dynamic>),
              ),
            )
          : null,
      userEducation: map['user_education'] != null
          ? List<UserEducation>.from(
              (map['user_education'] as List<dynamic>).map(
                (item) => UserEducation.fromMap(item as Map<String, dynamic>),
              ),
            )
          : null,
      userSkill: map['user_skill'] != null
          ? List<Skill>.from(
              (map['user_skill'] as List<dynamic>).map(
                (item) => Skill.fromMap(item as Map<String, dynamic>),
              ),
            )
          : null,
      userMajor: map['user_major'] != null
          ? List<Major>.from(
              (map['user_major'] as List<dynamic>).map(
                (item) => Major.fromMap(item as Map<String, dynamic>),
              ),
            )
          : null,
      userLanguage: map['user_language'] != null
          ? List<Language>.from(
              (map['user_language'] as List<dynamic>).map(
                (item) => Language.fromMap(item as Map<String, dynamic>),
              ),
            )
          : null,
      userAward: map['user_award'] != null
          ? List<UserAward>.from(
              (map['user_award'] as List<dynamic>).map(
                (item) => UserAward.fromMap(item as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  // Map<String, dynamic> toMap() => {
  //       'cv_id': cvId,
  //       'user': user?.toMap(), // Assuming User has a toMap method
  //       'description': description,
  //       'job_title': jobTitle,
  //       'user_companies': userCompany?.toMap(), // Handle null case
  //       'user_education': userEducation?.toMap(),
  //       'user_skill': userSkill?.toMap(),
  //       'user_major': userMajor?.toMap(),
  //       'user_language': userLanguage?.toMap(),
  //       'user_award': userAward?.toMap(),
  //     };
  // String toJson() => json.encode(toMap());
  factory CV.fromJson(String source) => CV.fromMap(json.decode(source));
  @override
  String toString() => 'CV {cvId: $cvId, userId: ${user!.userId}}';
}
