class Profile {
  String image, name, country, city;
  int followers, posts, following;

  Profile({
    this.image,
    this.name,
    this.country,
    this.city,
    this.followers,
    this.posts,
    this.following,
  });
}

final List<Profile> profiles = [
  new Profile(
    name: 'Mohsun',
    image: 'images/me.jpg',
    city: 'Tehran',
    country: 'Iran',
    followers: 12,
    following: 30,
    posts: 20,
  ),
  new Profile(
    name: 'Jefer',
    image: 'images/social_media/user0.jpg',
    city: 'Tab',
    country: 'Iran',
    followers: 3,
    following: 44,
    posts: 50,
  ),
  new Profile(
    name: 'Suzi',
    image: 'images/social_media/user2.jpg',
    city: 'Leg',
    country: 'Ou',
    followers: 8,
    following: 39,
    posts: 4,
  ),
];
