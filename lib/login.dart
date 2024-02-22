import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igs_online/register.dart';
import 'package:igs_online/style.dart';
import 'package:igs_online/widgets/styleButton.dart';
import '../widgets/widgets.dart';
import 'action/password-input.dart';
import 'action/text-input.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;


class halamanLogin extends StatefulWidget {

  const halamanLogin({super.key});

  @override
  State<halamanLogin> createState() => _halamanLoginState();

}

class _halamanLoginState extends State<halamanLogin>{

  bool loginState = false;
  bool hide = true;

  TextEditingController idCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  // String username;


  @override
  Widget build(BuildContext context) {

    Widget okButton = TextButton(
        onPressed: () {
          Navigator.pop(context,'OK');
        },
        child: Text("OK")
    );


    Future readAkun() async {
      try {
        String uri ="http://10.117.84.89/simigs/getData.php";
        var res = await http.post(
            Uri.parse(uri),
            body: {
              "id" : idCtrl.text.trim(),
              "password" : passwordCtrl.text.trim(),
            });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Baca Data Berhasil");
          return loginState = true;
        }
        else {
          print("Baca Data gagal");
          return loginState = false;
        }
      } catch (e) {
        print(e);
      }
    }

    return Stack(
        children: [
          backgroundImage(), //mengatur background foto dengan memanggil method
          Scaffold(
            backgroundColor: Colors.transparent,
            body:
            SafeArea(
              child: SingleChildScrollView(
                child: Column (
                  children: [
                    Container(
                      height: 300,
                      child: Center(
                        child: Text(
                          "SISTEM INFORMASI\nIGS",
                          style: header,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30
                      ),
                      child:
                      Column (
                        children: [
                          TextInput(
                              usernameCtrl: idCtrl,
                              icon: FontAwesomeIcons.solidIdBadge,
                              hint: "Masukan ID Anda",
                              inputType: TextInputType.number,
                              inputAction: TextInputAction.next
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30
                      ),
                      child:
                      Column (
                        children: [
                          TextField(
                            controller: passwordCtrl,
                            obscureText: hide,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 25
                              ),
                              fillColor: Colors.grey.withOpacity(0.3),
                              border: OutlineInputBorder (
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide (
                                  style: BorderStyle.none
                                )
                              ),
                              hintText: 'Masukan Password',
                              hintStyle: txst_hint,
                              prefixIcon:
                                Padding (
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10
                                  ),
                                  child:
                                  Icon(
                                    FontAwesomeIcons.key,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              suffixIcon:
                                IconButton (
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      hide = !hide;
                                    });
                                  }, icon: hide ? Icon(Icons.visibility):Icon(Icons.visibility_off),
                                ),
                                filled: true
                            ),
                            style: txst_input,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Layanan Lupa Password"),
                                      content: Text("Bagi Bapak/Ibu yang lupa Password, \nBisa menghubungi Admin untuk proses reset Password"),
                                        actions: [okButton],
                                    );
                                  }
                              );
                            },
                            child:
                            Text('Lupa Password ?', style: txst_input_blue,),
                          ),
                          SizedBox(
                            height: 15
                          ),
                          Container(
                            width: double.infinity,
                            decoration:
                            BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child:
                            TextButton (
                              onPressed: () {
                                Map<String,dynamic> data = {
                                  'userId' : idCtrl.text.trim(),
                                  'password' : passwordCtrl.text.trim(),
                                };
                                if (idCtrl.text.trim() == '' || passwordCtrl.text.trim() == '' ) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("ID/Password belum diisi"),
                                          content: Text("Silahkan isi semua data terlebih dahulu"),
                                          actions: [
                                            okButton,
                                          ],
                                        );
                                      });
                                }
                                else if (idCtrl.text.trim() != '' && passwordCtrl.text.trim() != ''){
                                  readAkun();
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Coba Login"),
                                          content: Text("Selamat datang, " +loginState.toString()
                                              + idCtrl.text.trim() +"\n"
                                              + passwordCtrl.text.trim()
                                          ),
                                          actions: [
                                            okButton,

                                          ],
                                        );
                                      });
                                }
                              },
                              child:
                              Text(
                                'MASUK',
                                style: GoogleFonts.bebasNeue(
                                    textStyle: txst_button
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Belum punya akun ? ',
                                  style: txst_input
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => halamanRegister()));
                                },
                                child: Text(
                                  'Daftar Sekarang',
                                  style: txst_input_blue,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
          ]
    );
  }

}





