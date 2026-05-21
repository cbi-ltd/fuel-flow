class TerminalModel {
  final String terminalId;
  final String serialNumber;
  final String status;

  TerminalModel({
    required this.terminalId,
    required this.serialNumber,
    required this.status,
  });

  factory TerminalModel.fromJson(Map<String, dynamic> json) {
    return TerminalModel(
      terminalId: json['terminalId'] ?? '',
      serialNumber: json['serialNumber'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
