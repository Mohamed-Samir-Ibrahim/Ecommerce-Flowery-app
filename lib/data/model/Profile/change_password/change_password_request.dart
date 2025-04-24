class ChangePasswordRequest {
  final String? password;
  final String? newPassword;
  ChangePasswordRequest({this.password,this.newPassword});

  Map<String,dynamic> toJson(){
    return{
      'password':password,
      'newPassword':newPassword,
    };
  }
}