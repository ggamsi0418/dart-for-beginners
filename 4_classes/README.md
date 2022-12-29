# 4. Classes

## 4.0 Your First Dart Class

- 인스턴스를 생성할 때는 new 키워드를 사용하지 않아도 된다.
- 멤버 변수가 변경되지 않도록 하기 위해서 final을 사용한다.
- Class의 property를 선언할 때는 타입을 명시하도록 한다.
- 다음 두 가지 경우를 제외하고는 Class 내에서 `this`를 사용하지 않는 것을 권고한다.

  - 이름이 동일한 지역 변수 대신 멤버 변수에 접근하고자 할 때는 this를 사용한다.
  - named constructor로 리디렉션(redirect)할 때는 this를 사용한다.
  - https://dart.dev/guides/language/effective-dart/usage#dont-use-this-when-not-needed-to-avoid-shadowing

  ```dart
  class Player {
    final String name = 'jungbin';
    int xp = 1500;

    void sayHello() {
      print("Hi my name is $name");
    }
  }

  void main() {
    var player = Player();

    print(player.name); // jungbin
    player.sayHello(); // Hi my name is jungbin
  }
  ```

## 4.1 Constructors

- `생성자 함수(constructor)`는 class 이름과 동일하다.

  ```dart
  class Player {
    late final String name;
    late int xp;

    Player(String name, int xp) {
      this.name = name;
      this.xp = xp;
    }

    void sayHello() {
      print("Hi my name is $name");
    }
  }

  void main() {
    var player1 = Player("jungbin", 1500);
    player1.sayHello(); // Hi my name is jungbin

    var player2 = Player('nico', 1700);
    player2.sayHello(); // Hi my name is nico
  }
  ```

- 다음과 같이 생성자 함수를 간략하게 사용할 수 있다. (property에 붙여준 late는 불필요!)

  ```dart
  class Player {
    final String name;
    int xp;

    Player(this.name, this.xp);

    void sayHello() {
      print("Hi my name is $name");
    }
  }
  ```

## 4.2 Named Constructors Parameters

- class의 규모가 커져서 property가 많은 경우, 인스턴스 초기화시 값을 넣어줄 때 실수가 발생할 수 있다.
- function에서 배웠던 것처럼 constructor를 named parameter로 설정할 수 있다.

  ```dart
  class Player {
    final String name;
    int xp;
    String team;
    int age;

    Player({
      required this.name,
      required this.xp,
      required this.team,
      required this.age,
    });

    void sayHello() {
      print("Hi my name is $name");
    }
  }

  void main() {
    var player1 = Player(
      name: "jungbin",
      xp: 1500,
      team: 'red',
      age: 33,
    );

    var player2 = Player(
      name: 'nico',
      xp: 1700,
      team: 'blue',
      age: 34,
    );

    player1.sayHello(); // Hi my name is jungbin
    player2.sayHello(); // Hi my name is nico
  }
  ```

## 4.3 Named Constructros

- **인스턴스를 초기화 하는 방식을 다양하게 구성**할 수 있다.
- 이때 사용하는 방법이 `named constructor`인데, 이때 property를 초기화할 때 반드시 `세미콜론(:)`을 이용해야 한다.

  ```dart
  class Player {
    final String name;
    int xp, age;
    String team;

    Player({
      required this.name,
      required this.xp,
      required this.team,
      required this.age,
    });

    Player.createRedPlayer({
      required String name,
      required int age,
    })  : this.name = name,
          this.age = age,
          this.team = 'red',
          this.xp = 0;

    Player.createBluePlayer({
      required String name,
      required int age,
    })  : this.name = name,
          this.age = age,
          this.team = 'blue',
          this.xp = 0;

    void sayHello() {
      print("Hi my name is $name");
    }
  }

  void main() {
    var player1 = Player.createRedPlayer(
      name: "jungbin",
      age: 33,
    );

    var player2 = Player.createBluePlayer(
      name: 'nico',
      age: 34,
    );

    player1.sayHello(); // Hi my name is jungbin
    player2.sayHello(); // Hi my name is nico
  }
  ```

## 4.5 Cascade Notation

