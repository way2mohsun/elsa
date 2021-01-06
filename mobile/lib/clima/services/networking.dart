import 'package:http/http.dart' as http; // rename package to http
import 'dart:convert' as convert;

class Network_Helper {
  final String url;
  Network_Helper({this.url});

//'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api_key'
  Future get_data() async {
    // Await the http get response, then decode the json-formatted response.
    //var response = await http.get(url);
    http.Response response = await http.get(url);
    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
    //['weather'][0]['id']
    //['main']['temp']
    //['name']
    return convert.jsonDecode(response.body);
  }
}