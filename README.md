# 🎮 Movie Info App

TMDB API를 활용한 Flutter 기반 영화 정보 앱입니다.
인기 영화, 상영중, 평점 높은 영화, 개발 예정작 등을 확인하고, 상세 정보도 열어볼 수 있어요.
Flutter 클린 아키텍쳐 및 Provider 패턴으로 구성되어 있고, 테스트 코드도 작성되었습니다.

## 📱 데모 영상

<img src="assets/movie_info_demo.gif" width="360" />

## 📦 주요 기능

* ✅ TMDB API 연동
* ✅ 인기 영화/현재 상영작/평점순/개발 예정 영화 리스트 보기
* ✅ 영화 상세 정보 페이지 (줄거리, 평점, 장르, 제작사 등)
* ✅ Hero 애니메이션
* ✅ Provider 기반 상태 관리
* ✅ DTO, Repository, UseCase, ViewModel 분리
* ✅ 테스트 코드 작성 완료

## 🏗️ 프로젝트 구조

```
lib/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── pages/
│   ├── viewmodels/
│   └── widgets/
└── main.dart
```

> ✅ 클린 아키텍쳐 기반으로 계층 분리

## 🧪 테스트

* DTO 단위 테스트
* MovieDataSource 단위 테스트

```bash
flutter test
```

## 🔧 사용 기술

* Flutter 3.29.3
* Dart
* Provider
* http
* flutter\_dotenv
* Clean Architecture

## 🔑 TMDB API Key 설정

`.env` 파일을 루트에 생성하고 아래 내용을 입력해주세요:

```
TMDB_API_KEY=your_api_key_here
```

> 💡 `.env` 파일은 `.gitignore`에 포함해서 커버에 포함되지 않도록 해주세요.

## 📸 UI 스크립샵

| 홈화면                             | 상세화면                              |
| ------------------------------- | --------------------------------- |
| ![](assets/screenshot_home.png) | ![](assets/screenshot_detail.png) |

## 📁 실행 방법

```bash
git clone https://github.com/your-username/movie_info_app.git
cd movie_info_app
flutter pub get
flutter run
```

---

> ✨ 만든 사람: **Jinju**
