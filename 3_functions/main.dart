typedef UserInfo {}

String sayHi(Map<String, String> userInfo) {
  return "my name is ${userInfo['name']}, i'm ${userInfo['age']}";
}

void main() {
  print(sayHi({"name": "jungbin", "age": "13"}));
}
