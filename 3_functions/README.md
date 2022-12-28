# 3. Functions

## 3.0 Defining a Function

- function의 input, 즉 parameter의 이름과 타입을 선언하고  
   function의 output, 즉 return 값의 타입을 명시한다.

  ```dart
  String sayHello(String name) {
    return 'Hello $name, nice to meet you!';
  }

  void main() {
    print(sayHello('jungbin')); // Hello jungbin, nice to meet you!
  }
  ```

- 위 `sayHello function`과 같이 실행과 동시에 곧바로 결과를 return하는 경우에는 `fat arrow syntax`를 사용할 수 있다.

  ```dart
  String sayHello(String name) => 'Hello $name, nice to meet you!';
  ```

## 3.1 Named Parameters

- 함수에서 필요로 하는 Parameter가 여러 개인 경우, 정확한 parameter를 받기 위해 사용한다.

  - null safety를 위해 Parameter의 `default value`를 설정하거나 `required` 키워드를 사용한다.

  - Parameter 순서는 상관없이 어떤 이름의 Parameter인지, 그리고 어느 타입을 사용해야 하는지 파악이 가능하여 function을 사용할 때 실수를 방지할 수 있다.

    ```dart
    String sayHello({String name = 'None', int age = 0, String country = 'Noen'}) {
      return 'Hello $name, you are $age and you come from $country';
    }

    void main() {
      print(sayHello(country: 'KR', age: 33, name: 'jungbin')); // Hello jungbin, you are 33 and you come from KR
    }
    ```

    ```dart
    String sayHello({
      required String name,
      required int age,
      required String country,
    }) {
      return 'Hello $name, you are $age and you come from $country';
    }

    void main() {
      print(sayHello(country: 'KR', age: 33)); // Error: Required named parameter 'name' must be provided.
    }
    ```

## 3.3 Optional Positional Parameters

- `positional parameter`는 순서에 맞춰 parameter를 입력해야 한다.

  ```dart
  String sayHello(
    String name,
    int age,
    String country,
  ) {
    return 'Hello $name, you are $age and you come from $country';
  }

  void main() {
    print(sayHello('jungbin', 33, 'KR')); // Hello jungbin, you are 33 and you come from KR
  }
  ```

- 만약 function의 parameter 중 선택 사항이라면, `물음표(?)와 대괄호([])`을 이용하여 `optional parameter`로 지정할 수 있다.

  ```dart
  String sayHello(String name, int age, [String? country = 'KR']) {
    return 'Hello $name, you are $age and you come from $country';
  }

  void main() {
    print(sayHello('jungbin', 33)); // Hello jungbin, you are 33 and you come from KR
  }
  ```

## 3.4 QQ Operator (Null-aware oprators)

- `??`

  ```dart
  String capitalizeName(String? name) {
    if (name != null) {
      return name.toUpperCase();
    }

    return 'NULL';
  }

  void main() {
    print(capitalizeName(null)); // NULL
  }
  ```

  ```dart
  String capitalizeName(String? name) => name?.toUpperCase() ?? 'NULL';

  void main() {
    print(capitalizeName(null)); // NULL
  }
  ```

- `??=`

  ```dart
  void main() {
    String? name;

    name ??= 'jungbin';
    name ??= 'jungbin-park';

    print(name); // jungbin
    //But! Warning: Operand of null-aware operation '??=' has type 'String' which excludes null.
  }
  ```

## 3.5 Typedef

- 간단한 데이터 타입의 alias를 만들 수 있다.

  ```dart
  List<int> reverseListOfNumbers(List<int> list) {
  var reversed = list.reversed; // Type: Iterable<int>

    return reversed.toList();
  }
  ```

  ```dart
  typedef ListOfInts = List<int>;

  ListOfInts reverseListOfNumbers(ListOfInts list) {
    var reversed = list.reversed; // Type: Iterable<int>

    return reversed.toList();
  }
  ```
