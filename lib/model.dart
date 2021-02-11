class Model{
  int _id;
  String _nickname;
  String _email;  
  String _store;
  String _phone;
  
  Model(
    this. _nickname,
    this. _email,    
    this. _store,
    this. _phone,
  );

  Model.fromMap(Map<String, dynamic> map) {
    this. _id = map['id'];
    this. _nickname = map['nickname'];
    this. _email = map['email'];      
    this. _store = map['store'];
    this. _phone = map['phone'];
  }

  int get id => _id;
  String get nickname => _nickname;
  String get email => _email;
  String get store => _store;
  String get phone => _phone;

  set id(int value) {
    _id = value;
  }
  set nickname(String value) {
    _nickname = value;
  } 
  set email(String value) {
    _email = value;
  } 
  set store(String value) {
    _store = value;
  }  
  set phone(String value) {
    _phone = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this. _id;
    map['nickname'] = this. _nickname;
    map['email'] = this. _email;
    map['store'] = this. _store;
    map['phone'] = this. _phone;
    return map;
  }
}