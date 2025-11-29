import 'package:flutter/material.dart';
import 'package:petcare/utils/app_colors.dart';
import '../../components/custom_app_bar.dart';


class PrivacyPolicyScreen extends StatelessWidget{
  const PrivacyPolicyScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: "Privacy Policy"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIntroSection(),
            SizedBox(height: 32),
            _buildSection(
              number: 1,
              title: 'Information we collect',
              content: 'The personal information that we collect depends on the context of your interactions with us and the [app/service], the choices you make, and the products and features you use.',
            ),
            SizedBox(height: 24),
            _buildSection(
              number: 2,
              title: 'Information use collect',
              content: 'We process your personal information for these purposes in reliance on our legitimate business interests, in order to enter into or perform a contract with you,',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'We collect personal information that you voluntarily provide to us when you register on the [app/service], express an interest in obtaining information about us or our products and services.',
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 16),
        Text(
          'The personal information that we collect depends on the context of your interactions with us and the [app/service], the choices you make, and the products and features you use.',
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required int number,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.mainAppColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    number.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}