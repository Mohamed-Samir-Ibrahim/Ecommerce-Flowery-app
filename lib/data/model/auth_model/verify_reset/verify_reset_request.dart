class VerifyResetRequest {
  final String resetCode;

  VerifyResetRequest(
      {required this.resetCode});
  Map<String, dynamic> toJson() =>
      {"resetCode": resetCode};
}
