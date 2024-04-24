class UserDetailsModel {
  final String email;
  final String password;
  final int id;
  UserDetailsModel({
    required this.email,
    required this.password,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{"email": email, "password": password, "id": id};
  }

  static UserDetailsModel fromMap(Map<String, dynamic> map) {
    return UserDetailsModel(
        email: map["email"], password: map["password"], id: map["id"]);
  }

 static List<UserDetailsModel> convertToUserDetailsList(
      List<Map<String, dynamic>> userData) {
    return userData
        .map((element) => UserDetailsModel.fromMap(element))
        .toList();
  }
}
