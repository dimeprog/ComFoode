import '../data/remote/Api Services/app_execption.dart';
import '../helpers/dialog_helper.dart';

class BaseExecptionController {
  static void handleError(err) {
    if (err is BadRequestExecption) {
      var msg = err.message;
      DialogHelper.showDialog(content: msg!);
    } else if (err is ApiNotRespondiingExecption) {
      var msg = err.message;
      DialogHelper.showDialog(content: msg!);
    } else if (err is UnauthorizedExecption) {
      var msg = err.message;
      DialogHelper.showDialog(content: msg!);
    } else if (err is TimeoutExecption) {
      var msg = err.message;
      DialogHelper.showDialog(content: msg!);
    } else if (err is FetchDataExecption) {
      var msg = err.message;
      DialogHelper.showDialog(content: msg!);
    } else {
      var msg = err.toString();
      DialogHelper.showDialog(content: msg);
    }
  }
}
