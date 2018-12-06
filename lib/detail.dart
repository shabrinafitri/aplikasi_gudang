import 'package:aplikasi_gudang/edit-data.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  //Variabel untuk menampung data
  List list;
  int index;
  Detail({this.index, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
                      child: new Text("Delete"),
                      color: Colors.red,
                      onPressed: () {},
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
