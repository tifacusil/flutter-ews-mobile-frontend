# EWS Landslide Monitor — Flutter Frontend

Mobile app for the Early Warning System described in Bai et al. 2020.
Monitors two sites (**Shangtan** and **Lingzhan**) via five sensor types: GNSS, rainfall, strain, soil pressure, and deep displacement.

---

## Prerequisites

| Tool | Version |
|---|---|
| Flutter | ≥ 3.22 (tested on 3.44) |
| Dart | ≥ 3.4 |
| Android SDK | API 21+ |
| Java | 17 (required by Gradle) |

---

## Android setup — commands to run once

```bash
# 1. Install dependencies (includes new packages: riverpod, go_router, dio, fl_chart, freezed…)
flutter pub get

# 2. Generate freezed models + JSON serializers
dart run build_runner build --delete-conflicting-outputs

# 3. Connect a device or start an emulator, then run
flutter run

# For a release APK
flutter build apk --release
```

> **Note:** Steps 1 and 2 must be re-run whenever you add a new `@freezed` model or change a `pubspec.yaml` dependency.

---

## Folder structure

```
lib/
├── core/
│   ├── models/              # Freezed + json_serializable data classes
│   │   ├── sensor_envelope.dart       # Wrapper for every sensor message
│   │   ├── gnss_payload.dart
│   │   ├── rainfall_payload.dart
│   │   ├── strain_payload.dart
│   │   ├── soil_pressure_payload.dart
│   │   ├── deep_displacement_payload.dart
│   │   ├── alert.dart
│   │   ├── alert_level.dart           # enum: blue / orange / red
│   │   └── date_range.dart
│   ├── repositories/        # Abstract interfaces only — no HTTP code here
│   │   ├── sensor_repository.dart
│   │   ├── alert_repository.dart
│   │   └── auth_repository.dart
│   ├── services/
│   │   ├── api_service.dart           # Dio client; base URL from config
│   │   ├── auth_service.dart          # JWT read/write via SharedPreferences
│   │   └── polling_service.dart       # Generic periodic poller → Stream<T>
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart            # Alert-level colours: blue / orange / red
│   │   └── text_styles.dart
│   └── utils/
│       ├── date_formatter.dart
│       └── alert_level_helper.dart    # mm/day → AlertLevel enum
├── features/
│   ├── auth/
│   │   ├── viewmodels/login_view_model.dart
│   │   └── views/login_screen.dart
│   ├── projects/
│   │   ├── viewmodels/project_list_view_model.dart
│   │   └── views/
│   │       ├── project_list_screen.dart
│   │       └── project_detail_screen.dart
│   ├── sensors/
│   │   ├── viewmodels/sensor_dashboard_view_model.dart
│   │   └── views/
│   │       ├── sensor_dashboard_screen.dart
│   │       ├── gnss_chart_widget.dart          # cumulative_displacement_mm vs time
│   │       ├── rainfall_chart_widget.dart       # daily + cumulative rainfall
│   │       ├── deep_displacement_chart.dart     # tilt vs depth (borehole profile)
│   │       ├── strain_widget.dart
│   │       └── soil_pressure_widget.dart
│   └── alerts/
│       ├── viewmodels/alert_view_model.dart
│       └── views/
│           ├── alert_banner_widget.dart         # colour-coded by AlertLevel
│           └── alert_history_screen.dart
├── main.dart                # ProviderScope + MaterialApp.router
└── router.dart              # GoRouter: /login /projects /projects/:id /sensors/:id /alerts
```

---

## Architecture

**Clean Architecture + Repository Pattern + MVVM with Riverpod**

```
View (Widget)
  └── watches → ViewModel (StateNotifier / AsyncNotifier)
                   └── calls → Repository interface
                                  └── implemented by → HTTP data source (PollingService + ApiService)
```

- **No `setState`** anywhere — all state lives in Riverpod providers.
- **Repository interfaces** in `core/repositories/` are pure Dart; implementations will live in a separate `data/` layer (not yet created).
- **ViewModels** expose `loading: bool` and `error: String?` alongside domain state via `copyWith`.

---

## Real-time data strategy (polling over HTTP)

The backend exposes REST endpoints through Nginx/API Gateway. There is no WebSocket layer.

`PollingService<T>` wraps any `Future<T> Function()` fetcher and emits values on a `Stream<T>` via `Stream.periodic`. The interval is driven by `sampling_interval_seconds` from the last received `SensorEnvelope` (default: **3600 s**). Errors are forwarded to a separate `errors` stream without cancelling the polling loop.

Repository interfaces return `Stream<T>` — callers never know whether the transport is HTTP polling, SSE, or WebSocket. This makes a future transport upgrade a data-layer concern only.

---

## Alert thresholds (Bai et al. 2020)

| Level | mm/day |
|---|---|
| Blue | ≥ 10 |
| Orange | ≥ 15 |
| Red | ≥ 20 |

---

## Sites and sensors

| Site | Sensor IDs |
|---|---|
| Shangtan | GXZM-DB01 … GXZM-DB08, GXZM-RG01 |
| Lingzhan | LZ-01, LZ-02, LZ-03 |
