import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igs_online/action/password-input.dart';
import 'package:igs_online/login.dart';
import 'package:igs_online/widgets/backgroundImage.dart';
import 'package:igs_online/style.dart';
import 'package:igs_online/widgets/styleButton.dart';
import 'action/text-input.dart';
import 'package:http/http.dart' as http;


class halamanRegister extends StatefulWidget {
  const halamanRegister({super.key});

  @override
  State<halamanRegister> createState() => _halamanRegisterState();
}


class _halamanRegisterState extends State<halamanRegister> {

  bool hide1 = true, hide2 = true;
  TextEditingController idCtrlReg = TextEditingController();
  TextEditingController usernameCtrlReg = TextEditingController();
  TextEditingController passwordCtrlReg = TextEditingController();
  TextEditingController konfPasswordCtrlReg = TextEditingController();
  List levelAcc = <String>[
    'Kepala Sekolah',
    'Guru',
    'Wali Siswa',
  ];
  String dropdownValue = 'Guru';

  //method menyimpan akun ke database
  Future insertAcc() async {
    try {
      String uri ="http://10.117.84.89/simigs/insertAcc.php";
      var res = await http.post(
          Uri.parse(uri),
          body: {
            "id" : idCtrlReg.text.trim(),
            "name" : usernameCtrlReg.text.trim(),
            "password" : passwordCtrlReg.text.trim(),
            "levelAcc" : dropdownValue.toString(),
      });
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("Pendaftaran Akun berhasil");
      }
      else {
        print("Pendaftaran Akun gagal");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    idCtrlReg.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget okButton = TextButton(
        onPressed: () {
          idCtrlReg.text = "";
          usernameCtrlReg.text = "";
          passwordCtrlReg.text = "";
          konfPasswordCtrlReg.text = "";
          Navigator.pop(context,'OK');
        },
        child: Text("OK")
    );

    // Widget loginButton = TextButton(
    //     onPressed: () {
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => halamanLogin())
    //       );
    //     },
    //     child: Text("Login")
    // );

    return Stack(
      children: [
        backgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Center(
                      child: Text("DAFTAR AKUN",
                          style: header2, textAlign: TextAlign.center),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextInput(
                          usernameCtrl: idCtrlReg,
                          icon: FontAwesomeIcons.solidIdBadge,
                          hint: 'Masukkan ID',
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                        ), //memanggil method input text email
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextInput(
                          usernameCtrl: usernameCtrlReg,
                          icon: FontAwesomeIcons.at,
                          hint: 'Masukkan Nama',
                          inputType: TextInputType.name,
                          inputAction: TextInputAction.next,
                        ),
                        //memanggil method input text email  //memanggil method input text email
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextField(
                          controller: passwordCtrlReg,
                          obscureText: hide1,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                25 //mengatur padding tulisan dalam inputbox
                            ),
                            fillColor: Colors.grey.withOpacity(0.3),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                BorderSide(style: BorderStyle.none)),
                            hintText: 'Masukan Password',
                            hintStyle: txst_hint,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10 //mengatur padding icon gembok
                              ),
                              child: Icon(
                                FontAwesomeIcons.key,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            suffixIcon: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  hide1 = !hide1;
                                  hide2 = hide2;
                                });
                              },
                              icon: hide1
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                            filled: true,
                          ),
                          style: txst_input,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                        // PasswordInput(
                        //   passwordCtrl: passwordCtrlReg,
                        //   hide: true,
                        //   icon: FontAwesomeIcons.key,
                        //   hint: 'Masukan Password',
                        //   inputType: TextInputType.text,
                        //   inputAction: TextInputAction.next,
                        // ),  //memanggil method input password
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextField(
                          controller: konfPasswordCtrlReg,
                          obscureText: hide2,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                25 //mengatur padding tulisan dalam inputbox
                            ),
                            fillColor: Colors.grey.withOpacity(0.3),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                BorderSide(style: BorderStyle.none)),
                            hintText: 'Konfirmasi Password',
                            hintStyle: txst_hint,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10 //mengatur padding icon gembok
                              ),
                              child: Icon(
                                FontAwesomeIcons.key,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            suffixIcon: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  hide1 = hide1;
                                  hide2 = !hide2;
                                });
                              },
                              icon: hide2
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                            filled: true,
                          ),
                          style: txst_input,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                        // PasswordInput(
                        //   passwordCtrl: konpasswordCtrlReg,
                        //   hide: true,
                        //   icon: FontAwesomeIcons.key,
                        //   hint: 'Konfirmasi Password',
                        //   inputType: TextInputType.text,
                        //   inputAction: TextInputAction.done,
                        // ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            children: [
                              DropdownButtonFormField(
                                iconSize: 0.0,
                                items: levelAcc.map(
                                        (e) => DropdownMenuItem(child: Text(e), value: e,)
                                ).toList(),
                                value: levelAcc.first,
                                onChanged: (val) {
                                  setState(() {
                                    dropdownValue = val as String;
                                  });
                                },
                                dropdownColor: Colors.grey.withOpacity(0.3),
                                style: txst_input,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical:
                                      25 //mengatur padding tulisan dalam inputbox
                                  ),
                                  fillColor: Colors.grey.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                      BorderSide(style: BorderStyle.none)),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10 //mengatur padding icon gembok
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.person,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  // icon: const Icon(
                                  //     FontAwesomeIcons.arrowDown19,
                                  //     color: Colors.white,
                                  // )
                                  suffixIcon: const Icon(
                                    FontAwesomeIcons.circleArrowDown,
                                    color: Colors.white,

                                  ),
                                ),
                              )
                              // DropdownButton(
                              //     items: levelAcc.map(
                              //             (e) => DropdownMenuItem(child: Text(e), value: e,)
                              //     ).toList(),
                              //     onChanged: (val) {
                              //       setState(() {
                              //         dropdownValue = val as String;
                              //       });
                              //     },
                              //   dropdownColor: Colors.grey.withOpacity(0.3),
                              //   style: txst_input,
                              // )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        //tombol daftar
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          width: double.infinity,
                          //padding: EdgeInsets.all(5), //mengatur tinggi tombol
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(16)),
                          child: TextButton(
                            onPressed: () {
                              Map<String, dynamic> data = {
                                'userId' : idCtrlReg.text.trim(),
                                'name' : usernameCtrlReg.text.trim(),
                                'password' : passwordCtrlReg.text.trim(),
                                'levelAcc' : dropdownValue.toString(),
                              };
                              if (idCtrlReg.text.trim() == '' && usernameCtrlReg.text.trim() == '' && passwordCtrlReg.text.trim() =='' ) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Data belum diisi"),
                                        content: Text("Silahkan isi semua data terlebih dahulu"),
                                    );
                                  });
                              }
                              else if (idCtrlReg.text.trim() == '' || usernameCtrlReg.text.trim() == '' || passwordCtrlReg.text.trim() =='' || dropdownValue.toString() == '')  {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Ada data yang Kosong"),
                                        content: Text("Ada data yang belum diketik.\nCek kembali isian Anda"),
                                      );
                                    });
                              }
                              else {
                                if (passwordCtrlReg.text.trim() == konfPasswordCtrlReg.text.trim()) {
                                  //memanggil method insertAcc untuk menyimpan data akun yang didaftarkan
                                  insertAcc();
                                  showDialog(
                                      context: context,
                                      builder: (context)  {
                                        return AlertDialog(
                                          title: Text("Akun telah dibuat"),
                                          content: Text("Akun yang dibuat :\n"
                                              + idCtrlReg.text.trim() +"\n"
                                              + usernameCtrlReg.text.trim() +"\n"
                                              + passwordCtrlReg.text.trim() +"\n"
                                              + dropdownValue.toString() +"\n"
                                          ),
                                          actions: [
                                            okButton,
                                          ],
                                        );
                                      });

                                  // idCtrlReg.text = "";
                                  // usernameCtrlReg.text = "";
                                  // passwordCtrlReg.text = "";
                                  // konfPasswordCtrlReg.text = "";
                                  //memanggil halaman login
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => halamanLogin())
                                  // );
                                }
                                else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Password Tidak Cocok"),
                                          content: Text("Password yang dimasukan tidak sama\nCek kembali Password Anda"),
                                        );
                                      });
                                }
                              }
                            },
                            child: Text(
                              'DAFTAR',
                              style: GoogleFonts.bebasNeue(
                                  textStyle: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  letterSpacing: 7),
                            ),
                          ),
                        ),

                        // StyleButton(
                        //   textButton: 'Daftar',
                        //   buttonColor: Colors.lightBlue,
                        //
                        // )   //memanggil method
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
