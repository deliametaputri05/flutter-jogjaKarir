part of 'services.dart';

class EducationServices {
  static Future<ApiReturnValue<List<Education>>> getEducations(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'edu';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Education> educations = (data['data']['data'] as Iterable)
        .map((e) => Education.fromJson(e))
        .toList();

    return ApiReturnValue(value: educations);
  }
}
