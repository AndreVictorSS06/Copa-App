class Selecoes {
  int? id;
  String name;
  String continente;
  String cores;
  int qtdTitulos;

  Selecoes({
    this.id,
    required this.name,
    required this.continente,
    required this.cores,
    required this.qtdTitulos,
  });

  factory Selecoes.fromJson(Map<String, dynamic> json) => Selecoes(
        id: json['id'],
        name: json['name'],
        continente: json['continente'],
        cores: json['cores'],
        qtdTitulos: json['qtdTitulos'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'continente': continente,
        'cores': cores,
        'qtdTitulos': qtdTitulos,
      };
}
