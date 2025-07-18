class UserModel {
  int userId;
  String userEmail;
  String userPassword;

  UserModel({
    required this.userId,
    required this.userEmail,
    required this.userPassword,
  });

  Map<String, dynamic> objectToMap() {
    return {
      'userId': userId,
      'userEmail': userEmail,
      'userPassword': userPassword,
    };
  }

  factory UserModel.mapToObject(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      userEmail: map['userEmail'],
      userPassword: map['userPassword'],
    );
  }
}
