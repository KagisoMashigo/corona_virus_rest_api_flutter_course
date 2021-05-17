import 'dart:io';

import 'package:corona_virus_rest_api_flutter_course/app/repositories/data_repository.dart';
import 'package:corona_virus_rest_api_flutter_course/app/repositories/endpoints_data.dart';
import 'package:corona_virus_rest_api_flutter_course/app/services/api.dart';
import 'package:corona_virus_rest_api_flutter_course/app/ui/endpoint_card.dart';
import 'package:corona_virus_rest_api_flutter_course/app/ui/last_updated_status_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData _endpointsData;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    try {
      final dataRepository =
          Provider.of<DataRepository>(context, listen: false);
      final cases = await dataRepository.getAllEndpointsData();
      setState(() => _endpointsData = cases);
    } on SocketException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatted = LastUpdatedFormatter(
      lastUpdated: _endpointsData != null
          ? _endpointsData.values[Endpoint.cases].date
          : null,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Tracker'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            LastUpdatedStatusText(
              text: formatted.lastUpdatedStatusText(),
            ),
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData.values[endpoint].value
                    : null,
              )
          ],
        ),
      ),
    );
  }
}
