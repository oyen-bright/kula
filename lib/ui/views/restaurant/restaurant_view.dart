import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/themes/app_images.dart';

import 'components/restaurant_header.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const RestaurantHeader(),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppConstants.padding.horizontal),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.openIcon,
                    scale: 2,
                  ),
                  // const Expanded(child: Text("Open from 8:45am - 9:55pm" , style: context.textTheme.bodyMedium?.copyWith(
                  //   fontWeight: FontWeight.w400, f
                  // ),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
