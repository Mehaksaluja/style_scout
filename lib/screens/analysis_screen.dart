import 'dart:io';
import 'package:flutter/material.dart';
import 'package:style_scout/services/ai_service.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AnalysisScreen extends StatefulWidget {
  final File imageFile;
  const AnalysisScreen({super.key, required this.imageFile});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final AIService _aiService = AIService();
  bool _isLoading = true;
  // This will now hold the full text response from the AI.
  String _aiResponse = "";

  @override
  void initState() {
    super.initState();
    _startAnalysis();
  }

  Future<void> _startAnalysis() async {
    final response = await _aiService.analyzeImage(widget.imageFile);

    // TODO: Save the response and image to Firestore for history.

    if (mounted) {
      setState(() {
        _isLoading = false;
        _aiResponse = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Style Guide'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _isLoading
          // If loading, show a centered spinner with a status message.
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: theme.primaryColor),
                  const SizedBox(height: 20),
                  const Text('Our stylist is analyzing your look...'),
                ],
              ),
            )
          // If not loading, show the results in a two-part scrollable view.
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // The image is displayed at the top.
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.file(widget.imageFile),
                    ),
                  ),

                  // The AI's response is rendered below using the Markdown widget.
                  // This will automatically handle bolding, lists, etc.
                  MarkdownBody(
                    data: _aiResponse,
                    styleSheet: MarkdownStyleSheet.fromTheme(theme).copyWith(
                      p: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      h2: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
