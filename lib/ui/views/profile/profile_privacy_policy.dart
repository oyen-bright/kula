import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:kula/data/local_storage/local_storage.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/services/user_service.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/overlays/loading_overlay.dart';

class ProfilePrivacyPolicy extends StatelessWidget {
  const ProfilePrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    const privacyPolicy =
        '''This Privacy Policy explains how Kula ("we," "us," or "our") collects, uses, discloses, and protects your personal information when you use our food delivery platform. Your privacy is of utmost importance to us, and we are committed to safeguarding the confidentiality of your information. By accessing or using the Kula website or mobile application, you agree to the practices described in this Privacy Policy.

1. Information We Collect
   - Personal Information: When you create an account with Kula, we may collect personal information such as your name, email address, phone number, and delivery address.
   - Order Information: We collect information about your orders, including the items you purchase, payment details, and order history.
   - Device Information: We may collect information about the device you use to access our platform, including the device type, operating system, and unique device identifiers.
   - Location Information: With your consent, we may collect your precise location information to facilitate delivery services.
   - Usage Information: We may collect data on how you interact with our platform, such as pages visited, features used, and preferences.

2. How We Use Your Information
   - To Provide Services: We use your personal information to facilitate the ordering and delivery of food products from our partner Merchants.
   - Communication: We may use your contact information to send you transactional messages, service updates, and promotional offers.
   - Improve User Experience: Your information helps us analyze platform usage and identify ways to enhance our services.
   - Legal Obligations: We may use and disclose your information as required by applicable laws and regulations.

3. Information Sharing
   - With Merchants: We share necessary details with our partner Merchants to fulfill your food orders.
   - Service Providers: We may share your information with third-party service providers who assist us in providing our services (e.g., payment processors, delivery partners).
   - Business Transfers: If Kula undergoes a merger, acquisition, or asset sale, your information may be transferred as part of the transaction.
   - Legal Compliance: We may share your information to comply with legal obligations, respond to lawful requests, or protect our rights.

4. Data Security
   - We implement security measures to protect your information from unauthorized access, disclosure, or alteration.
   - However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.

5. Data Retention
   - We retain your personal information only for as long as necessary to fulfill the purposes for which it was collected and to comply with legal obligations.

6. Your Choices
   - Account Information: You can review and update your account information by logging into your Kula account.
   - Location Information: You can enable or disable location services through your device settings or''';

    return Scaffold(
      appBar: ViewAppBar(
        title: "Privacy Policy",
      ),
      body: FutureBuilder(
        future: context.read<UserService>().getPolicy(),
        builder: (BuildContext context,
            AsyncSnapshot<UserServiceResponse<({String data, String title})?>>
                snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError || snapshot.data?.error != null) {
              return Center(
                child: Text(snapshot.data?.error ?? snapshot.error.toString()),
              );
            }

            return _buildTerms(
              snapshot.data!.data!.data,
            );
          }

          if (LocalStorage.policy != null) {
            return _buildTerms(LocalStorage.policy!);
          }

          return const LoadingOverlay();
        },
      ),
    );
  }

  Column _buildTerms(String terms) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: HtmlWidget(terms).withHorViewPadding,
        )),
        const SizedBox(
          height: 10,
        ),
        AppElevatedButton(
          elevation: 0,
          title: "I Accept",
          onPressed: () => AppRouter.router.pop(),
        ).withHorViewPadding,
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
