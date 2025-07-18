import "package:flutter/material.dart";
import "package:flutter/services.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              Text(
                "Style Scout",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                "Find Fashion from photos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 40),

              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: theme.primaryColor.withValues(alpha: 0.5),
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white54,
                  size: 80,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  // This function is empty for now. We will add functionality later.
                  print('Take Photo button pressed');
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Take Photo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      theme.primaryColor, // Use our theme's primary color.
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600, // Corresponds to SemiBold.
                    fontFamily: 'Poppins',
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // This is the button for uploading from the gallery.
              ElevatedButton.icon(
                onPressed: () {
                  // This function is empty for now.
                  print('Upload from Gallery button pressed');
                },
                icon: const Icon(Icons.photo_library),
                label: const Text('Upload from Gallery'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF2A2A4D,
                  ), // A slightly lighter navy.
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
