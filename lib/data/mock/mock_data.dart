import 'dart:math' as math;

import '../../core/models/deep_displacement_payload.dart';
import '../../core/models/gnss_payload.dart';
import '../../core/models/project.dart';
import '../../core/models/rainfall_payload.dart';
import '../../core/models/soil_pressure_payload.dart';
import '../../core/models/strain_payload.dart';

// ── Reading wrappers ──────────────────────────────────────────────────────────

class GnssReading {
  const GnssReading({required this.timestamp, required this.payload});
  final DateTime timestamp;
  final GnssPayload payload;
}

class RainfallReading {
  const RainfallReading({required this.timestamp, required this.payload});
  final DateTime timestamp;
  final RainfallPayload payload;
}

class SoilPressureReading {
  const SoilPressureReading({required this.timestamp, required this.payload});
  final DateTime timestamp;
  final SoilPressurePayload payload;
}

class StrainReading {
  const StrainReading({required this.timestamp, required this.payload});
  final DateTime timestamp;
  final StrainPayload payload;
}

class DeepDisplacementReading {
  const DeepDisplacementReading({required this.payload});
  final DeepDisplacementPayload payload;
}

// ── Sensor catalogue ──────────────────────────────────────────────────────────

enum SensorType { gnss, rainfall, soilPressure, strain, deepDisplacement }

class SensorInfo {
  const SensorInfo({
    required this.id,
    required this.type,
    required this.label,
    required this.description,
  });
  final String id;
  final SensorType type;
  final String label;
  final String description;
}

// ── MockData ──────────────────────────────────────────────────────────────────

abstract final class MockData {
  // ── Projects ──────────────────────────────────────────────────────────────

  static final List<Project> projects = const [
    Project(id: 'shangtan', displayName: 'Shangtan landslide', typeLabel: 'slope'),
    Project(id: 'lingzhan', displayName: 'Lingzhan landslide', typeLabel: 'slope'),
  ];

  // ── Sensors per project ───────────────────────────────────────────────────

  static const Map<String, List<SensorInfo>> sensorsByProject = {
    'shangtan': [
      SensorInfo(
        id: 'GXZM-DB03',
        type: SensorType.gnss,
        label: 'Surface Displacement',
        description: 'GNSS cumulative displacement',
      ),
      SensorInfo(
        id: 'GXZM-RG01',
        type: SensorType.rainfall,
        label: 'Rainfall Monitor',
        description: 'Hourly rainfall and cumulative',
      ),
      SensorInfo(
        id: 'GXZM-SP01',
        type: SensorType.soilPressure,
        label: 'Soil Pressure',
        description: 'Earth pressure cell (kPa)',
      ),
      SensorInfo(
        id: 'GXZM-SG02',
        type: SensorType.strain,
        label: 'Strain Gauge',
        description: 'Surface strain (µε)',
      ),
    ],
    'lingzhan': [
      SensorInfo(
        id: 'LZ-DB01',
        type: SensorType.deepDisplacement,
        label: 'Borehole Tilt',
        description: 'Inclinometer depth profile',
      ),
    ],
  };

  // ── GNSS — GXZM-DB03 ─────────────────────────────────────────────────────
  // Anchor: cumulative_displacement_mm = 1247.5 @ 2026-05-02

  static final List<GnssReading> gnssReadings = _buildGnss();

