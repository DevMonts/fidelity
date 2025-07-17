class UserModel {
  int userId;
  String userEmail;
  String userPassword;
  int? userEnterpriseId;

  UserModel({
    required this.userId,
    required this.userEmail,
    required this.userPassword,
    required this.userEnterpriseId,
  });

  Map<String, dynamic> objectToMap() {
    return {
      'userId': userId,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'userEnterprise_id': userEnterpriseId,
    };
  }

  factory UserModel.mapToObject(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      userEmail: map['userEmail'],
      userPassword: map['userPassword'],
      userEnterpriseId: map['userEnterprise_id'],
    );
  }
}
