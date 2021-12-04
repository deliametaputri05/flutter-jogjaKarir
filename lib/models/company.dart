part of 'models.dart';

class Company {
  int id;
  User user;
  String name;
  String picturePath;
  String desc;
  String website;
  String email;
  String category;
  String location;
  int foundedYear;

  Company(
      {this.id,
      this.user,
      this.name,
      this.picturePath,
      this.desc,
      this.website,
      this.email,
      this.category,
      this.location,
      this.foundedYear});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    website = json['website'];
    email = json['email'];
    category = json['category'];
    location = json['location'];
    picturePath = json['picturePath'];
    foundedYear = json['founded_year'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'website': website,
      'email': email,
      'category': category,
      'location': location,
      'picturePath': picturePath,
      'founded_year': foundedYear,
    };
  }
}

  // Company copyWith({
  //   int id,
  //   String name,
  //   String desc,
  //   String website,
  //   String email,
  //   String category,
  //   String location,
  //   String foundedYear,
  //   String picturePath,
  // }) =>
  //     Company(
  //         id: id ?? this.id,
  //         name: name ?? this.name,
  //         desc: desc ?? this.desc,
  //         website: website ?? this.website,
  //         email: email ?? this.email,
  //         category: category ?? this.category,
  //         foundedYear: foundedYear ?? this.foundedYear,
  //         picturePath: picturePath ?? this.picturePath);

  // @override
  // List<Object> get props => [
  //       id,
  //       name,
  //       desc,
  //       website,
  //       email,
  //       category,
  //       foundedYear,
  //       picturePath,
  //     ];
// }
