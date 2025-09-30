import 'package:careercompass/constants.dart';
import 'package:flutter/material.dart';

class QuestionsViewBody extends StatefulWidget {
  const QuestionsViewBody({super.key});

  @override
  State<QuestionsViewBody> createState() => _QuestionsViewBodyState();
}

class _QuestionsViewBodyState extends State<QuestionsViewBody> {
  int currentStep = 0;
  int? selectedOption;

  final List<String> questions = [
    "What stage of your learning \njourney are you in?",
    "What is your preferred learning style?",
    "How many hours per week can you dedicate?",
    "Which subject interests you most?",
    "Do you prefer solo or group learning?",
    "What is your career goal?",
    "When do you plan to start?",
  ];

  final List<List<String>> options = [
    ["Less than High School", "High School", "University Student"],
    ["Visual", "Auditory", "Kinesthetic"],
    ["< 5 hours", "5–10 hours", "10+ hours"],
    ["Math", "Science", "Technology"],
    ["Solo", "Group"],
    ["Get a job", "Career growth", "Personal interest"],
    ["Immediately", "In a few months", "Later this year"],
  ];

  void nextStep() {
    if (selectedOption == null) return;

    if (currentStep < questions.length - 1) {
      setState(() {
        currentStep++;
        selectedOption = null; // reset for new question
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("🎉 You finished all questions!")),
      );
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
        selectedOption = null; // reset selection when going back
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentStep + 1) / questions.length;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40),

          /// Stepper Circles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(questions.length, (index) {
              bool isActive = index == currentStep;
              return CircleAvatar(
                radius: 16,
                backgroundColor:
                isActive ? mainColor : Colors.white,
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 30),

          /// Progress bar
          LinearProgressIndicator(
            value: progress,
            color: mainColor,
            backgroundColor: Colors.white,
          ),

          const SizedBox(height: 60),

          /// Question Card (image background)
          SizedBox(
            height: 180,
            child: _buildQuestionCard(questions[currentStep]),
          ),

          const SizedBox(height: 24),

          /// Options
          ...List.generate(options[currentStep].length, (index) {
            return RadioListTile<int>(
              value: index,
              groupValue: selectedOption,
              activeColor: const Color(0xff0C4C3C),
              title: Text(
                options[currentStep][index],
                style: const TextStyle(fontSize: 14),
              ),
              onChanged: (value) {
                setState(() => selectedOption = value);
              },
            );
          }),

          const Spacer(),

          /// Next Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Back button (only visible after first question)
              if (currentStep > 0)
                ElevatedButton(
                  onPressed: previousStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Back" , style: TextStyle(color: Colors.white),),
                )
              else
                const SizedBox(width: 80), // placeholder so "Next" stays aligned

              /// Next button
              ElevatedButton(
                onPressed: selectedOption != null ? nextStep : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0C4C3C),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Next", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),

        ],
      ),
    );
  }

  /// Custom Card with Image Background (no white card)
  Widget _buildQuestionCard(String question) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [

          /// Background image
          Positioned.fill(
            child: Image.asset(
              "assets/images/questionCard.png",
              fit: BoxFit.contain,
            ),
          ),

          /// Question text
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
