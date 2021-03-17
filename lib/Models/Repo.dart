class Repo {
  int id;
  String name;
  String owner;
  String ownerAvatar;
  int starCount;
  int forksCount;
  int issuesCount;
  bool private;

  Repo(this.id, this.name, this.owner, this.ownerAvatar, this.starCount,
      this.forksCount, this.issuesCount, this.private);
}
