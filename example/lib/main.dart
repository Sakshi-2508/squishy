import 'package:flutter/material.dart';
import 'package:squishy/squishy.dart';

void main() {
  runApp(const SquishyDemoApp());
}

class SquishyDemoApp extends StatelessWidget {
  const SquishyDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Squishy Blob Demo',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 239, 239),
      appBar: AppBar(
        title: const Text(
          "Squishy 🫠",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SquishyButton(
              title: "Open Elastic Squishy",
              onTap: () {
                Navigator.of(context).push(
                  SquishyPageRoute(
                    page: const NextScreen(title: "Elastic Squishy"),
                    effect: SquishyEffect.elastic,
                  ),
                );
              },
            ),
            const SizedBox(height: 18),
            _SquishyButton(
              title: "Open Blob Squishy",
              onTap: () {
                Navigator.of(context).push(
                  SquishyPageRoute(
                    page: const NextScreen(title: "Blob Squishy"),
                    effect: SquishyEffect.blob,
                  ),
                );
              },
            ),
            const SizedBox(height: 18),
            _SquishyButton(
              title: "Open Stretch Squishy",
              onTap: () {
                Navigator.of(context).push(
                  SquishyPageRoute(
                    page: const NextScreen(title: "Stretch Squishy"),
                    effect: SquishyEffect.stretch,
                  ),
                );
              },
            ),
            const SizedBox(height: 18),
            _SquishyButton(
              title: "Open Gooey Squishy",
              onTap: () {
                Navigator.of(context).push(
                  SquishyPageRoute(
                    page: const NextScreen(title: "Gooey Squishy"),
                    effect: SquishyEffect.gooey,
                  ),
                );
              },
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

class _SquishyButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _SquishyButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final String title;

  const NextScreen({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6246EA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bubble_chart_rounded,
              color: Colors.white,
              size: 100,
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
