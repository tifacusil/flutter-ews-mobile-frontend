import '../models/alert.dart';

abstract interface class AlertRepository {
  Stream<Alert> watchAlerts(String projectId);

  Future<List<Alert>> getAlertHistory(String projectId);
}
