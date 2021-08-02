class Dashboard {
  String longName;
  String shortName;
  String originalName;
  String courseCode;
  String assetString;
  String href;
  String term;
  String subtitle;
  String enrollmentState;
  String enrollmentType;
  Null observee;
  int id;
  bool isFavorited;
  bool isHomeroom;
  bool canManage;
  String image;
  Null color;
  Null position;
  bool published;
  List<Links> links;
  bool canChangeCoursePublishState;
  String defaultView;
  String pagesUrl;
  String frontPageTitle;

  Dashboard(
      {this.longName,
      this.shortName,
      this.originalName,
      this.courseCode,
      this.assetString,
      this.href,
      this.term,
      this.subtitle,
      this.enrollmentState,
      this.enrollmentType,
      this.observee,
      this.id,
      this.isFavorited,
      this.isHomeroom,
      this.canManage,
      this.image,
      this.color,
      this.position,
      this.published,
      this.links,
      this.canChangeCoursePublishState,
      this.defaultView,
      this.pagesUrl,
      this.frontPageTitle});

  Dashboard.fromJson(Map<String, dynamic> json) {
    longName = json['longName'];
    shortName = json['shortName'];
    originalName = json['originalName'];
    courseCode = json['courseCode'];
    assetString = json['assetString'];
    href = json['href'];
    term = json['term'];
    subtitle = json['subtitle'];
    enrollmentState = json['enrollmentState'];
    enrollmentType = json['enrollmentType'];
    observee = json['observee'];
    id = json['id'];
    isFavorited = json['isFavorited'];
    isHomeroom = json['isHomeroom'];
    canManage = json['canManage'];
    image = json['image'];
    color = json['color'];
    position = json['position'];
    published = json['published'];
    if (json['links'] != null) {
      links = new List<Links>();
      json['links'].forEach((v) {
        links.add(new Links.fromJson(v));
      });
    }
    canChangeCoursePublishState = json['canChangeCoursePublishState'];
    defaultView = json['defaultView'];
    pagesUrl = json['pagesUrl'];
    frontPageTitle = json['frontPageTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longName'] = this.longName;
    data['shortName'] = this.shortName;
    data['originalName'] = this.originalName;
    data['courseCode'] = this.courseCode;
    data['assetString'] = this.assetString;
    data['href'] = this.href;
    data['term'] = this.term;
    data['subtitle'] = this.subtitle;
    data['enrollmentState'] = this.enrollmentState;
    data['enrollmentType'] = this.enrollmentType;
    data['observee'] = this.observee;
    data['id'] = this.id;
    data['isFavorited'] = this.isFavorited;
    data['isHomeroom'] = this.isHomeroom;
    data['canManage'] = this.canManage;
    data['image'] = this.image;
    data['color'] = this.color;
    data['position'] = this.position;
    data['published'] = this.published;
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }
    data['canChangeCoursePublishState'] = this.canChangeCoursePublishState;
    data['defaultView'] = this.defaultView;
    data['pagesUrl'] = this.pagesUrl;
    data['frontPageTitle'] = this.frontPageTitle;
    return data;
  }
}

class Links {
  String cssClass;
  String icon;
  bool hidden;
  String path;
  String label;

  Links({this.cssClass, this.icon, this.hidden, this.path, this.label});

  Links.fromJson(Map<String, dynamic> json) {
    cssClass = json['css_class'];
    icon = json['icon'];
    hidden = json['hidden'];
    path = json['path'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['css_class'] = this.cssClass;
    data['icon'] = this.icon;
    data['hidden'] = this.hidden;
    data['path'] = this.path;
    data['label'] = this.label;
    return data;
  }
}
