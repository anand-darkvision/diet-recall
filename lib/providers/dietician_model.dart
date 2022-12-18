class DieticianModel {
  String? uid;
  String? email;
  String? name;
  String? practitionerID;
  String? eduqual;
  String? location;
  String? pass;

  DieticianModel(
      {this.uid,
      this.email,
      this.name,
      this.practitionerID,
      this.eduqual,
      this.location,
      this.pass});

  // receiving data from server
  factory DieticianModel.fromMap(map) {
    return DieticianModel(
      uid: map['uid'],
      email: map['email'],
      name: map['Name'],
      practitionerID: map['PractitionerId'],
      eduqual: map['Educational_Qualification'],
      location: map['Location'],
      pass: map['Password'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'Name': name,
      'PractionerId': practitionerID,
      'Educational_Qualification': eduqual,
      'Location': location,
      'Password': pass
    };
  }
}
