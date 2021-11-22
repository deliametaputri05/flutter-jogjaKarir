part of 'services.dart';

class ApplyServices {
  static Future<ApiReturnValue<List<Apply>>> getApplys(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'apply';

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Apply> applys = (data['data']['data'] as Iterable)
        .map((e) => Apply.fromJson(e))
        .toList();

    return ApiReturnValue(value: applys);
  }

  static Future<ApiReturnValue<Apply>> submitApply(Apply apply,
      {File file, http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'submit';

    var uri = Uri.parse(url);

    var request = http.MultipartRequest("POST", uri)
      ..headers["Content-Type"] = "application/json"
      ..headers["Authorization"] = "Bearer ${User.token}";

    var multipartFile = await http.MultipartFile.fromPath('file', file.path);
    request.files.add(multipartFile);

    request.fields['id'] = apply.id.toString();
    request.fields['job_id'] = apply.job.id.toString();
    request.fields['user_id'] = apply.user.id.toString();
    request.fields['letter'] = apply.letter;
    request.fields['status'] = "TERKIRIM";

    var response = await request.send();

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    String responseBody = await response.stream.bytesToString();
    var data = jsonDecode(responseBody);
    print(data['data']);
    Apply value = Apply.fromJson(data['data']);

    // if (file != null) {
    //   ApiReturnValue<String> result = await upload(file);
    //   if (result.value != null) {
    //     value = value.copyWith(
    //         file: "http://192.168.100.187:8000/storage/" + result.value);
    //   }
    // }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> upload(File file,
      {http.MultipartRequest request}) async {
    try {
      String url = baseURL + 'upload';
      var uri = Uri.parse(url);

      if (request == null) {
        request = http.MultipartRequest("POST", uri)
          ..headers["Content-Type"] = "application/json"
          ..headers["Authorization"] = "Bearer ${User.token}";
      }

      var multipartFile = await http.MultipartFile.fromPath('file', file.path);
      request.files.add(multipartFile);
      request.fields['user'] = 'someone@somewhere.com';

      var response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);

        String filePath = data['data'][0];

        return ApiReturnValue(value: filePath);
      } else {
        return ApiReturnValue(message: 'Uploading CV File Failed');
      }
    } catch (e) {
      print("ini error");
      print(e.toString());
    }
  }
}
