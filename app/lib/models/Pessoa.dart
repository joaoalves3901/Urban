import 'dart:convert';

List<Pessoa> pessoaFromJson(String str) =>
    List<Pessoa>.from(json.decode(str).map((x) => Pessoa.fromJson(x)));

String pessoaToJson(List<Pessoa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pessoa {
  Pessoa({
    this.pessoaId,
    required this.pessoaNome,
    required this.pessoaMorada,
    required this.pessoaDtnasc,
    required this.pessoaGenero,
    required this.pessoaEmail,
    required this.pessoaPass,
    required this.pessoaTlm,
  });

  int? pessoaId;
  String pessoaNome;
  String pessoaMorada;
  DateTime pessoaDtnasc;
  String pessoaGenero;
  String pessoaEmail;
  String pessoaPass;
  int pessoaTlm;

  factory Pessoa.fromJson(Map<String, dynamic> json) => Pessoa(
        pessoaId: json["pessoa_id"],
        pessoaNome: json["pessoa_nome"],
        pessoaMorada: json["pessoa_morada"],
        pessoaDtnasc: DateTime.parse(json["pessoa_dtnasc"]),
        pessoaGenero: json["pessoa_genero"],
        pessoaEmail: json["pessoa_email"],
        pessoaPass: json["pessoa_pass"],
        pessoaTlm: json["pessoa_tlm"],
      );

  Map<String, dynamic> toJson() => {
        "pessoa_id": pessoaId,
        "pessoa_nome": pessoaNome,
        "pessoa_morada": pessoaMorada,
        "pessoa_dtnasc":
            "${pessoaDtnasc.year.toString().padLeft(4, '0')}-${pessoaDtnasc.month.toString().padLeft(2, '0')}-${pessoaDtnasc.day.toString().padLeft(2, '0')}",
        "pessoa_genero": pessoaGenero,
        "pessoa_email": pessoaEmail,
        "pessoa_pass": pessoaPass,
        "pessoa_tlm": pessoaTlm,
      };
}
