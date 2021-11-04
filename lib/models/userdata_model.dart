class Userdata {
  String? name;
  String? email;
  String? photoURL;
  String? get getemail => this.email;

  Userdata({this.name, this.email, this.photoURL});

  Userdata.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    photoURL = json['photoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoURL'] = this.photoURL;
    return data;
  }
}
