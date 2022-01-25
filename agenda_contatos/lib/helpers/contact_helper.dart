// ignore_for_file: prefer_const_declarations, unused_import

import 'package:sqflite/sqflite.dart';

final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";

class ContactHelper {}

class Contact {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? img;

  Contact({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.img,
  });

  Contact.fromJson(Map<String, dynamic> map) {
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      nameColumn: id,
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img,
    };
    return data;
  }

  @override
  String toString() {
    return "Contact(id: $id; name: $name; email: $email; phone: $phone; img: $img;)";
  }
}
