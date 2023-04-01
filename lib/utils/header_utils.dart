import 'dart:io';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

class HeaderUtils {

  Map<String, String> getNonTokenatedHeaders() {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Charset": "utf-8"
    };
    return headers;
  }

  Future<dynamic> attachTokenWithHeaders() async {

    final box = Hive.box(DBConstants.appBoxName);
    String? token = box.get(DBConstants.token);

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Charset": "utf-8"
    };

    if(token!.isNotEmpty){
      headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer $token'
      });
    }

    return headers;
  }

}