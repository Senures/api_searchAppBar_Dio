import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
    Model({
        required this.imageName,
        required this.results,
    });

    String imageName;
    List<String> results;

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        imageName: json["image_name"],
        results: List<String>.from(json["results"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "image_name": imageName,
        "results": List<dynamic>.from(results.map((x) => x)),
    };
}
