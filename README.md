# KAKAOAPI
kakao developers doc - api - ai + Naver Papago api

What is this?
-------------

- Kakao 문서 중 AI를 사용해 구현.
- KoGPTView로 Text를 생성하고 KarloView로 Image를 생성

Main
----
- KarloView
- KoGPTView

Karlo
-----
- Karlo는 영어만을 입력받기 때문에 Papago 번역을 사용
- NavigationBarItem을 통해 번역 기능 On/Off
- Text를 통해 Image를 생성
- 저장버튼을 통해 이미지를 내부 디바이스에 저장
- 저장된 이미지가 있는 경우 하단 ScrollView에 이미지가 나타나고 그 이미지를 선택하면 확대, 이미지 제거 가능.

KoGPT
-----
- 입력한 Text를 통해 임의의 Text생성 
- NavigationBarItem을 통해 각 Parameter설정 가능

Use Third Party
---------------
Alamofire

