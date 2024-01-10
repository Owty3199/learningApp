import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  List list = [
    ["1 contact", false],
    ["2 contact", true],
    ["3 contact", false],
    ["4 contact", false],
    ["5 contact", false]
  ];
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Mes Contactes")),
      // body: ListView.builder(itemCount: list.length),
    );
  }
}
