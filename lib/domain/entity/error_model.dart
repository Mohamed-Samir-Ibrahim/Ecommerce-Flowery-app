/// message : "fail"
/// errors : {"value":"64","msg":"Invalid ID formate","param":"id","location":"params"}

class ErrorModel {
  ErrorModel({
    this.message,
    this.error,});

  ErrorModel.fromJson(dynamic json) {
    message = json['message'];
    error = json['errors'] != null ? ErrorData.fromJson(json['errors']) : null;
  }
  String? message;
  ErrorData? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    return map;
  }

}/// value : "64"
/// msg : "Invalid ID formate"
/// param : "id"
/// location : "params"

class ErrorData  {
  ErrorData({
    this.value,
    this.msg,
    this.param,
    this.location,});

  ErrorData.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }
  String? value;
  String? msg;
  String? param;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }

}