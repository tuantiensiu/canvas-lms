class DetailFile {
  int id;
  String uuid;
  int folderId;
  String displayName;
  String filename;
  String uploadStatus;
  String contentType;
  String url;
  int size;
  String createdAt;
  String updatedAt;
  Null unlockAt;
  bool locked;
  bool hidden;
  Null lockAt;
  bool hiddenForUser;
  Null thumbnailUrl;
  String modifiedAt;
  String mimeClass;
  Null mediaEntryId;
  bool lockedForUser;
  String canvadocSessionUrl;
  Null crocodocSessionUrl;

  DetailFile(
      {this.id,
      this.uuid,
      this.folderId,
      this.displayName,
      this.filename,
      this.uploadStatus,
      this.contentType,
      this.url,
      this.size,
      this.createdAt,
      this.updatedAt,
      this.unlockAt,
      this.locked,
      this.hidden,
      this.lockAt,
      this.hiddenForUser,
      this.thumbnailUrl,
      this.modifiedAt,
      this.mimeClass,
      this.mediaEntryId,
      this.lockedForUser,
      this.canvadocSessionUrl,
      this.crocodocSessionUrl});

  DetailFile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    folderId = json['folder_id'];
    displayName = json['display_name'];
    filename = json['filename'];
    uploadStatus = json['upload_status'];
    contentType = json['content-type'];
    url = json['url'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unlockAt = json['unlock_at'];
    locked = json['locked'];
    hidden = json['hidden'];
    lockAt = json['lock_at'];
    hiddenForUser = json['hidden_for_user'];
    thumbnailUrl = json['thumbnail_url'];
    modifiedAt = json['modified_at'];
    mimeClass = json['mime_class'];
    mediaEntryId = json['media_entry_id'];
    lockedForUser = json['locked_for_user'];
    canvadocSessionUrl = json['canvadoc_session_url'];
    crocodocSessionUrl = json['crocodoc_session_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['folder_id'] = this.folderId;
    data['display_name'] = this.displayName;
    data['filename'] = this.filename;
    data['upload_status'] = this.uploadStatus;
    data['content-type'] = this.contentType;
    data['url'] = this.url;
    data['size'] = this.size;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['unlock_at'] = this.unlockAt;
    data['locked'] = this.locked;
    data['hidden'] = this.hidden;
    data['lock_at'] = this.lockAt;
    data['hidden_for_user'] = this.hiddenForUser;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['modified_at'] = this.modifiedAt;
    data['mime_class'] = this.mimeClass;
    data['media_entry_id'] = this.mediaEntryId;
    data['locked_for_user'] = this.lockedForUser;
    data['canvadoc_session_url'] = this.canvadocSessionUrl;
    data['crocodoc_session_url'] = this.crocodocSessionUrl;
    return data;
  }
}
