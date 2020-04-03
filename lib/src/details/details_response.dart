import 'dart:convert';

import 'package:google_place/src/details/details_result.dart';

class DetailsResponse {
  final String status;
  final List<String> htmlAttributions;
  final DetailsResult results;

  DetailsResponse({
    this.status,
    this.htmlAttributions,
    this.results,
  });

  factory DetailsResponse.fromJson(Map<String, dynamic> json) {
    return DetailsResponse(
      status: json['status'],
      htmlAttributions: json['html_attributions'] != null
          ? (json['html_attributions'] as List<dynamic>).cast<String>()
          : null,
      results: json['result'] != null
          ? DetailsResult.fromJson(json['result'])
          : null,
    );
  }

  static DetailsResponse parseDetailsResult(String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();
    return DetailsResponse.fromJson(parsed);
  }
}