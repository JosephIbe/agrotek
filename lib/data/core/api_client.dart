import 'dart:convert';
import 'dart:developer';

import 'package:agenpo/common/db_constants.dart';

import 'package:agenpo/data/core/api_constants.dart';

import 'package:agenpo/domain/entities/accept_offer_params.dart';
import 'package:agenpo/domain/entities/add_bank_account_params.dart';
import 'package:agenpo/domain/entities/create_pin_params.dart';
import 'package:agenpo/domain/entities/initiate_withdrawal_params.dart';
import 'package:agenpo/domain/entities/login_params.dart';
import 'package:agenpo/domain/entities/farmer_register_params.dart';
import 'package:agenpo/domain/entities/news_letter_params.dart';
import 'package:agenpo/domain/entities/resolve_bank_account_params.dart';
import 'package:agenpo/domain/entities/send_contact_mail_params.dart';

import 'package:agenpo/utils/header_utils.dart';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class APIClient {

  APIClient();

  Future<dynamic> login({required String pathSegment, required LoginParams params}) async {
    log("Starting api login data");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('Login Data Params Data, ${params.toJson()}');

    try {

      http.Response response = await http.post(
          url,
          headers: HeaderUtils().getNonTokenatedHeaders(),
          body: jsonEncode(params.toJson())
      );
      print('Login data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }

  }

  Future<dynamic> register({required String pathSegment, required FarmerRegisterParams params}) async {
    log("Starting api register data");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('Register Data Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.post(
          url,
          headers: HeaderUtils().getNonTokenatedHeaders(),
          body: jsonEncode(params.toJson())
      );
      print('register data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }

  }

  Future<dynamic> generateOTP({required String pathSegment, required dynamic params}) async {
    log("Starting api generate otp");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('Generate OTP Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.post(
          url,
          headers: HeaderUtils().getNonTokenatedHeaders(),
          body: jsonEncode(params.toJson())
      );
      print('register data response:\n$response');

      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }

  }

  Future<dynamic> validateBVN({required String pathSegment}) async {
    log("Starting api validate bvn");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('validate bvn response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getAllOffers({required String pathSegment}) async {
    log("Starting api get all offers");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {

      http.Response response = await http.get(
          url,
          headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get all offers data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> acceptOffer({required String pathSegment, required AcceptOfferParams params}) async {
    log("Starting api accept offer");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('Accept Offer Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.post(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
          body: jsonEncode(params.toJson())
      );
      print('accept offer data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getAllTransactions({required String pathSegment}) async {
    log("Starting api get all transactions");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get all transactions data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getProfile({required String pathSegment}) async {
    log("Starting api get profile");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get profile data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getWarehouses({required String pathSegment}) async {
    log("Starting api get warehouses");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get warehouses data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getAllInventoryItems({required String pathSegment}) async {
    log("Starting api get all inventory items");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get all inventory items data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getActiveInventoryItems({required String pathSegment}) async {
    log("Starting api get active inventory items");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get active inventory items data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getSoldOutInventoryItems({required String pathSegment}) async {
    log("Starting api get sold out inventory items");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get sold out inventory items data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getSingleInventoryItem({required String pathSegment}) async {
    log("Starting api get single inventory item");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get single inventory item data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getWalletBalance() async {
    log("Starting api get wallet balance");

    final userId = Hive.box(DBConstants.appBoxName).get(DBConstants.userId);
    print('userId in get wallet balance:\t$userId');

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}/users/$userId/wallet');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get wallet balance data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> createTransactionPIN({required String pathSegment, required CreatePINParams params}) async {
    log("Starting api create transaction pin");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('create transaction pin Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.post(
          url,
          headers: await HeaderUtils().attachTokenWithHeaders(),
          body: jsonEncode(params.toJson())
      );
      print('create transaction pin data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }

  }

  Future<dynamic> getUserBanks({required String pathSegment}) async {
    log("Starting api get user banks");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment${Hive.box(DBConstants.appBoxName)
        .get(DBConstants.userId)}');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get user banks data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getBanks({required String pathSegment}) async {
    log("Starting api get banks");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.get(
        url,
        headers: await HeaderUtils().attachTokenWithHeaders(),
      );
      print('get banks data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> addBankDetails({required String pathSegment, required AddBankAccountParams params}) async {

    log("Starting api add bank details");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('add bank details Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.post(
          url,
          headers: await HeaderUtils().attachTokenWithHeaders(),
          body: jsonEncode(params.toJson())
      );
      print('add bank details data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }

  }

  Future<dynamic> resolveBankDetails({required String pathSegment, required ResolveBankAccountParams params}) async {

    log("Starting api resolve bank details");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('resolve bank details Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.post(
          url,
          headers: await HeaderUtils().attachTokenWithHeaders(),
          body: jsonEncode(params.toJson())
      );
      print('resolve bank details data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }

  }

  Future<dynamic> initiateWithdrawal({required String pathSegment, required InitiateWithdrawalParams params}) async {

    log("Starting api initiate withdrawal");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('initiate withdrawal Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.post(
          url,
          headers: await HeaderUtils().attachTokenWithHeaders(),
          body: jsonEncode(params.toJson())
      );
      print('initiate withdrawal data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }

  }

  Future<dynamic> contactUs({required String pathSegment, required SendContactMailParams params}) async {
    log("Starting api send contact mail");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('send contact mail Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.post(
          url,
          headers: await HeaderUtils().attachTokenWithHeaders(),
          body: jsonEncode(params.toJson())
      );
      print('send contact mail data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> subscribeToNewsLetter({required String pathSegment, required NewsLetterParams params}) async {
    log("Starting api subscribe to news letter");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('subscribe to news letter Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.post(
          url,
          headers: await HeaderUtils().attachTokenWithHeaders(),
          body: jsonEncode(params.toJson())
      );
      print('subscribe to news letter data response:\n$response');
      return response;
    } catch(e){
      print('error caught in api client:\t$e}');
      rethrow;
    }
  }

}