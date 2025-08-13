import 'package:equatable/equatable.dart';
//equatable là một thư viện Dart giúp so sánh các object dựa trên giá trị (value equality) thay vì so sánh theo địa chỉ bộ nhớ (reference equality).
class User extends Equatable {
  final int id;
  final String username;
  final String password;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;
  const User({
    this.id = 0,
    this.username = '',
    this.password = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    this.image = '',
    this.token = '',
  });

  @override
  List<Object?> get props => [
        id,
        username,
        password,
        email,
        firstName,
        lastName,
        gender,
        image,
        token,
      ];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
      'token': token,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) => User(
        id: map['id'] ?? 0,
        username: map['username'] ?? '',
        password: map['password'] ?? '',
        email: map['email'] ?? '',
        firstName: map['firstName'] ?? '',
        lastName: map['lastName'] ?? '',
        gender: map['gender'] ?? '',
        image: map['image'] ?? '',
        token: map['token'] ?? '',
      );

  User copyWith({
    int? id,
    String? username,
    String? password,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }
}
//Khi nào dùng equatable và khi nào dùng freezed?
// equatable: Chỉ lo về so sánh giá trị.
//
// freezed: Tự generate cả:
//
// so sánh giá trị (tích hợp ==)
//
// copyWith
//
// constructor
//
// pattern matching
//
// JSON parse (nếu kết hợp json_serializable)
//
// → Nếu chỉ cần so sánh đơn giản, dùng equatable là đủ.
// → Nếu muốn full tiện ích cho model bất biến, nên dùng freeze