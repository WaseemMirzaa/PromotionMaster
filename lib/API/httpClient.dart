import 'package:http/http.dart' as http;

Future<http.Response> postHttpCall(
  String url,
  String encodeBody,
) async {
  print("POST api called URL => " + url);
  print("POST api Body => " + encodeBody);

  var response = await http
      .post(Uri.parse(url), body: encodeBody, headers: <String, String>{
    'Content-Type': 'application/json',
  });
  return response;
}

Future<http.Response> getHttpCall(
  String url,
) async {
  print("Get api called URL => " + url);

  var response = await http.get(Uri.parse(url), headers: <String, String>{
    'Content-Type': 'application/json',
  });
  return response;
}
