import 'package:aplikasi_gudang/edit-data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class Detail extends StatefulWidget {
  //Variabel untuk menampung data
  List list;
  int index;
  Detail({this.index, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData() {
    //Url hapus data di webhosting
    var url = "https://development-api.000webhostapp.com/flutter_api/delete.php";

    http.post(url, body: {
      'id': widget.list[widget.index]['id']
    });
  }

  //Validasi tombol delete
  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Serius mau hapus data '${widget.list[widget.index]['nama_barang']}'?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Oke hapus!", style: new TextStyle(color: Colors.white),),
          color: Colors.red,
          //Ketika di tekan akan menjalankan method deleteData
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Home(),
              )
            );
          },
        ),
        new RaisedButton(
          child: new Text("Batal", style: new TextStyle(color: Colors.white),),
          color: Colors.green,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //Menampilkan nama barang sebagai title
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['nama_barang']}")),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            //Mengatur data menggunakan kolom widget
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['nama_barang'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "Kode Barang : ${widget.list[widget.index]['kode_barang']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Stok Barang : ${widget.list[widget.index]['stok_barang']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),

                //Membuat Button Edit dan Delete
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //Button untuk link ke halaman form edit data
                    new RaisedButton(
                      child: new Text("Edit"),
                      color: Colors.yellow,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index),
                        )
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("Hapus"),
                      color: Colors.red,
                      //Ketika tombol delete di tekan akan menjalankan method confirm sebagai validasi
                      onPressed: ()=>confirm(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
