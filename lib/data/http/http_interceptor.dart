// import 'package:flutter/material.dart';
// import 'package:http_interceptor/http_interceptor.dart';

// class NotFoundInterceptor implements InterceptorContract {
//   final BuildContext context; // Pass the context to the interceptor

//   NotFoundInterceptor(this.context); // Constructor to receive the context

//   @override
//   Future<RequestData> interceptRequest({required RequestData data}) async {
//     return data;
//   }

//   @override
//   Future<ResponseData> interceptResponse({required ResponseData data}) async {
//     if (data.statusCode == 404) {
//       // Show an alert dialog when a 404 response is encountered
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Resource Not Found'),
//             content: Text('The requested resource could not be found.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the dialog
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//     return data;
//   }
  
//   @override
//   Future<bool> shouldInterceptRequest() {
//     // TODO: implement shouldInterceptRequest
//     throw UnimplementedError();
//   }
  
//   @override
//   Future<bool> shouldInterceptResponse() {
//     // TODO: implement shouldInterceptResponse
//     throw UnimplementedError();
//   }
// }
