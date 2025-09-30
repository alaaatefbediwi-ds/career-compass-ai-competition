class DisplayJobsJob {
  final String title;
  final String sector;
  final String role;
  final double salary;
  final String description;
  final String responsibilities;
  final String skills;

  DisplayJobsJob({
    required this.title,
    required this.sector,
    required this.role,
    required this.salary,
    required this.description,
    required this.responsibilities,
    required this.skills,
  });

  factory DisplayJobsJob.fromJson(Map<String, dynamic> json) {
    return DisplayJobsJob(
      title: json["Job Title"] ?? "Unknown",
      sector: json["Sector"] ?? "Unknown",
      role: json["Role"] ?? "Unknown",
      salary: (json["Salary_avg"] ?? 0).toDouble(),
      description: json["Job Description"] ?? "",
      responsibilities: json["Responsibilities"] ?? "",
      skills: json["skills"] ?? "",
    );
  }
}
