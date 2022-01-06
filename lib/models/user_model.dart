// import 'dart:html';

class usercoffee {
  String? uid;
  String? email;
  String? name;

  usercoffee({this.uid, this.email, this.name});
  // nó sẽ lấy dữ liệu mà mình đã thiết lập trên database về
  factory usercoffee.fromMap(map) {
    //để database nhận được dữ liệu thì sử dụng hàng map gửi dữ liệu đến máy chủ
    return usercoffee(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
    );
  }
  //gui du lieu den may chu: firestore Database
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}
