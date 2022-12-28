# 2. Data Types

## 2.0 Basic Data Types

- `String`
- `bool`
- `int`
- `double`
- num
  - int + double
  - 실제로는 잘 사용하지 않는다.

## 2.1 Lists

- List 타입은 다양한 방법으로 선언이 가능하다.

  ```dart
  void main() {
    var numbers1 = [1, 2, 3, 4, 5, '6']; // type: List<Object>

    List numbers2 = [1, 2, 3, 4, 5, '6']; // type: List<dynamic>

    List<int> numbers3 = [1, 2, 3, 4, 5, '6']; // Error: A value of type 'String' can't be assigned to a variable of type 'int'.
  }
  ```

- `const`와 `final` 키워드에 따라 List 조작이 달라진다.

  - const로 선언된 List의 경우, 런타임에서 원소가 추가/삭제가 불가하다.

    ```dart
    void main() {
      final List<int> numbers = [1, 2, 3, 4, 5];

      numbers.add(6);

      print(numbers); // [1, 2, 3, 4, 5, 6]
    }
    ```

    ```dart

    void main() {
      const List<int> numbers = [1, 2, 3, 4, 5];

      numbers.add(6); // Error 발생!!

      //Unhandled exception:
      //Unsupported operation: Cannot add to an unmodifiable lis

      print(numbers);
    }
    ```

## 2.2 String interpolation

- `String interpolation`은 text에 변수를 추가하는 방법

  ```dart
  void main() {
    var name = 'jungbin';
    var greeting = 'Hello everyone, my name is $name, nice to meet you!';

    print(greeting); // Hello everyone, my name is jungbin, nice to meet you!
  }
  ```

  ```dart
  void main() {
    var name = 'jungbin';
    var age = 33;
    var greeting = "Hello everyone, my name is $name and I'm ${age - 1}";

    print(greeting); // Hello everyone, my name is jungbin and I'm 32
  }
  ```

## 2.3 Collection if & for

- `collection if`

  ```dart
  void main() {
    var giveMeFive = true;

    var numbers = [
      1,
      2,
      3,
      4,
      if (giveMeFive) 5,
    ];

    print(numbers); // [1, 2, 3, 4, 5]
  }
  ```

- `collection for`

  ```dart
  void main() {
  var oldFriends = ['nico', 'lynn'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for (var friend in oldFriends) "♥ $friend"
  ];

  print(newFriends); // [lewis, ralph, darren, ♥ nico, ♥ lynn]
  }
  ```

## 2.4 Maps

- Dart에서의 `Map`와 다음과 유사하다.

  - Python의 dictionary
  - JS/TS의 object

    ```dart
    void main() {
      var player = {
          'name': 'jungbin',
          'isMale': true,
          'age': 33,
        }; // Type: Map<String, Object>

      print(player); // {name: jungbin, sex: male, age: 33}
    }
    ```

    ```dart
    void main() {
      Map<int, bool> player = {
      1: true,
      2: false,
      3: false,
      4: true,
      }; // Type: Map<int,bool>

      print(player); // {1: true, 2: false, 3: false, 4: true}
    }
    ```

## 2.5 Sets

- 중괄호({})를 이용하여 Set 생성

  ```dart
  void main() {
    var numbers = {1, 2, 3, 4, 5};
    // Set<int> numbers = {1, 2, 3, 4, 5};

    print(numbers); // {1, 2, 3, 4, 5}
  }
  ```

- List와의 차이점은 `Set의 아이템은 Unique`하다는 점!

  ```dart
  void main() {
    var numbers = {1, 2, 3, 4, 5, 5};
    // Two elements in a set literal shouldn't be equal.
    // Change or remove the duplicate element.

    print(numbers); // {1, 2, 3, 4, 5}
  }
  ```

- Dart의 List는 Python의 List와 같고, Dart의 Set은 Python의 Tuple과 같다.
