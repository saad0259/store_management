import 'package:flutter/material.dart';
import 'function_response.dart';

import '../service_locator.dart';

class CustomAlerts {
  void showSnackBar(BuildContext context, String message,
      {bool success = false}) {
    final ThemeData theme = Theme.of(context);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: success ? Colors.blue : theme.errorColor,
    ));
  }

  Future<FunctionResponse> confirmDelete(
      {required BuildContext context}) async {
    final ThemeData theme = Theme.of(context);

    FunctionResponse _fResponse = FunctionResponse();

    try {
      await showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Delete Entry',
                    style: theme.textTheme.headline3,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      'Are you sure you want to delete this entry? This entry will be deleted permanently.'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: theme.elevatedButtonTheme.style?.copyWith(
                            foregroundColor: MaterialStateProperty.all(
                                theme.colorScheme.primary),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.white.withAlpha(240)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: theme.colorScheme.primary),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            _fResponse.passed();
                            _fResponse.message = 'Delete Confirmed';
                            Navigator.of(context).pop();
                          },
                          child: const Text('Delete'),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            _fResponse.message = 'Delete Canceled';
                            Navigator.of(context).pop();
                          },
                          child: const Text('No'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    } catch (e) {
      _fResponse.message = 'Error showing delete dialogue : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> confirmAction({
    required BuildContext context,
    String? title = 'Confirmation',
    String? message = 'Are you sure?',
  }) async {
    final ThemeData theme = Theme.of(context);

    FunctionResponse _fResponse = FunctionResponse();

    try {
      await showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title!,
                    style: theme.textTheme.headline3,
                  ),
                  const SizedBox(height: 10),
                  Text(message!),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: theme.elevatedButtonTheme.style?.copyWith(
                            foregroundColor: MaterialStateProperty.all(
                                theme.colorScheme.primary),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.white.withAlpha(240)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: theme.colorScheme.primary),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            _fResponse.passed();
                            _fResponse.message = 'Action Confirmed';
                            Navigator.of(context).pop();
                          },
                          child: const Text('Yes'),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            _fResponse.message = 'Action Canceled';
                            Navigator.of(context).pop();
                          },
                          child: const Text('No'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    } catch (e) {
      _fResponse.message = 'Error showing delete dialogue : $e';
    }

    return _fResponse;
  }

  void showLoaderDialog(BuildContext context,
      {String message = 'Loading ...'}) {
    final ThemeData theme = Theme.of(context);

    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            // color: AppColors.primaryColor,
            valueColor:
                AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
            backgroundColor: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: Text(
              message,
            ),
          )
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () => Future.value(false), child: alert);
      },
    );
  }

  void popLoader(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<FunctionResponse> selectDate(
    BuildContext context, {
    DateTime? initDate,
    DateTime? firstDate,
    DateTime? endDate,
  }) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: initDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(2000, 8),
          lastDate: endDate ?? DateTime(2101));
      if (picked != null) {
        fResponse.passed();
        fResponse.message = 'Date Picked';
        fResponse.data = picked;
      } else {
        fResponse.failed();
        fResponse.message = 'No date picked';
      }
    } catch (e) {
      fResponse.failed();
      fResponse.message = 'Error Picking Date : $e';
    }
    return fResponse;
  }
}
