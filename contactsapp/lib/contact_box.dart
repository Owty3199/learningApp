import 'package:flutter/material.dart';

class ContactBox extends StatelessWidget {
  String nomContact;
  ContactBox({super.key, required String this.nomContact});
  

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 120,
      child: Text(nomContact),
    );
  }
}