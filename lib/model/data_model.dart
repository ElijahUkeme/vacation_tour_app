
class DataModel{
   String name;
   String description;
   String image;
   int price;
   int people;
   int stars;
   String location;
   DataModel({
     required this.price,
     required this.name,
     required this.description,
     required this.image,
     required this.location,
     required this.people,
     required this.stars
});
   factory DataModel.fromJson(Map<String,dynamic>json){
     return DataModel(
     price: json["price"],
     name: json["name"],
   description: json["description"],
   image: json["image"],
   location: json["location"],
   people: json["people"],
   stars: json["stars"]);
   }
}