class User{
  final int? id;
  final String name;
  final String email;
  final int isLoggedIn;
  final String password;


  User({ required this.name, required this.email,this.isLoggedIn=0, this.id, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      isLoggedIn: json['isLoggedIn'] ?? 0,
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'isLoggedIn': isLoggedIn,
      'password': password,
    };
  }
}