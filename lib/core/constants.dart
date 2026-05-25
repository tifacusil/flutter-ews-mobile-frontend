// ---------------------------------------------------------------------------
// Environment-injected values (via --dart-define-from-file=.env.json).
// Fallbacks are safe defaults for local development.
// ---------------------------------------------------------------------------

// Reverse-proxy host (auth, sensors, readings, alerts).
const String kApiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://localhost',
);

// User-management service — projects, users, subscriptions, devices.
// TODO: remove once nginx proxies /api/v1/projects/ and /api/v1/users/ → 8085.
const String kUserMgmtBaseUrl = String.fromEnvironment(
  'USER_MGMT_BASE_URL',
  defaultValue: 'http://localhost:8085',
);

const Duration kConnectTimeout = Duration(
  milliseconds: int.fromEnvironment(
    'API_CONNECT_TIMEOUT_MS',
    defaultValue: 10000,
  ),
);

const Duration kReceiveTimeout = Duration(
  milliseconds: int.fromEnvironment(
    'API_RECEIVE_TIMEOUT_MS',
    defaultValue: 15000,
  ),
);

// Polling
const Duration kDefaultPollingInterval = Duration(
  seconds: int.fromEnvironment(
    'DEFAULT_POLLING_INTERVAL_S',
    defaultValue: 3600,
  ),
);

// ---------------------------------------------------------------------------
// Static constants — not environment-specific
// ---------------------------------------------------------------------------

// Auth
const String kAccessTokenKey = 'access_token';
const String kRefreshTokenKey = 'refresh_token';
const String kUserIdKey = 'user_id';
const String kUsernameKey = 'username';
const String kRoleKey = 'role';

// Alert thresholds (mm/day) — Bai et al. 2020
const double kAlertBlueThreshold = 10.0;
const double kAlertOrangeThreshold = 15.0;
const double kAlertRedThreshold = 20.0;

// Sites
const String kSiteShangtan = 'GXZM';
const String kSiteLingzhan = 'LZ';

const List<String> kShangtanSensorIds = [
  'GXZM-DB01',
  'GXZM-DB02',
  'GXZM-DB03',
  'GXZM-DB04',
  'GXZM-DB05',
  'GXZM-DB06',
  'GXZM-DB07',
  'GXZM-DB08',
  'GXZM-RG01',
];

const List<String> kLingzhanSensorIds = [
  'LZ-01',
  'LZ-02',
  'LZ-03',
];

// Sensor types (matches sensor_type field in SensorEnvelope)
const String kSensorTypeGnss = 'gnss';
const String kSensorTypeRainfall = 'rainfall';
const String kSensorTypeStrain = 'strain';
const String kSensorTypeSoilPressure = 'soil_pressure';
const String kSensorTypeDeepDisplacement = 'deep_displacement';
