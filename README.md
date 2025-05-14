# 🎮 Movie Info App

TMDB API를 활용한 Flutter 기반 영화 정보 앱입니다.
인기 영화, 상영중, 평점 높은 영화, 개발 예정작 등을 확인하고, 상세 정보도 열어볼 수 있어요.
Flutter 클린 아키텍쳐 및 Provider 패턴으로 구성되어 있고, 테스트 코드도 작성되었습니다.

## 📱 데모 영상

<img src="https://github.com/user-attachments/assets/c75bd0a1-f719-427f-9125-b838640730f3" width="360" />

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
├── assets/
├── data/
│ ├── datasources/
│ │ ├── movie_data_source.dart
│ │ └── movie_data_source_impl.dart
│ ├── mapper/
│ │ ├── movie_detail_dto_to_entity.dart
│ │ └── result_to_entity.dart
│ ├── models/
│ │ ├── movie_detail_dto.dart
│ │ └── movie_response_dto.dart
│ └── repositories/
│ ├── movie_repository.dart
│ └── movie_repository_impl.dart
├── domain/
│ ├── entities/
│ │ ├── movie.dart
│ │ └── movie_detail.dart
│ └── usecases/
│ ├── fetch_movie_detail_usecase.dart
│ ├── fetch_now_playing_movies_usecase.dart
│ ├── fetch_popular_movies_usecase.dart
│ ├── fetch_top_rated_movies_usecase.dart
│ └── fetch_upcoming_movies_usecase.dart
├── presentation/
│ ├── pages/
│ │ ├── detail_page.dart
│ │ ├── home_page.dart
│ │ └── widgets/
│ │     ├── build_movie_section.dart
│ │     ├── info_box.dart
│ │     └── popular_movie_section.dart
│ └── viewmodels/
│ ├── movie_detail_view_model.dart
│ └── movie_view_model.dart
├── main.dart
test/
└── data/
├── datasources/
│ └── movie_data_source_impl_test.dart
└── models/
├── movie_detail_dto_test.dart
└── movie_response_dto_test.dart
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
<div align="center" style="display: flex; flex-wrap: nowrap; overflow-x: auto; padding: 15px;">
<img src="https://github.com/user-attachments/assets/32412e0b-b38d-4f7a-9966-e44ba113f8e3" width="360" />
<img src="https://github.com/user-attachments/assets/bce35a37-cc5a-42a6-9714-a997a1515237" width="360" />
</div>
## 📁 실행 방법

```bash
git clone https://github.com/your-username/movie_info_app.git
cd movie_info_app
flutter pub get
flutter run
```

---

> ✨ 만든 사람: **Jinju**
