import 'package:aplikasi_gudang/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  //Variabel untuk menerima data
  final List list;
  final int index;
  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  //Kontroler untuk mengubah data per field
  TextEditingController controllerKode;
  TextEditingController controllerNama;
  TextEditingController controllerStok;

  void editData() {
    //Url edit data di webhosting
    var url = "https://development-api.000webhostapp.com/flutter_api/edit.php";

    //Memasukan data kedalam array
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "kode_barang": controllerKode.text,
      "nama_barang": controllerNama.text,
      "stok_barang": controllerStok.text,
    });
  }

  @override
  void initState() {
    //Mengisi kontroler dengan data dari variabel list dan index
    controllerKode = new TextEditingController(
        text: widget.list[widget.index]['kode_barang']);
    controllerNama = new TextEditingController(
        text: widget.list[widget.index]['nama_barang']);
    controllerStok = new TextEditingController(
        text: widget.list[widget.index]['stok_barang']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Barang"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          //Penggunaan List View agar tidak terjadi error di mode landscape
          children: <Widget>[
            new Column(
              children: <Widget>[
                //Input field Kode Barang
                new TextField(
                  controller: controllerKode,
                  decoration: new InputDecoration(labelText: "Kode Barang"),
                ),
                //Input field Nama Barang
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(labelText: "Nama Barang"),
                ),
                //Input field Stok Barang
                new TextField(
                  controller: controllerStok,
                  decoration: new InputDecoration(labelText: "Stok Barang"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),

                new RaisedButton(
                  child: new Text("Perbarui Data"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    //Memanggil method edit data
                    editData();
                    //Mengembalikan ke halaman awal setelah data berhasil di edit
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
