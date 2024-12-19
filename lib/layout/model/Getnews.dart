class Getnews {
  final int id; // ID berita
  final String title; // Judul berita
  final String body; // Isi berita

  Getnews({required this.id, required this.title, required this.body});

  /// Factory method untuk membuat objek Getnews dari JSON.
  factory Getnews.fromJson(Map<String, dynamic> json) {
    return Getnews(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  /// Mengubah objek Getnews menjadi JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}