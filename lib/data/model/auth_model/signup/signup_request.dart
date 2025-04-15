class SignupRequest {
  final String fristName;
  final String LastName;
  final String email;
  final String Phone;
  final String Password;
  final String RePassword;
  final String gender;

  SignupRequest({required this.fristName ,required this.LastName,required this.Phone,required this.email,required this.Password,required this.RePassword,required this.gender});
  Map<String,dynamic> tojson()=>
      {
        "firstName": fristName,
        "lastName": LastName,
        "email": email,
        "password": Password,
        "rePassword": RePassword,
        "phone": Phone,
        "gender": gender};}