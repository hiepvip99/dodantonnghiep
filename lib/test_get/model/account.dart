class Account {
  int? id;
  String? username;
  String? password;
  int? decentralization;
  int? status;

  Account(
      {this.id,
      this.username,
      this.password,
      this.decentralization,
      this.status});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    decentralization = int.tryParse(json['decentralization'].toString());
    status = int.tryParse(json['status'].toString());
  }

  Account.fromJsonNoId(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    decentralization = json['decentralization'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['decentralization'] = decentralization;
    data['status'] = status;
    return data;
  }
}
