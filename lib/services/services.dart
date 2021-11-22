import 'dart:convert';
import 'dart:io';

import 'package:jogjakarir_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

part 'user_services.dart';
part 'food_services.dart';
part 'job_services.dart';
part 'transaction_services.dart';
part 'apply_services.dart';
part 'company_services.dart';

String baseURL = "http://192.168.100.187:8000/api/";
