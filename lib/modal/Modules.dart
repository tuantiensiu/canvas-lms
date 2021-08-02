class Modules {
  int id;
  String name;
  int position;
  Null unlockAt;
  bool requireSequentialProgress;
  bool publishFinalGrade;
  List<int> prerequisiteModuleIds;
  bool published;
  int itemsCount;
  String itemsUrl;

  Modules(
      {this.id,
      this.name,
      this.position,
      this.unlockAt,
      this.requireSequentialProgress,
      this.publishFinalGrade,
      this.prerequisiteModuleIds,
      this.published,
      this.itemsCount,
      this.itemsUrl});

  Modules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    unlockAt = json['unlock_at'];
    requireSequentialProgress = json['require_sequential_progress'];
    publishFinalGrade = json['publish_final_grade'];
    prerequisiteModuleIds = json['prerequisite_module_ids'].cast<int>();
    published = json['published'];
    itemsCount = json['items_count'];
    itemsUrl = json['items_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    data['unlock_at'] = this.unlockAt;
    data['require_sequential_progress'] = this.requireSequentialProgress;
    data['publish_final_grade'] = this.publishFinalGrade;
    data['prerequisite_module_ids'] = this.prerequisiteModuleIds;
    data['published'] = this.published;
    data['items_count'] = this.itemsCount;
    data['items_url'] = this.itemsUrl;
    return data;
  }
}
