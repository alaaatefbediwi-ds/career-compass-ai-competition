import 'package:careercompass/constants.dart';
import 'package:careercompass/features/top_jobs/presentation/views/career_card.dart';
import 'package:flutter/material.dart';
import '../../../../models/job_model.dart';

class TopJobsViewBody extends StatelessWidget {
  const TopJobsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final List<Job> jobs = args is Map && args["results"] is List
        ? (args["results"] as List)
        .map((item) => Job.fromJson(item as Map<String, dynamic>))
        .toList()
        : [];

    return Scaffold(
      backgroundColor: lightWhite,
      appBar: AppBar(
        backgroundColor: lightWhite,
        title: const Text("Career Compass", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/icons/bot.png", fit: BoxFit.contain),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: jobs.isEmpty
              ? const Center(child: Text("No jobs found."))
              : ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top ${job.rank}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CareerCard(
                    title: job.title,
                    role: job.role,
                    salary: job.salary,
                    sector: job.sector,
                    color: mainColor, // fallback
                    icon: Icons.work,  // fallback
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}