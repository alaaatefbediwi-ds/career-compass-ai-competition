// models/job.dart
class Job {
  final int rank;
  final String title;
  final String sector;
  final String role;
  final double salary;
  final double distanceScore;

  Job({
    required this.rank,
    required this.title,
    required this.sector,
    required this.role,
    required this.salary,
    required this.distanceScore,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      rank: json["Rank"] ?? 0,
      title: json["Job Title"] ?? "Unknown",
      sector: json["Sector"] ?? "Unknown",
      role: json["Role"] ?? "",
      salary: (json["Average Salary (Aggregated)"] ?? 0).toDouble(),
      distanceScore: (json["Distance Score"] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Rank": rank,
      "Job Title": title,
      "Sector": sector,
      "Role": role,
      "Average Salary (Aggregated)": salary,
      "Distance Score": distanceScore,
    };
  }
}
