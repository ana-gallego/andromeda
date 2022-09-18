import 'dart:developer';

import 'package:flutter/material.dart';
import 'tools.dart';

///
/// Esta clase contiene todos los mensajes de dialogo que se mostrarán dentro de la aplicación
///

class CustomDialogs {
  showMessageDialog(message, context, hasloading) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: dimens.borderRadius(10.0),
          content: Text(message ?? ''),
          actions: <Widget>[
            TextButton(
              child: Text(
                'ACEPTAR',
                style: TextStyle(color: colors.primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((_) {
      /// en caso de que tenga un loading lo cierro tambien
      if (hasloading) {
        Navigator.pop(context);
      }
    });
  }

  showLoadingDialog(context) {
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
                titlePadding: const EdgeInsets.all(0),
                contentPadding: const EdgeInsets.all(0),
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Container(
                  alignment: Alignment.center,
                ));
          });
    } catch (e) {
      log("Error on showLoadingDiaglog", error: e);
    }
  }

  hideLoadingDialog(context) {
    try {
      Navigator.pop(context);
    } catch (e) {
      log("Error on hideLoadingDiaglog", error: e);
    }
  }

  showDinamicDialog(
    BuildContext context, {
    required Widget child,
    Function? whenComplete,
    bool? dimisible,
  }) {
    return showDialog(
        context: context,
        barrierDismissible: dimisible ?? true,
        builder: (context) {
          return AlertDialog(
              titlePadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: child);
        }).whenComplete(() {
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }
}

CustomDialogs dialogs = CustomDialogs();
