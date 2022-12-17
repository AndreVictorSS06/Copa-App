class Jogador {
  int? id;
  int? selecaoid;
  String name;
  double altura;
  int idade;
  int camisa;
  String url;

  Jogador({
    this.id,
    this.selecaoid,
    required this.name,
    required this.altura,
    required this.idade,
    required this.url,
    required this.camisa,
  });

  factory Jogador.fromJson(Map<String, dynamic> json) => Jogador(
        id: json['id'],
        selecaoid: json['selecaoid'],
        name: json['name'],
        camisa: json['camisa'],
        altura: json['altura'],
        idade: json['idade'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'selecaoid': selecaoid,
        'camisa': camisa,
        'name': name,
        'altura': altura,
        'idade': idade,
        'url': url,
      };
}