  static List<GnssReading> _buildGnss() {
    final anchorDate = DateTime(2026, 5, 2);
    const anchorCumulative = 1247.5;
    const days = 180;
    final startDate = anchorDate.subtract(const Duration(days: days - 1));
    const startCumulative = 1050.0;
    const delta = anchorCumulative - startCumulative; // 197.5 over 179 days

    final readings = <GnssReading>[];
    for (int i = 0; i < days; i++) {
      final date = startDate.add(Duration(days: i));
      final progress = i / (days - 1);
      // Slightly convex acceleration + seasonal sine
      final trend = startCumulative + delta * math.pow(progress, 1.15);
      final seasonal = 12.0 * math.sin(i / 30.5 * math.pi);
      final noise = 0.8 * math.sin(i * 4.7);
      // Force anchor to be exact on last point
      final cum = i == days - 1 ? anchorCumulative : trend + seasonal + noise;
      final dx = cum * 0.75;
      final dy = cum * 0.25;
      final dh = math.sqrt(dx * dx + dy * dy);
      readings.add(GnssReading(
        timestamp: date,
        payload: GnssPayload(
          displacementXMm: dx,
          displacementYMm: dy,
          displacementZMm: cum * -0.05,
          displacementHorizontalMm: dh,
          cumulativeDisplacementMm: cum,
          fixQuality: 'rtk_fixed',
        ),
      ));
    }
    return readings;
  }

  // ── Rainfall — GXZM-RG01 ─────────────────────────────────────────────────
  // Anchor: rainfall_mm=2.4, cumulative=1547.2 @ 2026-05-02T14:00, interval=60min

  static final List<RainfallReading> rainfallReadings = _buildRainfall();

  static List<RainfallReading> _buildRainfall() {
    final anchorDate = DateTime(2026, 5, 2, 14, 0);
    const anchorCumulative = 1547.2;
    const anchorRainfall = 2.4;
    const hours = 7 * 24; // 7 days = 168 readings
    final startDate = anchorDate.subtract(const Duration(hours: hours - 1));

    // Pre-generate rainfall amounts (dry with rain events)
    final raw = <double>[];
    final rng = math.Random(42);
    for (int i = 0; i < hours; i++) {
      final hour = i % 24;
      // Rain events: mid-day and night, clustered
      final rainy = (i >= 36 && i <= 48) || // day 2 event
          (i >= 72 && i <= 84) || // day 4 event
          (i >= 132 && i <= 144) || // day 6 event
          (i == hours - 1); // anchor hour
      if (rainy) {
        final isAnchored = i == hours - 1;
        raw.add(isAnchored ? anchorRainfall : 0.5 + rng.nextDouble() * 4.0);
      } else if (hour >= 13 && hour <= 17 && rng.nextDouble() < 0.15) {
        raw.add(rng.nextDouble() * 0.8);
      } else {
        raw.add(0.0);
      }
    }

    // Scale cumulative: last reading = anchorCumulative
    final totalNew = raw.fold(0.0, (a, b) => a + b);
    final cumulativeBase = anchorCumulative - totalNew;

    final readings = <RainfallReading>[];
    double cumulative = cumulativeBase;
    for (int i = 0; i < hours; i++) {
      cumulative += raw[i];
      readings.add(RainfallReading(
        timestamp: startDate.add(Duration(hours: i)),
        payload: RainfallPayload(
          rainfallMm: raw[i],
          cumulativeRainfallMm: cumulative,
          intervalMinutes: 60,
        ),
      ));
    }
    return readings;
  }

  // ── Soil Pressure — GXZM-SP01 ────────────────────────────────────────────
  // Anchor: pressure_kpa=45.2, temperature_celsius=18.7 @ 2026-05-02T14:00

  static final List<SoilPressureReading> soilPressureReadings = _buildSoilPressure();

  static List<SoilPressureReading> _buildSoilPressure() {
    final anchorDate = DateTime(2026, 5, 2, 14, 0);
    const anchorPressure = 45.2;
    const anchorTemp = 18.7;
    const days = 180;
    final startDate = anchorDate.subtract(Duration(days: days - 1));
    const startPressure = 38.0;

    final readings = <SoilPressureReading>[];
    for (int i = 0; i < days; i++) {
      final progress = i / (days - 1);
      final trend = startPressure + (anchorPressure - startPressure) * progress;
      final pressureNoise = 0.4 * math.sin(i * 2.3);
      final pressure = i == days - 1 ? anchorPressure : trend + pressureNoise;
      // Temperature: seasonal cycle, ends at 18.7
      final tempBase = 15.0 + 10.0 * math.sin((i / 365.0) * 2 * math.pi - math.pi / 2);
      final temp = i == days - 1 ? anchorTemp : tempBase + 0.3 * math.sin(i * 1.1);
      readings.add(SoilPressureReading(
        timestamp: startDate.add(Duration(days: i)),
        payload: SoilPressurePayload(
          pressureKpa: pressure,
          temperatureCelsius: temp,
        ),
      ));
    }
    return readings;
  }

