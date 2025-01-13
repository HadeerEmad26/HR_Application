import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectTimeRequestComponent extends StatelessWidget {
  const SelectTimeRequestComponent({
    super.key,
     this.title,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.validator,
  });
  final String? title;
  final String hintText;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool readOnly;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   title,
        //   style: Theme.of(context).textTheme.displayMedium,
        // ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 44.h,
          width: 230.w,
          child: TextFormField(
            readOnly: readOnly,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r)
              ),
              //hint
              hintText: hintText,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}