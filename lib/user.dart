class MyUser {
  static const String collectionName = 'users';

  String? id;


  String? password;
  String? email;

  MyUser({this.id, required this.email, required password});

  MyUser.fromFireStore(Map<String, dynamic>? data)
    : this(
        id: data?['id'],
        password: data?['password'],

        email: data?['email'],
      );

  Map<String, dynamic> toFireStore() {
    return {'id': id, 'password': password, 'email': email};
  }
}
