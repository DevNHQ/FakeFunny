class MLeftMenu {
  late String title;
  dynamic icon;
  late String screen;

  MLeftMenu({required this.title,required this.icon, required this.screen});

  MLeftMenu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    screen = json['screen'];
  }
}