  // ── Strain — GXZM-SG02 ───────────────────────────────────────────────────
  // Anchor: strain_microstrain=234.5, temperature_celsius=24.3 @ 2026-05-02T14:00

  static final List<StrainReading> strainReadings = _buildStrain();

  static List<StrainReading> _buildStrain() {
    final anchorDate = DateTime(2026, 5, 2, 14, 0);
    const anchorStrain = 234.5;
    const anchorTemp = 24.3;
    const days = 180;
    final startDate = anchorDate.subtract(Duration(days: days - 1));
    const startStrain = 200.0;

    final readings = <StrainReading>[];
    for (int i = 0; i < days; i++) {
      final progress = i / (days - 1);
      final trend = startStrain + (anchorStrain - startStrain) * math.pow(progress, 1.2);
      final strainNoise = 1.5 * math.sin(i * 3.1) + 0.8 * math.sin(i * 0.7);
      final strain = i == days - 1 ? anchorStrain : trend + strainNoise;
      final tempBase = 20.0 + 8.0 * math.sin((i / 365.0) * 2 * math.pi - math.pi / 3);
      final temp = i == days - 1 ? anchorTemp : tempBase + 0.5 * math.sin(i * 1.9);
      readings.add(StrainReading(
        timestamp: startDate.add(Duration(days: i)),
        payload: StrainPayload(
          strainMicrostrain: strain,
          temperatureCelsius: temp,
        ),
      ));
    }
    return readings;
  }

  // ── Deep Displacement — LZ-DB01 ──────────────────────────────────────────
  // Anchor @ depth 15.0: cumulative=48.7, tilt_x=3.21, tilt_y=-1.54 @ 2019-06-15
  // Depths: [2, 4, 6, 8, 10, 12, 14, 15]

  static final List<DeepDisplacementReading> deepReadings = _buildDeepProfile();

  static List<DeepDisplacementReading> _buildDeepProfile() {
    // cumulative_tilt_mm increases with depth (integrated from surface down)
    // Peak tilt gradient at slide plane (~8 m)
    // Anchor at depth 15: cumulative=48.7, tilt_x=3.21, tilt_y=-1.54
    const depthData = [
      (depth: 2.0,  cumulative: 6.1,  tiltX: 10.4, tiltY: -4.2),
      (depth: 4.0,  cumulative: 15.3, tiltX: 14.7, tiltY: -6.1),
      (depth: 6.0,  cumulative: 26.4, tiltX: 17.2, tiltY: -7.8),
      (depth: 8.0,  cumulative: 36.8, tiltX: 16.5, tiltY: -7.1), // slide plane
      (depth: 10.0, cumulative: 43.1, tiltX: 10.2, tiltY: -4.9),
      (depth: 12.0, cumulative: 46.5, tiltX: 5.8,  tiltY: -2.6),
      (depth: 14.0, cumulative: 48.1, tiltX: 4.3,  tiltY: -1.95),
      (depth: 15.0, cumulative: 48.7, tiltX: 3.21, tiltY: -1.54), // anchor
    ];

    return depthData.map((d) => DeepDisplacementReading(
      payload: DeepDisplacementPayload(
        depthM: d.depth,
        tiltXMm: d.tiltX,
        tiltYMm: d.tiltY,
        cumulativeTiltMm: d.cumulative,
      ),
    )).toList();
  }
}
