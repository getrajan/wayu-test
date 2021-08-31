class Hotel {
  final String name;
  final String coverPhotoURL;
  final String about;
  final int price;
  final int discount;
  final String category;

  Hotel(
    this.name,
    this.coverPhotoURL,
    this.about,
    this.price,
    this.discount,
    this.category,
  );
}

final List<Hotel> categoryHotels = [
  Hotel(
      "Muscat Holiday Resort",
      "https://cdn.pixabay.com/photo/2015/09/28/21/32/the-palm-962785__340.jpg",
      "This is about of this hotel",
      65,
      23,
      "Modern"),
  Hotel(
      "Capella Ubud, Bali, Indonesia",
      "https://cdn.pixabay.com/photo/2013/04/18/14/39/ship-105596__340.jpg",
      "This is about of this hotel",
      23,
      23,
      "Classic"),
  Hotel(
      "Waldorf Astoria Maldives Ithaafushi",
      "https://cdn.pixabay.com/photo/2017/03/09/06/30/pool-2128578__340.jpg",
      "This is about of this hotel",
      20,
      23,
      "Casino"),
  Hotel(
      "Secret Bay, Portsmouth, Dominica",
      "https://cdn.pixabay.com/photo/2015/07/02/10/29/swimming-828795__340.jpg",
      "This is about of this hotel",
      70,
      23,
      "City"),
];
