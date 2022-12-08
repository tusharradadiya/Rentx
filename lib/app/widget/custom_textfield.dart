import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.label,
      this.hintText = '',
      this.maxLength = 3,
      this.validator,
      required this.controller,
      this.desc = false,
      this.enabled = true,
      this.isnum = false,
      this.prefixicon = false})
      : super(key: key);
  final bool isnum;
  final String label;
  final String hintText;
  final bool desc;
  final bool enabled;
  final validator;
  final maxLength;
  final bool prefixicon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: isnum ? TextInputType.number : null,
            controller: controller,
            inputFormatters: isnum
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                  ]
                : desc
                    ? []
                    : [FilteringTextInputFormatter.singleLineFormatter],
            enabled: enabled,
            validator: validator,
            maxLength: isnum
                ? maxLength
                : desc
                    ? 1000
                    : null,
            maxLines: desc ? 8 : null,
            decoration: InputDecoration(
                isDense: true,
                counterText: desc ? null : '',
                hintText: hintText,
                prefixIcon: prefixicon
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Image.asset('assets/rupee.png',
                            width: 16, height: 16, fit: BoxFit.fill),
                      )
                    : SizedBox(width: 15),
                prefixIconConstraints: BoxConstraints(
                    minWidth: prefixicon ? 16 : 0,
                    minHeight: prefixicon ? 16 : 0),
                hintStyle: GoogleFonts.ibmPlexSans(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffAFAFAF)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
