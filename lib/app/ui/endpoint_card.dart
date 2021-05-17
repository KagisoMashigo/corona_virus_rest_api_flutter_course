import 'package:corona_virus_rest_api_flutter_course/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EndPointCardData {
  EndPointCardData(this.color, this.assetName, this.title);
  final Color color;
  final String assetName;
  final String title;
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key key, this.endpoint, this.value}) : super(key: key);
  final Endpoint endpoint;
  final int value;

  static Map<Endpoint, EndPointCardData> _cardsData = {
    Endpoint.cases:
        EndPointCardData(Color(0xFFFFF492), 'assets/count.png', 'Cases'),
    Endpoint.casesSuspected: EndPointCardData(
        Color(0xFFEEDA28), 'assets/suspect.png', 'Suspected cases'),
    Endpoint.casesConfirmed: EndPointCardData(
        Color(0xFFE99600), 'assets/fever.png', 'Confirmed Cases'),
    Endpoint.deaths:
        EndPointCardData(Color(0xFFE40000), 'assets/death.png', 'Deaths'),
    Endpoint.recovered:
        EndPointCardData(Color(0xFF70A901), 'assets/patient.png', 'Recovered'),
  };

  String get formattedValue {
    if (value == null) {
      return '';
    }
    return NumberFormat('#,###,###,###').format(value);
  }

  @override
  Widget build(BuildContext context) {
    final cardData = _cardsData[endpoint];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardData.title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: cardData.color),
              ),
              SizedBox(height: 4),
              SizedBox(
                height: 52,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      cardData.assetName,
                      color: cardData.color,
                    ),
                    Text(
                      formattedValue,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: cardData.color,
                            fontWeight: FontWeight.w500,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
