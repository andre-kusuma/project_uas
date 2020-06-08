import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './akun.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
    });
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Admin"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Andre Kusuma'),
              accountEmail: new Text('andre.kusuma@undiksha.ac.id'),
              currentAccountPicture: new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Akun(),
                  ));
                },
                child: new CircleAvatar(
                  backgroundImage: AssetImage('images/flutter/profil.jpg'),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/flutter/bg_profile.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            new ListTile(
              title: new Text('Logout'),
              trailing: new Icon(Icons.settings),
              onTap: () {
                signOut();
              },
            ),
          ],
        ),
      ),

      /////////////////////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////////////////////
      body: new Column(
        children: <Widget>[
          Image.asset("images/flutter/beranda.jpg"),
          //Setiap bagian pada body dipisahkan container
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            //untuk Membuat tampilan secara horizontal maka digunakan row
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Andre Store',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20
                        ),
                      ),
                      Text(
                        'Singaraja-Buleleng.',
                        style: TextStyle(
                          color: Colors.black,
                        )
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.star,
                    color: Colors.red[500],
                ),
                Text("41"),
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.phone),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "CALL",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    )
                  ],
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.near_me),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "ROUTE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    )
                  ],
                ),
                
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.share),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "SHARE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    )
                  ],
                ),
              ]
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Ini adalah toko jam AndreStore. disini menjual beberapa jam kualitas tinggi '
              'dengan harga yang murah. ',
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
