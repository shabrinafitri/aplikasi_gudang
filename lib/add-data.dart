import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  //Kontroler untuk menambah data per field
  TextEditingController controllerKode = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerStok = new TextEditingController();

  //Membuat method addData
  void addData() {
    //Url add data di webhosting
    var url = "https://development-api.000webhostapp.com/flutter_api/add.php";
    
    //Memasukan data kedalam array
    http.post(url, body: {
      "kode_barang": controllerKode.text,
      "nama_barang": controllerNama.text,
      "stok_barang": controllerStok.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Barang"),
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
                  child: new Text("Tambah Data"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    //Memanggil method addData
                    addData();
                    //Mengembalikan ke halaman awal setelah data berhasil dibuat
                    Navigator.pop(context);
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