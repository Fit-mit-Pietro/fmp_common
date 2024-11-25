library dialog_service;

import 'package:flutter/material.dart';
import 'package:fmp_common/fmp_common.dart';

part 'delete_dialog.dart';
part 'error_dialog.dart';
part 'info_dialog.dart';

class DialogService {
  static Future<bool?> showDeleteDialog(
    BuildContext context, {
    required String header,
    required String label,
    // bool Parameter: Is the deletion successful?
    required Future<bool> Function() deleteOperation,
  }) async {
    return showDialog<bool>(
        context: context,
        builder: (c) => _DeleteDialog(
              header: header,
              label: label,
              deleteOperation: deleteOperation,
            ));
  }

  static Future<bool?> showErrorDialog(
    BuildContext context, {
    String header = "Fehler aufgetreten",
    String label = "Leider ist etwas schief gegangen",
    required Object exception,
  }) async {
    return showDialog<bool>(
        context: context,
        builder: (c) =>
            _ErrorDialog(header: header, label: label, exception: exception));
  }

  static Future<bool?> showInfoDialog(
    BuildContext context, {
    required String header,
    required String label,
  }) async {
    return showDialog<bool>(
        context: context,
        builder: (c) => _InfoDialog(
              header: header,
              label: label,
            ));
  }
}
