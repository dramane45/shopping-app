class SignUpBody {
  String name;
  String email;
  String phone;
  String password;

  SignUpBody(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = name;
    data["email"] = email;
    data["password"] = password;
    data["phone"] = phone;
    return data;
  }
}
