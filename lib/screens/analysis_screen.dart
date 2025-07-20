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
  String _aiResponse = "";

  @override
  void initState() {
    super.initState();
    _startAnalysis(); // We call the simplified analysis function
  }

  Future<void> _startAnalysis() async {
    final response = await _aiService.analyzeImage(widget.imageFile);

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
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
