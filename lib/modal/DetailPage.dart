class DetailPage {
  String title;
  String createdAt;
  String url;
  String editingRoles;
  int pageId;
  bool published;
  bool hideFromStudents;
  bool frontPage;
  String htmlUrl;
  Null todoDate;
  String updatedAt;
  bool lockedForUser;
  String body;

  DetailPage(
      {this.title,
      this.createdAt,
      this.url,
      this.editingRoles,
      this.pageId,
      this.published,
      this.hideFromStudents,
      this.frontPage,
      this.htmlUrl,
      this.todoDate,
      this.updatedAt,
      this.lockedForUser,
      this.body});

  DetailPage.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    createdAt = json['created_at'];
    url = json['url'];
    editingRoles = json['editing_roles'];
    pageId = json['page_id'];
    published = json['published'];
    hideFromStudents = json['hide_from_students'];
    frontPage = json['front_page'];
    htmlUrl = json['html_url'];
    todoDate = json['todo_date'];
    updatedAt = json['updated_at'];
    lockedForUser = json['locked_for_user'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['url'] = this.url;
    data['editing_roles'] = this.editingRoles;
    data['page_id'] = this.pageId;
    data['published'] = this.published;
    data['hide_from_students'] = this.hideFromStudents;
    data['front_page'] = this.frontPage;
    data['html_url'] = this.htmlUrl;
    data['todo_date'] = this.todoDate;
    data['updated_at'] = this.updatedAt;
    data['locked_for_user'] = this.lockedForUser;
    data['body'] = this.body;
    return data;
  }
}
