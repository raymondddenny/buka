import 'dart:convert';

import 'package:bukalapak_test/shared/dialog_helper.dart';

import 'app_exception.dart';

class BaseController {
  void handleError(error) {
    if (error is BadRequestException) {
      var message = jsonDecode(error.message!);

      DialogHelper.showErrorDialog(description: message!['message']);
    } else if (error is FetchDataException) {
      var message = error.message;
      // show dialog
      DialogHelper.showErrorDialog(description: message!);
    } else if (error is FetchDataException2) {
      var message = error.message;
    } else if (error is ApiNotRespondingException) {
      var message = error.message;

      // show dialog
      DialogHelper.showErrorDialog(description: 'Oops! It take longer to respond.', subtitle: message!);
    }
  }

  String handleErrorNoDialog(error) {
    var result;
    if (error is BadRequestException) {
      var message = error.message;

      // if (_signinsignupcontroller.isPageOTP.value) {
      //   _signinsignupcontroller.isOTPCorrect.value = false;
      //   result = _signinsignupcontroller.errorMessage.value = message!['message'];
      // } else {
      //   result = message!['message'];
      // }
      result = message!;
    } else if (error is FetchDataException) {
      var message = error.message;
      result = message!;
    } else if (error is ApiNotRespondingException) {
      var message = error.message;
      result = message!;
    }
    return result;
  }
}
