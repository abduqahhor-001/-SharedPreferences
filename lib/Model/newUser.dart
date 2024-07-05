class newUser{

  String? email;
  String? password;
  String? phone;
  String? username;


  newUser( this.email , this.password ,this.phone , this.username);


  newUser.fromJson(Map<String , dynamic> json)
      :email = json['email'],
        password = json['password'],
        phone = json['phone'],
        username = json['username'];

  Map<String , dynamic> toJson()=>{

    'email':email,
    'password':password,
    'phone':phone,
    'username':username,
  };

}