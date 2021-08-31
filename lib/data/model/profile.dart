class Profile {
  final String name;
  final String photoURL;
  final String location;

  Profile(this.name, this.photoURL, this.location);
}

final Profile myProfile = Profile(
    "Rajan Karki",
    "https://images.unsplash.com/photo-1573129867134-97739682d386?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80",
    "Cox's Bazar, BD");
