## 기존 MVVM 아키텍쳐를 이용한 설계의 문제점
- 기존 MVVM 아키텍처를 이용한 개발에서는 화면을 기준으로 Model과 View, ViewModel을 분리하며 화면 입출력과 기능 수행, 네트워크 통신 등의 과정이 모두 ViewModel에서 이루어집니다.
- 해당 설계는 화면을 기준으로 뷰와 기능을 각각의 객체로 분리해 책임을 준수하게 한다는 장점이 있으나 화면과 기능이 복잡해질수록 ViewModel이 방대해진다는 점, 다른 화면에서 반복되는 로직이 있을 때 해당 로직을 각각의 ViewModel에 구현해야 하므로 코드 중복이 발생하고 코드의 재사용성이 떨어진다는 점 등의 단점들이 존재합니다.

## 문제를 해결하기 위한 방법: Feature Driven Development
- 위에서 제시된 단점들을 해결하기 위해 해당 프로젝트(MovieNote)에서는 MVVM 아키텍처를 채택하되 기능을 구현하는 ViewModel의 역할을 Feature라는 새로운 영역에서 수행하도록 구현합니다.
    - 즉, ViewModel에서는 화면 입출력만을 담당하게 하고 기능과 관련된 코드는 모두 UseCase라는 새로운 영역에 위치하도록 합니다.
- ViewModel과 UseCase의 책임을 화면 입출력과 비즈니스 로직 구현으로 한정지음으로써 객체지향적인 설계를 구현할 수 있도록 했습니다.
- 또한 레이어를 분리해 Model과 같은 내부 레이어가 외부 레이어가 하는 일을 알지 못하게 함으로써 Dependency Rule를 지키고 코드의 재사용성을 높일 수 있도록 구현했습니다.
