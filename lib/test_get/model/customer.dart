import 'package:intl/intl.dart';

class Customer {
  int? id;
  String? name;
  int? idAccount;
  int? phoneNumber;
  DateTime? dateOfBirth;
  String? email;
  int? idImage;

  Customer(
      {this.id,
      this.name,
      this.idAccount,
      this.phoneNumber,
      this.dateOfBirth,
      this.email,
      this.idImage});

  final f = DateFormat('yyyy-MM-dd');

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    idAccount = int.tryParse(json['id_account'].toString());
    phoneNumber = int.tryParse(json['phone_number'].toString());
    dateOfBirth = f.parse(json['date_of_birth']);
    email = json['email'];
    idImage = int.tryParse(json['id_image'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['id_account'] = idAccount;
    data['phone_number'] = phoneNumber;
    data['date_of_birth'] = dateOfBirth!.toIso8601String();
    data['email'] = email;
    data['id_image'] = idImage;
    return data;
  }
}
