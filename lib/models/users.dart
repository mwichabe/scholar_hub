class UserModel {
  String? uid;
  String? email;
  String? userName;
  String? profilePictureUrl;
  String? phoneNumber;
  String? hobbies;

  UserModel({this.uid,this.phoneNumber,this.hobbies, this.email, this.userName, this.profilePictureUrl});
  // data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      userName: map['userName'],
      profilePictureUrl: map['profilePictureUrl'],
      hobbies: map['hobbies'],
      phoneNumber: map['phoneNumber']
    );
  }
// sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'profilePictureUrl': profilePictureUrl,
      'hobbies': hobbies,
      'phoneNumber': phoneNumber
    };
  }
}
