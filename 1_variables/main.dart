// Without null safety
bool isEmpty(String string) => string.length == 0;

void main() {
  String a = '안녕';
  String b = '하세요';

  print('${a}${b}');
}
