class Users {
  String email;
  String name;
  String photoUrl;

  Users({required this.email, required this.name, required this.photoUrl});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        email: json['email'], name: json['name'], photoUrl: json['photoUrl']);
  }

   Map<String,dynamic> toJson(Users user) {
    Map<String, dynamic> json ={
      'email':user.email,
      'name' :user.name,
      'photoUrl':user.photoUrl
    };
    return json;
  }




}
