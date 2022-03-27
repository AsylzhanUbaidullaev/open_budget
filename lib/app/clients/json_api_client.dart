// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:open_budget/app/main/user_data.dart';
// import 'package:open_budget/core/network/interfaces/base_client_generator.dart';
// part 'json_api_client.freezed.dart';

// @freezed
// class PlaceHolderClient extends BaseClientGenerator with _$PlaceHolderClient {
//   static final UserData _userData = UserData();
//   // Routes
//   const PlaceHolderClient._() : super();
//   const factory PlaceHolderClient.login(Map<String, dynamic> data) = _Login;

//   @override
//   String get baseURL => "https://api.7food.kz/v1";

//   @override
//   Future<Map<String, dynamic>> get header async {
//     return {
//       "accept": "application/json",
//       "authorization": "Bearer " + await _userData.getToken(),
//     };
//   }

//   @override
//   String get path {
//     return this.when<String>(
//       login: (Map<String, dynamic> data) => '/auth/login',
//     );
//   }

//   @override
//   String get method {
//     return this.maybeWhen<String>(
//       orElse: () => 'GET',
//       login: (Map<String, dynamic> data) => 'POST',
//     );
//   }

//   @override
//   dynamic get body {
//     return this.maybeWhen(
//         orElse: () {
//           return null;
//         },
//         login: (Map<String, dynamic> data) => data);
//   }

//   @override
//   Map<String, dynamic>? get queryParameters {
//     return this.maybeWhen(
//       orElse: () {
//         return null;
//       },
//     );
//   }
// }
