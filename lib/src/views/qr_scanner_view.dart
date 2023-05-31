import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:u_attend/src/blocs/qr_scanner/qr_scanner_bloc.dart';
import 'package:u_attend/src/locator.dart';

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
        body: BlocProvider<QrScannerBloc>(
          create: (_) => locator<QrScannerBloc>(),
          child: BlocConsumer<QrScannerBloc, QRScannerState>(
            listener: (context, state){
              if(state is QrScannerSuccess){
                Navigator.pushReplacementNamed(context, '/qr-success', arguments: state.message);
              }
              if (state is QrScannerError){
                Navigator.pushReplacementNamed(context, '/qr-error', arguments: state.message);
              }
            },
            builder: (context, state){
              return Container(
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
                              c.stopCamera();
                              final List<String> scanDataList = scanData.code!.split('_');
                              if (scanDataList.length != 0){
                                BlocProvider.of<QrScannerBloc>(context).add(
                                    ScanQR(
                                        int.tryParse(scanDataList[0])
                                    ),
                                );
                              }else{
                                Navigator.pushReplacementNamed(context, '/qr-error', arguments: 'Ошибка');
                              }
                            });
                          },

                        ),
                      ),
                    ],
                  )
              );
            },
          ),
        ),
      ),
    );
  }
}
