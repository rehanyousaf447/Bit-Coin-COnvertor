import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper{

  String url;
  NetworkingHelper(this.url);

  Future<dynamic> getData() async{

    http.Response response= await http.get(url);

    if(response.statusCode==200) {
      String data=response.body;

      return jsonDecode(data);

    }
    else {
      print("ERROR IN HTTP:"+response.statusCode.toString());
    }

  }

}