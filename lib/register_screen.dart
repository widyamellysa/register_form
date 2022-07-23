import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<RegisterScreen> {
  List<String> agama = ['Islam', 'Kristen', 'Budha', 'Hindu', 'Konghucu'];
  String nagama = 'Islam';
  int _groupValue1 = 0;

  TextEditingController nama = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Form"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: nama,
                  decoration: InputDecoration(
                      hintText: 'Nama Lengkap',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                ),
                TextFormField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                ),
                TextFormField(
                  controller: alamat,
                  minLines: 3,
                  maxLines: 10,
                  decoration: InputDecoration(
                      hintText: 'Alamat Lengkap',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                        value: 0,
                        groupValue: _groupValue1,
                        onChanged: (int? i) {
                          setState(() {
                            _groupValue1 = i!;
                          });
                        }),
                    const Text('Laki-laki'),
                    Radio(
                        value: 1,
                        groupValue: _groupValue1,
                        onChanged: (int? i) {
                          setState(() {
                            _groupValue1 = i!;
                          });
                        }),
                    const Text('Wanita'),
                  ],
                ),
                const Text(
                  "Agama : ",
                  style: TextStyle(color: Colors.brown, fontSize: 16.0),
                ),
                DropdownButtonFormField(
                    value: nagama,
                    items: agama.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        nagama = value!;
                      });
                    }),
                MaterialButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: const Text("Submit"),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg:
                            "Nama Lengkap : ${nama.text}\nPassword : ${pass.text}\nAlamat Lengkap : ${alamat.text}\nJenis Kelamin : ${(_groupValue1 == 0) ? "Laki-laki" : "Wanita"}\nAgama : $nagama",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        fontSize: 16.0,
                        backgroundColor: Colors.red,
                        textColor: Colors.white);
                  },
                )
              ],
            ),
          )),
    );
  }
}
