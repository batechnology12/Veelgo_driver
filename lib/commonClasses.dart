import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veelgo/properties/common properties.dart';

class PageContent extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String description;

  PageContent(
      {required this.image,
      required this.title,
      required this.description,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 200.h,
            width: 200.w,
            child: SvgPicture.asset(
              image,
            )),
        SizedBox(height: 20.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: inter1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: subtitle,
                  style: inter1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 23.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            style: poppins1.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters, // Use inputFormatters parameter
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        filled: true,
        fillColor: Colors.grey[200],
        hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 0.1,
          ),
        ),
      ),
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your text';
            }
            return null;
          },
    );
  }
}

class TextFormAddedNumbr extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final hinttext;
  final List<TextInputFormatter>? inputFormatters; // Add this line
  final String? Function(String?)? validator;
  final Widget? leadingIcon;

  const TextFormAddedNumbr(
      {Key? key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.inputFormatters, // Add this line
      this.validator,
      this.hinttext,
      this.leadingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters, // Pass inputFormatters here if provided
      decoration: InputDecoration(
        prefixIcon: leadingIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 0.1,
          ),
        ),
      ),
      style: TextStyle(fontSize: 17.sp),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your text';
            }
            return null;
          },
    );
  }
}

class TextFieldBorder extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Widget? leadingIcon;
  final FormFieldValidator<String>? validator;
  final Widget? trailingIcon;

  const TextFieldBorder({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.leadingIcon,
    this.validator,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      validator: validator,
      style: TextStyle(fontSize: 17.sp),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        hintText: hintText,
        hintStyle:
            inter1.copyWith(fontWeight: FontWeight.w600, fontSize: 13.sp),
        suffixIcon: trailingIcon,
        prefixIcon: leadingIcon, // Set the prefix icon here
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final List<TextInputFormatter>?
      inputFormatters; // Add inputFormatters parameter

  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLines,
    this.inputFormatters, // Initialize inputFormatters parameter
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final String? hintText;
  final Widget? trailingIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.selectedItem,
    this.hintText,
    this.trailingIcon,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedItem,
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        widget.onChanged(newValue);
      },
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        suffixIcon: widget.trailingIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
