import 'package:careercompass/constants.dart';
import 'package:careercompass/features/questions/presentation/views/widgets/questions_view_body.dart';
import 'package:flutter/material.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightYellow,
      body: QuestionsViewBody(),
    );
  }
}
