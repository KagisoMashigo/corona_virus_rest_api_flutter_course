import 'package:corona_virus_rest_api_flutter_course/app/services/api.dart';
import 'package:flutter/foundation.dart';

class EndpointsData {
  EndpointsData({@required this.values});
  final Map<Endpoint, int> values;
  int get cases => values[Endpoint.cases];
  int get casesConfirmed => values[Endpoint.cases];
  int get casesSuspected => values[Endpoint.cases];
  int get deaths => values[Endpoint.cases];
  int get recovered => values[Endpoint.cases];

  @override
  String toString() {
    'cases: $cases, confirmed: $casesConfirmed, suspected: $casesSuspected, deaths: $deaths, recovered: $recovered';
  }
}
