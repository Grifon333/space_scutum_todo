import 'package:open_weather_api/open_weather_api.dart';
import 'package:test/test.dart';

void main() {
  group('Response', () {
    test('returns correct Weather object', () {
      expect(
        Response.fromJson(
          <String, dynamic>{
            "coord": {"lon": 30.5241, "lat": 50.4501},
            "weather": [
              {
                "id": 804,
                "main": "Clouds",
                "description": "overcast clouds",
                "icon": "04n"
              }
            ],
            "base": "stations",
            "main": {
              "temp": 1.3,
              "feels_like": 1.3,
              "temp_min": 1.3,
              "temp_max": 1.3,
              "pressure": 1027,
              "humidity": 91,
              "sea_level": 1027,
              "grnd_level": 1010
            },
            "visibility": 10000,
            "wind": {"speed": 0.45, "deg": 188, "gust": 0.89},
            "clouds": {"all": 100},
            "dt": 1736975287,
            "sys": {
              "type": 2,
              "id": 2003742,
              "country": "UA",
              "sunrise": 1736920336,
              "sunset": 1736950915
            },
            "timezone": 7200,
            "id": 703448,
            "name": "Kyiv",
            "cod": 200
          },
        ),
        isA<Response>()
            .having((r) => r.coordinates.longitude, 'longitude', 30.5241)
            .having((r) => r.coordinates.latitude, 'latitude', 50.4501)
            .having((r) => r.name, 'name', 'Kyiv')
            .having((r) => r.main.temperature, 'temperature', 1.3)
            .having((r) => r.main.humidity, 'humidity', 91),
      );
    });
  });
}
