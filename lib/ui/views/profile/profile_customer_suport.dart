import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/data/local_storage/local_storage.dart';
import 'package:kula/extensions/string.dart';
import 'package:kula/services/user_service.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/overlays/loading_overlay.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCustomerSupport extends StatelessWidget {
  const ProfileCustomerSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "Customer Support",
      ),
      body: FutureBuilder(
          future: context.read<UserService>().customerSupportLink(),
          builder: (BuildContext context,
              AsyncSnapshot<UserServiceResponse<List<Map<dynamic, dynamic>>?>>
                  snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError || snapshot.data?.error != null) {
                return Center(
                  child:
                      Text(snapshot.data?.error ?? snapshot.error.toString()),
                );
              }

              return _buildItems(snapshot.data!.data!);
            }

            if (LocalStorage.customerSupport != null) {
              return _buildItems(LocalStorage.customerSupport!);
            }

            return const LoadingOverlay();
          }),
    );
  }

  SingleChildScrollView _buildItems(List<Map<dynamic, dynamic>> items) {
    (String?, ActionType)? imageFromKey(String key) {
      Map<String, (String?, ActionType)> map = {
        'whatsapp': (AppImages.chatIcon, ActionType.whatsapp),
        'email': (AppImages.chatIcon, ActionType.Email),
        'phone_number': (AppImages.callIcon, ActionType.PhoneCall),
        'twitter': (AppImages.twitterIcon, ActionType.twitter),
        'instagram': (AppImages.instagramIcon, ActionType.Instagram),
        'faceboook': (null, ActionType.Facebook)
      };

      return map[key.toLowerCase()];
    }

    String removeAndFormatKey(String key) {
      String newKey = key.replaceAll('_', ' ').titleCase;

      List<String> words = newKey.split(' ');

      words[0] = words[0].titleCase;

      for (int i = 1; i < words.length; i++) {
        words[i] = words[i].toLowerCase().titleCase;
      }

      String formattedKey = words.join(' ');

      return formattedKey;
    }

    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
        child: Column(
            children: items.map((e) {
          final image = imageFromKey(e['key'])?.$1;
          final actionType = imageFromKey(e['key'])?.$2;

          return ListTile(
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            leading: image != null
                ? Image.asset(
                    image,
                    color: Colors.black,
                    scale: 2,
                  )
                : const SizedBox.shrink(),
            trailing: Image.asset(
              AppImages.forwardIcon,
              scale: 1.9,
            ),
            onTap: () => launchAction(actionType!, e['value']),
            minLeadingWidth: 0,
            titleAlignment: ListTileTitleAlignment.center,
            horizontalTitleGap: 10,
            minVerticalPadding: 10,
            title: Text(
              removeAndFormatKey(e['key']),
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList()
            // ...[
            //   (AppImages.callIcon, "Call", AppRoutes.profileDetails),
            //   (AppImages.chatIcon, "Chat", AppRoutes.profileManageAddress),
            //   (
            //     AppImages.twitterIcon,
            //     "Twitter",
            //     AppRoutes.profileCustomerSupport
            //   ),
            //   (
            //     AppImages.instagramIcon,
            //     "Instagram",
            //     AppRoutes.profileGiveFeedback
            //   )
            // ].map(
            //   (e) =>
            // )

            ),
      ),
    );
  }
}

enum ActionType { Email, Facebook, PhoneCall, Instagram, twitter, whatsapp }

void launchAction(ActionType type, String parameter) async {
  Uri url;
  switch (type) {
    case ActionType.Email:
      url = Uri(
        scheme: 'mailto',
        path: parameter,
      );
      break;
    case ActionType.Facebook:
      url = Uri.parse(parameter);
      break;
    case ActionType.PhoneCall:
      url = Uri(
        scheme: 'tell',
        path: parameter,
      );
      break;
    case ActionType.Instagram:
      url = Uri.parse(
        parameter,
      );
      break;
    case ActionType.twitter:
      url = Uri.parse(parameter);
      break;
    case ActionType.twitter:
      url = Uri(
        scheme: 'mailto',
        path: parameter,
      );
      break;
    case ActionType.whatsapp:
      url = Uri.parse("https://wa.me/$parameter/");

      break;
  }

  if (!await launchUrl(url)) {
    print('Could not launch $url');
  }
}
