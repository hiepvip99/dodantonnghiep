class Staff {
  int? id;
  String? name;
  String? address;
  int? phoneNumber;
  DateTime? brithOfDate;
  String? position;
  int? basicSalary;
  DateTime? startWorkDate;
  int? idImage;

  Staff(
      {this.id,
      this.name,
      this.address,
      this.phoneNumber,
      this.brithOfDate,
      this.position,
      this.basicSalary,
      this.startWorkDate,
      this.idImage});

  Staff.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString());
    name = json['name'];
    address = json['address'];
    phoneNumber = int.tryParse(json['phone_number'].toString());
    brithOfDate = DateTime.parse(json['brith_of_date']);
    position = json['position'];
    basicSalary = int.tryParse(json['basic_salary'].toString());
    startWorkDate = DateTime.parse(json['start_work_date']);
    idImage = int.tryParse(json['id_image'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['brith_of_date'] = brithOfDate!.toIso8601String();
    data['position'] = position;
    data['basic_salary'] = basicSalary;
    data['start_work_date'] = startWorkDate!.toIso8601String();
    data['id_image'] = idImage;
    return data;
  }
}
