class AddAddressRequest {
  String street, phone, city, lat, long, username;

  AddAddressRequest(
      {required this.street, required this.city, required this.phone, required this.lat, required this.long, required this.username});

   Map<String,dynamic> tojson()=> {
   "street": street,
   "phone": phone,
   "city": city,
   "lat": lat,
   "long": long,
   "username": username

  };

}