import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TermConditions extends StatelessWidget {
  const TermConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Conditions',
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Owner Terms:- ',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'You order the product and if product is missing or damage so its responsibility to Owner So take care of product and when you given the product at that time you check and verify to cutomer detail also',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Customer Terms:-',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '- Please Care of Product if the product is more damage and broke so Owner can deduct the amount of your deposit ',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Others:-',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '- In the event that the Equipment experiences a breakdown due to any defect in materials or workmanship, Oceanscan’s liabilityshall be limited to the cost of repair, including parts and labour, to return the Equipment to full working order',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
