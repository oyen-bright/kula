import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/mixins/validation.dart';
import 'package:kula/services/resturant_service.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/rating_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/wrappers/will_pop_wrapper.dart';

class CreateReview extends StatefulWidget {
  final Restaurant restaurant;
  const CreateReview({super.key, required this.restaurant});

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> with ValidationMixin {
  (String, String)? _selectedValue;
  late final List<(String, String)> _options;
  final _formKey = GlobalKey<FormState>();
  int? ratting;

  final texController = TextEditingController();

  @override
  void dispose() {
    texController.dispose();
    super.dispose();
  }

  void onSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (ratting == null) {
      context.showSnackBar("Please select rating for this meal ");
      return;
    }
    context.read<LoadingCubit>().loading();
    context
        .read<RestaurantService>()
        .giveRestaurantReview(
            vendorId: widget.restaurant.id,
            mealId: _selectedValue?.$1 ?? "",
            review: texController.text,
            rating: '$ratting')
        .then((res) {
      if (!context.mounted) {
        return;
      }
      context.read<LoadingCubit>().loaded();
      if (res.error != null) {
        context.showSnackBar(res.error);
        return;
      }

      setState(() {
        texController.clear();
        _selectedValue = null;
        ratting = null;
      });
      context.showSnackBar(res.data);
    });
  }

  @override
  void initState() {
    super.initState();

    _options =
        widget.restaurant.meals?.map((e) => (e.id, e.name)).toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopWrapper(
      child: Scaffold(
        appBar: ViewAppBar(
          title: "Write Review",
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.padding.horizontal),
                    child: Column(
                      children: [
                        AppTextField(
                          controller: texController,
                          validator: validateRequired,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          maxLines: 7,
                          hintText: "Write how you fel about the food you got.",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppRatingBar(
                          maxRating: 5,
                          initialRating: ratting ?? 0,
                          onRatingChanged: (selected) {
                            ratting = selected;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField<(String, String)?>(
                          value: _selectedValue,
                          items: _options.map(((String, String) value) {
                            return DropdownMenuItem<(String, String)?>(
                              value: value,
                              child: Text(value.$2),
                            );
                          }).toList(),
                          onChanged: ((String, String)? value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select an option';
                            }
                            return null;
                          },
                          style: const TextStyle(color: AppColors.primaryColor),
                          decoration: const InputDecoration(
                            hintText: "Select a meal to review",
                            suffixIconColor: AppColors.primaryColor,
                            border: InputBorder.none,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppElevatedButton(
                elevation: 0,
                title: "Submit",
                onPressed: onSubmit,
              ).withHorViewPadding,
              SizedBox(
                height: 44.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
