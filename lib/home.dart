import 'package:flutter/material.dart';

import 'package:http_3/service.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool yukleniyorMu = false;
  TextEditingController kontrol = TextEditingController();
  List<String> listem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: TextFormField(
            style: TextStyle(color: Colors.white),
            controller: kontrol,
            cursorColor: Colors.red,
            cursorHeight: 20.0,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Arama yapınız",
                hintStyle: TextStyle(
                  color: Colors.white,
                )),
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (kontrol.text.isNotEmpty) {
                  setState(() {
                    yukleniyorMu = true;
                  });
                  Service().aramaButonFonk(kontrol.text).then((value) {
                    setState(() {
                      listem = value!.results;
                      yukleniyorMu = false;
                    });
                  });
                }
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: yukleniyorMu == true
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.amber,
              ))
            : GridView.builder(
                itemCount: listem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  var item = listem[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: NetworkImage(item), fit: BoxFit.cover)),
                    ),
                  );
                }));
  }
}
