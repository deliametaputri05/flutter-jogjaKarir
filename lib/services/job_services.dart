part of 'services.dart';

class JobServices {
  static Future<ApiReturnValue<List<Job>>> getJobs({http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'job';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Job> jobs =
        (data['data']['data'] as Iterable).map((e) => Job.fromJson(e)).toList();

    return ApiReturnValue(value: jobs);
  }
}
