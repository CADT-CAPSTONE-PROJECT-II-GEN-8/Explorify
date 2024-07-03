class Internship {
  final int internshipPostId;
  final String jobTitle;
  final String location;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String jobDescription;
  final String jobDuration; // Assuming this is a string for now
  final String jobRequirement;
  final String jobType;
  final String qualification;
  final String salary; // Assuming this is a string for now
  final bool active;
  final DateTime deadline;
  final int userId;

  Internship({
    required this.internshipPostId,
    required this.jobTitle,
    required this.location,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.jobDescription,
    required this.jobDuration,
    required this.jobRequirement,
    required this.jobType,
    required this.qualification,
    required this.salary,
    required this.active,
    required this.deadline,
    required this.userId,
  });

  factory Internship.fromJson(Map<String, dynamic> json) => Internship(
        internshipPostId: json['internship_post_id'] as int,
        jobTitle: json['job_title'] as String,
        location: json['location'] as String,
        status: json['status'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        jobDescription: json['job_description'] as String,
        jobDuration: json['job_duration'] as String,
        jobRequirement: json['job_requirement'] as String,
        jobType: json['job_type'] as String,
        qualification: json['qualification'] as String,
        salary: json['salary'] as String,
        active: json['active'] as bool,
        deadline: DateTime.parse(json['deadline'] as String),
        userId: json['user_id'] as int,
      );
}
