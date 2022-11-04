import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as user_firebase;
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/extensions/extensions.dart';

class User {
  String? id;
  String? fullName;
  String? email;
  String? phone;
  String? image;
  String? username;
  String? password;
  Status? status;
  String? birthday;
  String? lastSignIn;
  DateTime? createdAt;
  StatusAccount? statusAccount;
  Gender? gender;
  bool? signInByGoogle;

  User({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.image,
    this.username,
    this.password,
    this.status,
    this.birthday,
    this.lastSignIn,
    this.statusAccount,
    this.createdAt,
    this.gender,
    this.signInByGoogle,
  });

  User.fromJson(Map<String, dynamic> json) {
    var date = DateTime.fromMillisecondsSinceEpoch(json['createdAt'] * 1000);
    log("$date DATE TIME NE");
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    createdAt = date;
    username = json['username'];
    password = json['password'];
    status = json['status'].toString().stringToStatus;
    birthday = json['birthday'];
    lastSignIn = json['lastSignIn'];
    signInByGoogle = json['signInByGoogle'];
    statusAccount = json['statusAccount'].toString().stringToStatusAccount;
    gender = json["gender"].toString().stringToGender;
  }

  factory User.fromFirebase(user_firebase.User user) {
    return User(
      id: user.uid,
      email: user.email ?? "",
      fullName: user.displayName ?? user.email ?? "",
      phone: user.phoneNumber ?? "",
      image: user.photoURL ??
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
      statusAccount: StatusAccount.active,
      birthday: "",
      gender: Gender.empty,
      lastSignIn: "",
      password: user.uid,
      status: Status.empty,
      username: user.uid,
      createdAt: DateTime.now(),
      signInByGoogle: true,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['username'] = username;
    data['password'] = password;
    data['status'] = status!.statusToString;
    data['birthday'] = birthday;
    data['lastSignIn'] = lastSignIn;
    data['statusAccount'] = statusAccount!.statusAccountToString;
    data['gender'] = gender!.genderToString;
    data['signInByGoogle'] = signInByGoogle;
    return data;
  }
}
