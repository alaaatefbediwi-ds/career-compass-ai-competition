import 'package:careercompass/constants.dart';
import 'package:careercompass/features/jobs/presentation/views/widgets/job_card.dart';
import 'package:careercompass/features/jobs/presentation/views/widgets/jobs_container.dart';
import 'package:flutter/material.dart';
import '../../../../home/presentation/views/widgets/custom_search_bar.dart';


class JobsViewBody extends StatelessWidget {
  const JobsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Custom AppBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    const Text(
                      "Search Jobs",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(), // keeps title centered
                    const SizedBox(width: 48), // placeholder for symmetry
                  ],
                ),
              ),

              /// Search Bar
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomSearchBar(showSettings: false),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: JobsContainer(
                  title: "Digital Marketing Specialist",
                  sector: "Diversified",
                  role: "Social Media Manager",
                  salary: 316000.0,
                  color: mainColor,
                  icon: Icons.work,
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: JobsContainer(
                  title: "Web Developer",
                  sector: "Financial Services",
                  role: "Frontend Web Developer",
                  salary: 350500.0,
                  color: mainColor,
                  icon: Icons.computer,
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: JobsContainer(
                  title: "Operations Manager",
                  sector: "Insurance",
                  role: "Quality Control Manager",
                  salary: 301000.0,
                  color: mainColor,
                  icon: Icons.business_center,
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: JobsContainer(
                  title: "Network Engineer",
                  sector: "Energy",
                  role: "Wireless Network Engineer",
                  salary: 329429.0,
                  color: mainColor,
                  icon: Icons.network_check,
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: JobsContainer(
                  title: "Event Manager",
                  sector: "Energy",
                  role: "Conference Manager",
                  salary: 311500.0,
                  color: mainColor,
                  icon: Icons.event,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
