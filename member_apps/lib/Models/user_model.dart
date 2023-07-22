class users {
  final int? userID;
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final int dateOfBirth;
  final String userStatus;

  const users(
      {required this.userID,
      required this.username,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.userStatus});

  factory users.fromJson(Map<String, dynamic> json) => users(
        userID: json['userID'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        phoneNumber: json['phoneNumber'],
        dateOfBirth: json['dateOfBirth'],
        userStatus: json['userStatus'],
      );

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'username': username,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'dateOfBirth': dateOfBirth,
        'userStatus': userStatus
      };

  
}
