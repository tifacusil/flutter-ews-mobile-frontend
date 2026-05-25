import 'alert_level.dart';

/// Local / mock representation of a project.
class Project {
  const Project({
    required this.id,
    required this.displayName,
    required this.typeLabel,
    this.activeAlertLevel,
  });

  final String id;
  final String displayName;
  final String typeLabel;
  final AlertLevel? activeAlertLevel;
}

/// API representation returned by GET /api/v1/projects/.
///
/// Field names are normalised from the server's snake_case response.
class ApiProject {
  const ApiProject({
    required this.projectId,
    required this.name,
    this.description,
    this.type,
    this.location,
    this.createdAt,
  });

  final String projectId;
  final String name;
  final String? description;
  final String? type;
  final String? location;
  final DateTime? createdAt;

  factory ApiProject.fromJson(Map<String, dynamic> json) => ApiProject(
        projectId: (json['project_id'] as String?) ??
            (json['id'] as String?) ??
            '',
        name: (json['name'] as String?) ??
            (json['display_name'] as String?) ??
            '',
        description: json['description'] as String?,
        type: (json['type'] as String?) ??
            (json['type_label'] as String?),
        location: json['location'] as String?,
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'] as String)
            : null,
      );

  /// Convert to the local [Project] model used by existing UI widgets.
  Project toProject() => Project(
        id: projectId,
        displayName: name.isNotEmpty ? name : projectId,
        typeLabel: type ?? 'slope',
      );
}
