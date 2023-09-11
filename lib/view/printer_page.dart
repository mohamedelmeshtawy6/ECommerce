import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:e_commerce/model/cart_product_model.dart';

class PrintPage extends StatefulWidget {
  final List<CartProductModel> data;
  final double? total;

  const PrintPage({
    Key? key,
    required this.data,
    this.total,
  }) : super(key: key);

  @override
  _PrintPageState createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String _devicesMsg = "";
  final f = NumberFormat("\$###,###.00", "en_US");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
  }

  Future<void> initPrinter() async {
    bluetoothPrint.startScan(timeout: const Duration(seconds: 2));

    if (!mounted) return;
    bluetoothPrint.scanResults.listen(
      (val) {
        if (!mounted) return;
        setState(() => {_devices = val});
        if (_devices.isEmpty) {
          setState(() {
            _devicesMsg = " لا توجد طابعات";
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' حدد الطابعه'),
        backgroundColor: Colors.redAccent,
      ),
      body: _devices.isEmpty
          ? Center(
              child: Text(_devicesMsg),
            )
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (c, i) {
                return ListTile(
                  leading: const Icon(Icons.print),
                  title: Text(_devices[i].name!),
                  subtitle: Text(_devices[i].address!),
                  onTap: () {
                    _startPrint(_devices[i]);
                  },
                );
              },
            ),
    );
  }

  Future<void> _startPrint(BluetoothDevice device) async {
    if (device != null && device.address != null) {
      await bluetoothPrint.connect(device);

      List<LineText> list = [];

      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content: " فاتوره بيع",
          weight: 2,
          width: 2,
          height: 2,
          align: LineText.ALIGN_CENTER,
          linefeed: 1,
        ),
      );

      for (var i = 0; i < widget.data.length; i++) {
        list.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: widget.data[i].name,
            weight: 0,
            align: LineText.ALIGN_LEFT,
            linefeed: 1,
          ),
        );

        list.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content:
                "${f.format(widget.data[i].price)} x ${widget.data[i].quantity}",
            align: LineText.ALIGN_LEFT,
            linefeed: 1,
          ),
        );
      }

      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content: "المجموع الكلى",
          align: LineText.ALIGN_LEFT,
          linefeed: 1,
        ),
      );
      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content: widget.total.toString(),
          align: LineText.ALIGN_LEFT,
          linefeed: 1,
        ),
      );
    }
  }
}
