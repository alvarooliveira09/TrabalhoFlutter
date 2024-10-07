
class ViaCepModel {

  // Validação do CEP (https://viacep.com.br):

  // Quando consultado um CEP de formato válido, porém inexistente,
  // o retorno conterá um valor de "erro" igual a "true".

  // Quando consultado um CEP de formato inválido,
  // o código de retorno da consulta será um 400 (Bad Request).

  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? regiao;
  final bool erro;

  ViaCepModel({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.regiao,
    this.erro = false,
  });


  //https://blog.logrocket.com/implementing-repository-pattern-flutter
  //https://mixable.blog/flutter-generating-g-dart-files-for-json-serialization

  factory ViaCepModel.fromMap(Map<String, dynamic> data) {
    return ViaCepModel(
      cep: data['cep'],
      logradouro: data['logradouro'],
      complemento: data['complemento'],
      bairro: data['bairro'],
      localidade: data['localidade'],
      uf: data['uf'],
      regiao: data['regiao'],
      erro: false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'regiao': regiao,
      'erro': erro,
    };
  }
}
