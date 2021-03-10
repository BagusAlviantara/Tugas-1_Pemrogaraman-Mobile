import 'package:flutter/material.dart';
/*import 'package:flutter_test/flutter_test.dart';*/
//import halaman yang diperlukan
import './detailproduk.dart';

class Produklist extends StatefulWidget {
  @override
  _ProduklistState createState() => _ProduklistState();
}

class _ProduklistState extends State<Produklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produk Pariwisata Desa Sidatapa"),
      ),
      //body untuk content
      //menampilkan list
      body: ListView(
        shrinkWrap: true,
        //padding
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        //anggota dari list berupa widget children
        children: <Widget>[
          //GestureDetector untuk menangani gesture pengguna
          new GestureDetector(
            //listener berupa klik 1x
            onTap: () {
              //navigator.push untuk berpindah halaman
              Navigator.of(context).push(new MaterialPageRoute(
                //pemanggilan class DetailProduk beserta pengiriman detail produk
                builder: (BuildContext context) => DetailProduk(
                  name: "Lampu Hias",
                  description:
                      'Lampu hias dengan corak coklat ini akan membantu mempercantik ruangan Anda!',
                  price: 50000,
                  image: 'lampu.jpg',
                  star: 1,
                ),
              ));
            },
            //memanggil class production
            child: ProductBox(
              //berisi parameter yang diperlukan di clas ProductBox
              name: "Sokasi",
              description:
                  "Sokasi adalah produk untuk menyimpan barang atau menaruh buah",
              price: 2000,
              image: 'sokasi.jpg',
              star: 1,
            ),
          ),
        ],
      ),
      /*body: Center(
        child: Text("Berikut Deskripsi Porduk"),
      ),*/
    );
  }
}

//menggunakan widget StatelessWidget
class ProductBox extends StatelessWidget {
  //deklarasi variabel yang diterima dari MyHomePage
  ProductBox(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);
  //menampung variabel yang diterima untuk digunakan pada class ini
  final String name;
  final String description;
  final int price;
  final String image;
  final int star;
  final children = <Widget>[];

  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 10,
        color: Colors.deepOrange,
      ));
    }
    //menggunakan widget container
    return Container(
        //padding
        padding: EdgeInsets.all(10),
        //menggunakan widget card
        child: Card(
            //membuat tampilan secara horisontal antarimage dan deksripsi
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //children digunakan untuk menampung banyak widget
                children: <Widget>[
              Image.asset(
                "assets/appimages/" + image,
                width: 150,
              ),
              Expanded(
                  //child digunakan untuk menampung satu widget
                  child: Container(
                      padding: EdgeInsets.all(5),
                      //membuat tampilan secara vertikal
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //ini isi tampilan vertikal tersebut
                        children: <Widget>[
                          //menampilkan variabel menggunakan widget text
                          Text(this.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(this.description),
                          Text(
                            "Price: " + this.price.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          //menggunakan widget icon dibungkus dengan row
                          Row(
                            children: <Widget>[
                              Row(
                                children: children,
                              )
                            ],
                          )
                        ],
                      )))
            ])));
  }
}
