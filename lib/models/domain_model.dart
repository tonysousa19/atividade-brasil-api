class DomainModel {
  final String fqdn;
  final String status;
  final int statusCode;
  final String? expiresAt;
  final String? publicationStatus;
  final List<String>? hosts;
  final List<String>? suggestions;
  final List<String>? reasons;

  DomainModel({
    required this.fqdn,
    required this.status,
    required this.statusCode,
    this.expiresAt,
    this.publicationStatus,
    this.hosts,
    this.suggestions,
    this.reasons,
  });

  factory DomainModel.fromJson(Map<String, dynamic> json) {
    return DomainModel(
      fqdn: json['fqdn'] ?? '',
      status: json['status'] ?? '',
      statusCode: json['status_code'] ?? 10,
      expiresAt: json['expires-at'],
      publicationStatus: json['publication-status'],
      hosts: json['hosts'] != null ? List<String>.from(json['hosts']) : null,
      suggestions: json['suggestions'] != null ? List<String>.from(json['suggestions']) : null,
      reasons: json['reasons'] != null ? List<String>.from(json['reasons']) : null,
    );
  }

  String get statusDescription {
    const Map<int, String> statusMap = {
      0: "Disponível",
      1: "Disponível com tickets concorrentes",
      2: "Já registrado",
      3: "Indisponível",
      4: "Inválido",
      5: "Aguardando processo de liberação",
      6: "Em processo de liberação",
      7: "Em processo de liberação com tickets concorrentes",
      8: "Erro",
      9: "Processo competitivo de liberação",
      10: "Desconhecido",
    };
    return statusMap[statusCode] ?? "Desconhecido";
  }
}