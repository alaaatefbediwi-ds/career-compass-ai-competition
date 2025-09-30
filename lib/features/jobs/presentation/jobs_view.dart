import 'package:careercompass/features/jobs/presentation/views/widgets/jobs_view_body.dart';
import 'package:flutter/material.dart';

class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JobsViewBody(),
    );
  }
}
