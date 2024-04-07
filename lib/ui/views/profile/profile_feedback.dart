import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/mixins/validation.dart';
import 'package:kula/services/user_service.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

class ProfileFeedBack extends StatelessWidget with ValidationMixin {
  const ProfileFeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final textController = TextEditingController();

    void onSendFeedback() {
      FocusScope.of(context).unfocus();
      if (!formKey.currentState!.validate()) {
        return;
      }

      context.read<LoadingCubit>().loading();
      context.read<UserService>().sendFeedBack(textController.text).then((res) {
        if (!context.mounted) {
          return;
        }
        context.read<LoadingCubit>().loaded();
        if (res.error != null) {
          context.showSnackBar(res.error);
          return;
        }
        textController.clear();
        context.showSnackBar(res.data);
      });
    }

    return WillPopScope(
      onWillPop: () => Future(() => context
          .read<LoadingCubit>()
          .state
          .map(initial: (_) => true, loading: (_) => false)),
      child: Scaffold(
        appBar: ViewAppBar(
          title: "Provide Feedback",
        ),
        body: Form(
          key: formKey,
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
                          validator: validateRequired,
                          controller: textController,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          maxLines: 7,
                          hintText:
                              "We could not find what you were looking for, tell us about it so we can serve you better.",
                        )
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
                title: "Provide Feedback",
                onPressed: onSendFeedback,
              ).withHorViewPadding,
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
