class ModuleItems {
  int id;
  String title;
  int position;
  int indent;
  bool quizLti;
  String type;
  int moduleId;
  String htmlUrl;
  int contentId;
  String url;
  bool published;

  ModuleItems(
      {this.id,
      this.title,
      this.position,
      this.indent,
      this.quizLti,
      this.type,
      this.moduleId,
      this.htmlUrl,
      this.contentId,
      this.url,
      this.published});

  ModuleItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    position = json['position'];
    indent = json['indent'];
    quizLti = json['quiz_lti'];
    type = json['type'];
    moduleId = json['module_id'];
    htmlUrl = json['html_url'];
    contentId = json['content_id'];
    url = json['url'];
    published = json['published'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['position'] = this.position;
    data['indent'] = this.indent;
    data['quiz_lti'] = this.quizLti;
    data['type'] = this.type;
    data['module_id'] = this.moduleId;
    data['html_url'] = this.htmlUrl;
    data['content_id'] = this.contentId;
    data['url'] = this.url;
    data['published'] = this.published;
    return data;
  }
}
