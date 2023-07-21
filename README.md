# CLCalculator
[내일배움캠프 iOS트랙] 2주차 과제 - 계산기 만들기 🧮

<br><br><br>

## Level 1
- #### 요구사항
  - 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스 생성
  - 클래스를 이용하여 연산을 진행하고 출력하기  

<br><br>

## Level 2
- #### 요구사항
  - Lv1에서 만든 Calculator 클래스에 나머지 연산을 가능하도록 코드 추가
  - 연산 진행 후 출력하기

<br><br>

## Level 3
- #### 요구사항
  - 사칙 연산 클래스들 생성
  - 클래스간의 관계를 고려하여 Calculator 클래스와 관계 맺기

- #### Lv2와 비교하여 개선된 점
  - 클래스의 단일 책임 원칙

<br><br>

## Level 4
- #### 요구사항
  - Lv3에서 생성한 연산 클래스들을 AbstractOperation라는 클래스를 사용하여 추상화
  - Calculator 클래스의 내부 코드를 변경

- #### Lv3와 비교하여 개선된 점
  - 클래스간의 결합도
  - 의존성 역전 원칙

<br><br>

## SwiftUICalculator
[2023/07/21 기준]

- #### 구현한 기능들 
  - 기본 사칙연산 " + ,  - ,  * , /  " 
  - 추가 연산 " clear, 음수•양수 변환, 퍼센트, 소수점 " 
  - 숫자 9자리까지(소수점 포함되면 10자리)만 입력 가능 
  - 연속적 연산 (ex) 3 + 6 * 9 / 2)
  - 연산자 선택 후 숫자 입력하지 않으면 기존 숫자 활용해 계산
  - Text 크기 화면에 fit하게 자동 조절
  - 0으로 나누는 경우 오류 메세지 출력

- #### 추가해야 할 기능들
  - 실수 범위 벗어날 경우 오류 메세지 출력
  - 선택한 연산자 알아보기 쉽게 해당 버튼 색상 변경
  - thousand separator 적용
  - 사칙연산에 한해서 연산 후 "=" 계속 누르면 이전 연산 반복하는 기능

- #### 실행화면
  ![Simulator Screen Recording - iPhone 14 Pro - 2023-07-21 at 10 19 35](https://github.com/LeeJaeheee/CLCalculator/assets/74818845/14433fb9-482f-46b3-8dcd-75d68143f6aa)


<br><br>
