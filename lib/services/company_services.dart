part of 'services.dart';

class CompanyServices {
  static Future<ApiReturnValue<List<Company>>> getCompanies(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'company';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Company> company = (data['data']['data'] as Iterable)
        .map((e) => Company.fromJson(e))
        .toList();

    log('data: $data');

    return ApiReturnValue(value: company);
  }
}
