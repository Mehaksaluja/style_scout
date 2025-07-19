import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';
// 1. Import the dotenv package
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  // 2. Read the API key from the loaded environment variables.
  // The '!' tells Dart that we are certain this value will not be null after loading.
  final String _apiKey = dotenv.env['GEMINI_API_KEY']!;

  final GenerativeModel _model;

  // The constructor now uses the _apiKey variable we just defined.
  AIService()
    : _model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: dotenv.env['GEMINI_API_KEY']!,
      );

  Future<String> analyzeImage(File imageFile) async {
    try {
      final imageBytes = await imageFile.readAsBytes();
      const prompt =
          "You are an expert fashion stylist. Analyze the outfit in this image and provide a concise but helpful style guide. "
          "Your response should be in Markdown format. Include the following sections: "
          "1. **Style Description**: A brief overview of the outfit's style (e.g., 'Casual Chic', 'Bohemian', 'Formal'). "
          "2. **Color Palette**: Describe the main colors and suggest complementary colors. "
          "3. **Good For**: Suggest occasions or events where this outfit would be appropriate. "
          "4. **Style Tip**: Provide one actionable tip to enhance or accessorize this look.";

      final content = [
        Content.multi([TextPart(prompt), DataPart('image/jpeg', imageBytes)]),
      ];

      final response = await _model.generateContent(content);
      return response.text ?? 'Could not analyze the image.';
    } catch (e) {
      print('Error analyzing image: $e');
      return 'Error: Could not analyze the image.';
    }
  }
}
