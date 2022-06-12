class Customer {
  String? id;
  String? firstName;
  String? middleName;
  String? lastName;

  Customer({this.id, this.firstName, this.middleName, this.lastName});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;

    return data;
  }
}

class ItemModal {
  int? id;
  String? name;
  String? remaining_qty;

  ItemModal({this.id, this.name, this.remaining_qty});

  ItemModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    remaining_qty = json['remaining_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['remaining_qty'] = remaining_qty;
    return data;
  }
}
