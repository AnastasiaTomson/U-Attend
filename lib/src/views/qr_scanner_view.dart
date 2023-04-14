import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerView extends HookWidget {
  const QRScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = useState(Theme.of(context));

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: theme.value.secondaryHeaderColor,
            onPressed: () => Navigator.pop(context),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: theme.value.cardColor,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Column(
              children: [
                Text(
                  'Отметиться',
                  style: theme.value.primaryTextTheme.titleMedium,
                ),
              ]
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: QRView(
                  key: GlobalKey(debugLabel: 'QR'),
                  overlay: QrScannerOverlayShape(
                      borderColor: theme.value.secondaryHeaderColor,
                      borderRadius: 12,
                      borderLength: 50,
                      borderWidth: 10,
                      cutOutSize: 275.0),
                  onQRViewCreated: (QRViewController c) {
                    c.scannedDataStream.listen((scanData) {
                      c.pauseCamera();
                      Navigator.pushNamed(context, '/qr-error');
                    });
                  },
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
