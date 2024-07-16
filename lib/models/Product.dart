class Product{
  final int id;
  final String name;
  final String barcode;
  final String description;
  final double price;
  final int quantity;
  final String imagePath;

  Product({required this.id,
    required this.name,
    required this.barcode,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imagePath
  });

  factory Product.fromJson(Map<String, dynamic> json) { //"dynamic" identifica un tipo generico (T in java)
    return Product(
      id: json['id'],
      name: json['nome'],
      barcode: json['barCode'],
      description: json['descrizione'],
      price: json['prezzo'],
      quantity: json['quantita'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': name,
    'barCode': barcode,
    'descrizione': description,
    'prezzo': price,
    'quantita': quantity,
    'imagePath': imagePath,
  };

  @override
  String toString() {
    return ("{nome: "+name+", barcode: "+barcode+"}");
  }

}