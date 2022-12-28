# 1. Variables

## 1.1 The var keyword

- (수정 가능한) 변수를 만드는 방법은 크게 두 가지가 존재한다.

  - `var` 키워드 사용
    - 함수나 메소드 내부에 지역 변수를 선언할 때
  - 명시적으로 타입 지정
    - class에서 변수라 property를 선언할 때

- **두 방법으로 만든 변수는 동일한 타입으로 수정할 수 있다.**

  ```dart
  void main() {
    var name = "bin";

    name = "jungbin";

    print(name); // "jungbin"
  }
  ```

  ```dart
  void main() {
    String name = "bin";

    name = "jungbin";

    print(name); // "jungbin"
  }
  ```

## 1.2 Dynamic Type

- 여러 가지 타입을 가질 수 있는 변수에 사용되는 키워드
- 사용하지 않는 것을 추천하지만, 때로는 유용하게 사용될 수 있다.
  - 변수가 어떤 타입일지 알기 어려운 경우
- `var` 키워드를 사용한 변수에 **값을 할당하지 않은 경우**, 해당 변수는 기본적으로 dynamic 타입을 갖게 된다.
  ![image](https://user-images.githubusercontent.com/58096698/209806956-5e6010cd-dbac-4f77-bbaa-4b426700b890.png)

- 또는 `dynamic`이라고 타입을 지정할 수도 있다.

  ```dart
  void main() {
    dynamic name;

    name = 'bin';
    name = 33;
    name = false;

    print(name); // false
  }
  ```

## 1.3 Nullable Variables

- 프로그램에서 예상치 못하게 null을 참조하려는 하는 경우 런타임 에러가 발생
  - 기본적으로 모든 변수는 non-nullable, 즉 null이 될 수 없다.
- `null safety`

  - 어떤 변수나 데이터가 null이 될 수 있음을 명시하는 것
  - `?(물음표)`를 추가함으로써 nullable 변수라는 것을 알린다.
  - 즉 컴파일러의 도움으로 null 안정성을 보장받을 수 있다.

    ```dart
    void main() {
      String bin;

      print(bin); // Error: Non-nullable variable 'bin' must be assigned before it can be used.
    }
    ```

    ```dart
    void main() {
      String? bin;

      print(bin); // null
    }
    ```

- `var` 키워드를 사용하는 경우에는 `?(물음표)`를 사용할 수 없다.

  - var로 선언하면 타입 유추(type inferred), 즉 대입되는 값에 의해 타입이 결정된다.
  - 그러므로 var로 타입 선언시 Nullable과 Non-Nullable도 자동 유추가 된다.

    ```dart
    void main() {
      var bin; // type: dynamic

      print(bin); // null
    }
    ```

## 1.4 Final Variables

- 고정된 값을 사용하기 위해서는 `final` 키워드를 사용한다.

  - 변수에 한 번 할당된 값이 변경될 일이 없는 경우
  - 값이 변경되면 안되는 변수인 경우

- **JS/TS의 const와 비슷하다!**

  ```dart
  void main() {
    final name = 'bin';

    name = 'jungbin'; // Error: Can't assign to the final variable 'name'.
  }
  ```

## 1.5 Late Variables

- `late`는 final이나 var 앞에 붙여줄 수 있는 수식어
- 초기 데이터 없이 변수를 선언할 수 있게 해준다.
- 값이 할당되지 않은 변수에 접근하는 것을 막아줄 수 있다.

  ```dart
  void main() {
  late final String name;

  print(name); // Error: Late variable 'name' without initializer is definitely unassigned
  }
  ```

- final 변수에 선언하고 나중에 값을 할당할 수 있다.

  ```dart
  void main() {
  late final String name;

  // api를 통해 이름을 가져왔다고 가정
  name = 'bin';

  name = 'jungbin'; // Error: Late final variable 'name' definitely assigned.
  }
  ```

## 1.6 Constant Variables

- JS/TS의 const와는 다르다.
- `final`과 마찬가지로 변수에 할당된 값을 수정할 수 없다.
- 그러나 Dart에서 const는 `compile-time constant`이다. 즉 compile-time에는 값을 알고 있어야 한다는 의미이다.

  - compile-time에서 상수를 정의할 수 있다.
  - **즉 const로 정의한 상수는 run-time에서 정의되는 값을 설정할 수 없다.**

  ```dart
  void main() {
  const now = DateTime.now(); // Error: Cannot invoke a non-'const' constructor where a const expression is expected.

  print(now);
  }
  ```

  ```dart
  void main() {
  final now = DateTime.now();

  print(now); // 2022-12-28 21:46:20.231561
  }
  ```
