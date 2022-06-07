import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/pages/pages.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomeBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentindex = uiProvider.selectedMenuOpt;
    // final tempScan = new ScanModel(valor: 'https://google.com');
    // DBProvider.db.nuevoScanRaw(tempScan);
    // DBProvider.db.getScanBy(2).then((scan) => print(scan?.valor));
    // DBProvider.db.getTodosLosScans().then(print);

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentindex) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasScreen();

      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return DireccionesScreen();

      default:
        return MapasScreen();
    }
  }
}
