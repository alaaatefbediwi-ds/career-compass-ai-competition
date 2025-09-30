import 'package:careercompass/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:careercompass/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

import '../../jobs/presentation/jobs_view.dart';
import '../../questions/presentation/questions_view.dart';
import '../../top_jobs/presentation/find_your_career_view.dart';
import '../../top_jobs/presentation/top_jobs_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeViewBody(),
    JobsView(),
    FindYourCareerView(),
    QuestionsView(),
    TopJobsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
