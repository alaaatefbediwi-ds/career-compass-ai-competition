import 'package:careercompass/widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FindYourCareerViewBody extends StatefulWidget {
  const FindYourCareerViewBody({super.key});

  @override
  State<FindYourCareerViewBody> createState() => _FindYourCareerViewBodyState();
}

class _FindYourCareerViewBodyState extends State<FindYourCareerViewBody> {
  final TextEditingController _skillsController = TextEditingController();
  bool _isLoading = false;

  Future<void> _findCareer() async {
    final String skillsText = _skillsController.text.trim();
    if (skillsText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your skills first.")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        Uri.parse("https://filme-duties-orchestra-declined.trycloudflare.com/recommend"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"text": skillsText , "k": 3}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Pass response to /top_jobs
        Navigator.pushReplacementNamed(context, '/top_jobs', arguments: data);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Request failed: $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 160,
                width: 160,
                child: Image.asset(
                  "assets/images/big_bot.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "What are your skills and\nprofessional interests?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),

              // Input box
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  controller: _skillsController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText:
                    'I have strong Python and SQL skills, interested in data roles especially in banking services',
                  ),
                ),
              ),
              const SizedBox(height: 24),

              _isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                text: "Find Your Career",
                onPressed: _findCareer,
                fontSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
