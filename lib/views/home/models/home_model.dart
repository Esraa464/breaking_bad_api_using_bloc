class CharactersModel {
  String name;
  String image;
  String birthDAy;
  String nickname;
  String portrayed;
  String status;

 CharactersModel(
      {this.name,
        this.image,
        this.birthDAy,
        this.nickname,
        this.portrayed,
        this.status});

 CharactersModel.fromJson(Map<String,dynamic>character){
   this.name=character['name'];
   this.image=character['img'];
   this.birthDAy = character['birthday'];
   this.nickname = character['nickname'];
   this.nickname = character['portrayed'];
   this.nickname = character['status'];
 }
}