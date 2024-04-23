import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';

class OrderTypeDropdown extends StatefulWidget {
  final void Function(String?) onChanged;
  final String? selectedOrderType;

  const OrderTypeDropdown({
    Key? key,
    required this.onChanged,
    this.selectedOrderType,
  }) : super(key: key);

  @override
  OrderTypeDropdownState createState() => OrderTypeDropdownState();
}

class OrderTypeDropdownState extends State<OrderTypeDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        border: Border.all(color: AppColors.cardStrokeColor),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius.small),
      ),
      child: DropdownButton<String>(
        enableFeedback: true,
        padding: const EdgeInsets.only(right: 10),
        elevation: 3,
        itemHeight: null,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius.large),
        value: widget.selectedOrderType,
        onChanged: widget.onChanged,
        items: const [
          DropdownMenuItem<String>(
            value: 'processing',
            child: Text('Processing'),
          ),
          DropdownMenuItem<String>(
            value: 'on_route',
            child: Text('On Route'),
          ),
          DropdownMenuItem<String>(
            value: 'cancelled',
            child: Text('Cancelled'),
          ),
          DropdownMenuItem<String>(
            value: 'onhold',
            child: Text('On Hold'),
          ),
          DropdownMenuItem<String>(
            value: 'pending',
            child: Text('Pending'),
          ),
          DropdownMenuItem<String>(
            value: null,
            child: Text('None'),
          ),
        ],
        underline: const SizedBox.shrink(),
        isDense: true,
        alignment: Alignment.center,
        icon: const Icon(
          Icons.filter_list,
          size: 20,
        ),
        hint: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            'Filter status',
            style: context.textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
