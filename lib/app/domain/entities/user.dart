class User {
  String? id;
  String? fullName;
  String? email;
  String? phone;
  String? image;
  String? uid;
  String? username;
  String? passsword;
  String? status;
  String? birthday;
  String? lastSeen;
  String? lastLogin;
  String? accountStatus;
  String? gender;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.phone,
      this.image,
      this.uid,
      this.username,
      this.passsword,
      this.status,
      this.birthday,
      this.lastSeen,
      this.lastLogin,
      this.accountStatus,
      this.gender});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    uid = json['uid'];
    username = json['username'];
    passsword = json['passsword'];
    status = json['status'];
    birthday = json['birthday'];
    lastSeen = json['lastSeen'];
    lastLogin = json['lastLogin'];
    accountStatus = json['accountStatus'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['uid'] = uid;
    data['username'] = username;
    data['passsword'] = passsword;
    data['status'] = status;
    data['birthday'] = birthday;
    data['lastSeen'] = lastSeen;
    data['lastLogin'] = lastLogin;
    data['accountStatus'] = accountStatus;
    data['gender'] = gender;
    return data;
  }
}
