class Profile {
  final String username;
  final String name;
  final String tagline;
  final String bio;
  final String email;
  final String phone;
  final String linkedin;
  final String github;
  final String twitter;
  final String dribble;

  Profile({
    required this.username,
    required this.name,
    required this.tagline,
    required this.bio,
    required this.email,
    required this.phone,
    required this.linkedin,
    required this.github,
    required this.twitter,
    required this.dribble,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      username: json['username'],
      name: json['name'],
      tagline: json['tagline'],
      bio: json['bio'],
      email: json['email'],
      phone: json['phone'],
      linkedin: json['linkedin'],
      github: json['github'],
      twitter: json['twitter'],
      dribble: json['dribble'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'tagline': tagline,
      'bio': bio,
      'email': email,
      'phone': phone,
      'linkedin': linkedin,
      'github': github,
      'twitter': twitter,
      'dribble': dribble,
    };
  }
}

 final  myProfile = Profile(
  username: "Kratosgado",
  name: "Prince Mbeah Essilfie",
  tagline: "Software Developer",
  bio: "A portfolio websit for Prince Mbeah Essilfie.",
  email: "mbeahessilfieprince@gmail.com",
  phone: "+233599239271",
  linkedin: "https://www.linkedin.com/in/kratosgado",
  github: "https://github.com/Kratosgado",
  twitter: "https://twitter.com/Kratosgado",
  dribble: "https://dribbble.com/Kratosgado",
);
