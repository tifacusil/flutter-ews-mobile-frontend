import '../models/sensor_envelope.dart';
import '../models/date_range.dart';

abstract interface class SensorRepository {
  Stream<SensorEnvelope> watchSensor(String projectId, String sensorId);

  Future<List<SensorEnvelope>> getHistory(
    String projectId,
    String sensorId,
    DateRange range,
  );
}
