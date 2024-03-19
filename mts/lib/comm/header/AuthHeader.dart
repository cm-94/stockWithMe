
class AuthHeader {
  String contentType = "application/json";

  Map<String,String> toMap(){
    return <String,String>{"content-type" : contentType};
  }
}