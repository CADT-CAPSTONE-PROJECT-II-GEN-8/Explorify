import 'package:frontend_mobile/model/cv/user_model.dart';
import 'package:frontend_mobile/model/internship/tag_model.dart';

class Internship {
  final int internshipPostId;
  final String jobTitle;
  final String location;
  final String status;
  final String jobDescription;
  final String jobDuration; // Assuming this is a string for now
  final String jobRequirement;
  final String jobType;
  final String qualification;
  final String salary; // Assuming this is a string for now
  final bool active;
  final DateTime deadline;
  final User user;
  final List<Tag> tags;

  Internship(
      {required this.internshipPostId,
      required this.jobTitle,
      required this.location,
      required this.status,
      required this.jobDescription,
      required this.jobDuration,
      required this.jobRequirement,
      required this.jobType,
      required this.qualification,
      required this.salary,
      required this.active,
      required this.deadline,
      required this.user,
      required this.tags});

  factory Internship.fromJson(Map<String, dynamic> json) => Internship(
        internshipPostId: json['internship_post_id'] as int,
        jobTitle: json['job_title'] as String,
        location: json['location'] as String,
        status: json['status'] as String,
        jobDescription: json['job_description'] as String,
        jobDuration: json['job_duration'] as String,
        jobRequirement: json['job_requirement'] as String,
        jobType: json['job_type'] as String,
        qualification: json['qualification'] as String,
        salary: json['salary'] as String,
        active: json['active'] as bool,
        deadline: DateTime.parse(json['deadline'] as String),
        user: User.fromMap(json['user'] as Map<String, dynamic>),
        tags: (json['tags'] as List)
            .map((tagJson) => Tag.fromMap(tagJson))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'internship_post_id': internshipPostId,
        'job_title': jobTitle,
        'location': location,
        'status': status,
        'job_description': jobDescription,
        'job_duration': jobDuration,
        'job_requirement': jobRequirement,
        'job_type': jobType,
        'qualification': qualification,
        'salary': salary,
        'active': active,
        'deadline': deadline.toString(), // Convert DateTime to String
        'user': user.toMap(),
        'tags': tags.map((tag) => tag.toMap()).toList(),
      };
}
