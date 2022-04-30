import 'dart:convert';
import 'package:app/models/Arte.dart';
import 'package:app/models/Pessoa.dart';
import 'package:app/models/Rota.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  /////////// ROTAS
  Future<List<Rota>?> getRotas() async {
    var client = http.Client();

    var uri = Uri.parse('http://192.168.1.69:3000/api/rota');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return rotaFromJson(json);
    }
  }

  /////////// LOGIN
  Future<List<Pessoa>?> Login(String email, String pass) async {
    var client = http.Client();

    Map data = {'email': email, 'password': pass};

    var uri = Uri.parse('http://192.168.1.69:3000/api/pessoas/login');
    final response = await client.post(uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200) {
      Map<String, dynamic> resposne = jsonDecode(response.body);
      if (!resposne['error']) {
        Map<String, dynamic> user = resposne['data'];
        print(" User name ${user['id']}");
      }
    }
  }

  /////////// MARKERS
  Future<List<Arte>?> getArtes() async {
    var client = http.Client();

    var uri = Uri.parse('http://192.168.1.69:3000/api/artes');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return arteFromJson(json);
      /*List<Arte> artes = [];
      var decodedResponse = jsonDecode(response.body);
      decodedResponse.forEach((e) {
        artes.add(Arte.fromJson(e));
      });
      return artes;*/
    }
  }

  Future login(String email, String pass) async {
    final response = await http
        .post(Uri.parse('http://192.168.1.69:3000/api/pessoas/login'), body: {
      'email': email,
      'pass': pass,
    });
    return response.statusCode;
  }
}