- 인스턴스의 `property`나 `method`에 접근할 수 있는 방법이다.

  ```dart
  void main() {
    var bin = Player(name: 'jungbin', xp: 1500, team: 'blue');

    bin.name = 'jungbin-park';
    bin.xp = 2000;
    bin.team = 'red';
  }
  ```

  ```dart
  void main() {
    var bin = Player(name: 'jungbin', xp: 1500, team: 'blue')
      ..name = 'jung-park'
      ..xp = 2000
      ..team = 'red';
  }
  ```

## 4.6 Enums

- 정해진 범위 내의 value들을 사용하는 경우에는 enum을 정의하여 사용하면 실수를 줄일 수 있다.

  ```dart
  enum Team { red, blue }

  enum XpLevel { beginer, medium, pro }

  class Player {
    String name;
    XpLevel xp;
    Team team;

    Player({
      required this.name,
      required this.xp,
      required this.team,
    });

    void sayHello() {
      print("Hi my name is $name");
    }
  }

  void main() {
    var bin = Player(name: 'jungbin', xp: XpLevel.beginer, team: Team.blue)
      ..name = 'jung-park'
      ..xp = XpLevel.medium
      ..team = Team.red;
  }
  ```

## 4.7 Abstract Classes

- `추상화 클래스`를 다른 클래스들이 직접 구현해야하는 메소드들을 모아 놓은 `일종의 청사진(blueprint)`라고 볼 수 있다.
- 이를 상속받는 모든 클래스가 가지고 있어야 하는 메소드를 정의한다.

  ```dart
  abstract class Human {
    void walk();
  }

  enum Team { red, blue }

  enum XpLevel { beginer, medium, pro }

  class Player extends Human {
    String name;
    XpLevel xp;
    Team team;

    Player({
      required this.name,
      required this.xp,
      required this.team,
    });

    void sayHello() {
      print("Hi my name is $name");
    }

    void walk() {
      print("I'am walking...");
    }
  }

  void main() {
    var bin = Player(name: 'jungbin', xp: XpLevel.beginer, team: Team.blue)
      ..name = 'jung-park'
      ..xp = XpLevel.medium
      ..team = Team.red
      ..sayHello() // Hi my name is jung-park
      ..walk(); // I'am walking...
  }
  ```

## 4.8 Inheritance

- `extends(확장/상속)`를 통해 부모 클래스의 property에 접근하거나 method를 호출할 수 있다.
- 그러므로 `super` 키워드를 통해서 부모 클래스와 상호작용을 해야 한다.
- `@override` 키워드를 명시하고, 부모 클래스의 메소드를 커스텀하여 사용할 수도 있다.

  ```dart
  class Human {
    final String name;

    Human({required this.name});

    void sayHello() {
      print("Hi my name is $name");
    }
  }

  enum Team {
    blue('blue'),
    red('red');

    final String displayName;

    const Team(this.displayName);
  }

  class Player extends Human {
    final Team team;

    Player({
      required this.team,
      required String name,
    }) : super(name: name);

    @override
    void sayHello() {
      super.sayHello();
      print('and I play for ${team.displayName}');
    }
  }

  void main() {
    var player = Player(team: Team.red, name: 'jungbin');

    player.sayHello();
    // Hi my name is jungbin
    // and I play for red
  }
  ```

## 4.9 Mixins

- Mixin은 `생성자가 없는 클래스`를 의미한다.
- 클래스에 property나 method를 추가할 때 사용한다. (여러 클래스에 재사용이 가능하다.)
- `with` 키워드를 사용하여 Mixin 내부의 property와 method를 가져온다.

  ```dart
  class Strong {
    final double strengthLevel = 1500.99;
  }

  class QuickRunner {
    void runQuick() {
      print("ruuuuuuuuun!");
    }
  }

  class Tall {
    final double height = 1.99;
  }

  enum Team { blue, red }

  class Player with Strong, QuickRunner, Tall {
    final Team team;

    Player({
      required this.team,
    });
  }

  void main() {
    var player = Player(team: Team.red);

    player.runQuick(); // ruuuuuuuuun!
    print(player.height); // 1.99
    print(player.strengthLevel); // 1500.99
  }
  ```
