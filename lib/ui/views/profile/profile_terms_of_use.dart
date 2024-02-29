import 'package:flutter/material.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';

class ProfileTermsOfUse extends StatelessWidget {
  const ProfileTermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    const termsOfUse =
        '''Welcome to Kula! Please read the following terms and conditions carefully before using our food delivery platform. By accessing or using the Kula website or mobile application, you agree to be bound by these Terms of Use. If you do not agree to these terms, please refrain from using our services.

1. Acceptance of Terms
   - These Terms of Use constitute a legally binding agreement between you and Kula regarding your use of our platform.
   - You must be at least 18 years old to use our services. By using our platform, you confirm that you are of legal age.

2. Description of Services
   - Kula operates an online platform that facilitates the ordering and delivery of food products from various restaurants and vendors ("Merchants").
   - We act as an intermediary between you and the Merchants, facilitating the ordering process and delivery services.

3. Account Registration
   - To use our services, you may be required to create an account with Kula.
   - You are responsible for maintaining the confidentiality of your account information, including your login credentials. Any activity under your account is your responsibility.

4. Ordering and Delivery
   - When placing an order through our platform, you agree to provide accurate and complete information about the order, delivery address, and payment details.
   - Kula does not guarantee the availability of any particular item from the Merchants. We will make reasonable efforts to ensure timely and accurate delivery but do not assume responsibility for delays or order errors caused by factors beyond our control.
   - Delivery times may vary based on factors such as location, traffic, and order volume.

5. Payment
   - You agree to pay the total amount specified during the checkout process, including the cost of food, delivery fees, and applicable taxes.
   - Payments must be made through the approved payment methods provided by Kula.
   - Prices for items and delivery fees may be subject to change without prior notice.

6. Cancellation and Refunds
   - Orders may be canceled or modified within a specified time frame before the scheduled delivery time.
   - Refunds for canceled orders will be subject to the refund policy of the respective Merchant.
   - In case of quality issues or order errors, please contact Kula customer support for assistance.

7. Intellectual Property
   - All content and materials on the Kula platform, including logos, trademarks, and software, are the property of Kula and protected by intellectual property laws.
   - You may not use, reproduce, or distribute any content from our platform without prior written permission.

8. Prohibited Conduct
   - You agree not to use our services for any illegal, unauthorized, or abusive purposes.
   - You must not interfere with the operation of our platform or breach security measures.

9. Privacy
   - Kula respects your privacy and handles personal information in accordance with our Privacy Policy.

10. Disclaimer of Warranties
     - Kula provides its services on an "as-is" and "as available" basis, without warranties of any kind.

11. Limitation of Liability
     - Kula shall not be liable for any indirect, incidental, consequential, or punitive damages arising from your use of our services.

12. Governing Law and Jurisdiction
     - These Terms of Use shall be governed by the laws of Nigeria, and any dispute shall be subject to the exclusive jurisdiction of the courts of Nigeria.

13. Changes to the Terms
     - Kula may update these Terms of Use from time to time. Any changes will be effective upon posting on our platform.

14. Contact Us
     - If you have any questions or concerns about these Terms of Use, please contact our customer support team.

By using Kula' services, you agree to abide by these Terms of Use. Thank you for choosing Kula for your food delivery needs!''';
    return Scaffold(
      appBar: ViewAppBar(
        title: "Terms of Use",
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: const Text(
              termsOfUse,
              textAlign: TextAlign.justify,
            ).withHorViewPadding,
          )),
          const SizedBox(
            height: 10,
          ),
          AppElevatedButton(
            elevation: 0,
            title: "I Accept",
            onPressed: () {},
          ).withHorViewPadding,
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
