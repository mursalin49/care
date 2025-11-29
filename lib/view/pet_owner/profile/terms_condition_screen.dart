import 'package:flutter/material.dart';
import '../../components/custom_app_bar.dart';



class TermsConditionScreen extends StatelessWidget {
  final String appName;
  final String companyName;

  const TermsConditionScreen({
    super.key,
    required this.appName,
    required this.companyName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Terms & Condition"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeSection(),
            const SizedBox(height: 24),
            _buildSection(
              number: 2,
              title: 'User Responsibilities As a user, you agree to:',
              content: const [
                'Use the service only for lawful purposes.',
                'Provide accurate and complete information when required.',
                'Maintain the confidentiality of your account password.',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              number: 3,
              title: 'Intellectual Property',
              content: [
                'All content, trademarks, and data on this service, including but not limited to text, graphics, logos, and images, are the property of $companyName.',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              number: 4,
              title: 'Disclaimers',
              content: [
                'The service is provided on an "as is" and "as available" basis. $companyName makes no warranties, expressed or implied, regarding the operation.',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to $appName',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Accessing or using our services, you agree to be bound by these Terms of Service. If you do not agree with any part of the terms, you must not use our services.',
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required int number,
    required String title,
    required List<String> content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$number.',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...content.map((item) => Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '• ',
                style: TextStyle(fontSize: 14),
              ),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        )).toList(),
      ],
    );
  }
}

// Usage example:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TermsConditionScreen(
        appName: 'Services A',
        companyName: '[Your Company Name]',
      ),
    );
  }
}