import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import './detail.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  //Mengambil data dari database
  Future<List> showData() async {
    final response = await http
        .get("https://development-api.000webhostapp.com/flutter_api/show.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Aplikasi Gudang"),
      ),

      //Membuat floating button untuk link ke halaman form tambah data
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {},
      ),

      //Memasukan data kedalam Widget List
      body: new FutureBuilder<List>(
        future: showData(),
        builder: (context, snapshot) {
          //Penanganan Error
          if (snapshot.hasError) print(snapshot.error);
          //Penanganan Data
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                ) //Mengirim data snapshot ke list
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  //Mengambil data dari data snapshot
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    //Membuat List View
    return new ListView.builder(
      //Jumlah data yang kita ambil
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        //Menampilkan data di List Tile
        return new Container(
          //Memberi padding pada tiap card
          padding: const EdgeInsets.all(3.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                    list: list,
                    index:
                        i))), //Mengirim data ke detail.dart lewat variabel list dan index
            child: new Card(
              child: new ListTile(
                //Menampilkan nama barang
                title: new Text(list[i]['nama_barang']),
                //Memberikan icon
                leading: new Icon(Icons.apps),
                //Menampilkan stok barang
                subtitle: new Text("Stok : ${list[i]['stok_barang']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
