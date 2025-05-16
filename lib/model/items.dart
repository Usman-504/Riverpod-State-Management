class Items {
  final int id;
  final String name;
  final bool favorite;

  Items({required this.id, required this.name, required this.favorite});

  Items copyWith({int? id, String? name, bool? favorite}) {
    return Items(
      id: id ?? this.id,
      name: name ?? this.name,
      favorite: favorite ?? this.favorite,
    );
  }
}
