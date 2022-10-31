import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {

  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    Response response = await get(url);
    print(response);
    if (response.statusCode == 200) {
      String data = response.body;
      var DecodeData = jsonDecode(data);
      return DecodeData;
    }
    else {
      print(response.statusCode);
    }
  }
}