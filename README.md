# 먹어도 돼? 랜딩 페이지

역류성 식도염 식단 기록 앱 **먹어도 돼?**의 Flutter 웹 랜딩입니다.

## 요구 사항

- Flutter SDK `^3.12.2` (stable)
- Chrome (로컬 웹 실행)

## 로컬 실행

```bash
flutter pub get
flutter run -d chrome
```

테스트:

```bash
flutter test
```

릴리스 빌드:

```bash
flutter build web --release --base-href /
```

산출물은 `build/web`입니다.

## 배포 (Vercel)

GitHub 저장소를 Vercel에 연결합니다.

| 항목 | 값 |
|------|-----|
| Framework Preset | Other |
| Install | `vercel.json`의 `installCommand` (Flutter SDK clone) |
| Build | `flutter build web --release --base-href /` |
| Output | `build/web` |

설정은 `vercel.json`에 있습니다. `main` 푸시 시 자동 배포됩니다.

## 스토어 링크

`lib/config/links.dart`

- App Store: 앱 페이지 URL
- Google Play: 추후 추가 예정. 배지 탭 시 “앱 출시 준비 중이에요”

## 구조

```
lib/
  main.dart / app.dart / landing_page.dart
  config/links.dart          스토어 URL
  data/                      카피 (인용, FAQ, 플로우 등)
  sections/                  히어로 ~ 푸터 섹션
  theme/                     색, 1440 레이아웃, 타이포
  widgets/                   헤더, 뱃지, 목업 이미지
assets/images/               로고, 목업, 스토어 뱃지
assets/fonts/                Pretendard, Noto Sans KR Bold
web/                         favicon, OG, PWA 매니페스트
```

카피 수정은 `lib/data/`, 레이아웃·간격은 `lib/theme/layout.dart`와 해당 섹션 파일을 보면 됩니다.
