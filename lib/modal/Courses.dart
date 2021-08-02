class Courses {
  int id;
  String name;
  int accountId;
  String uuid;
  String startAt;
  int gradingStandardId;
  bool isPublic;
  String createdAt;
  String courseCode;
  String defaultView;
  int rootAccountId;
  int enrollmentTermId;
  String license;
  Null gradePassbackSetting;
  String endAt;
  bool publicSyllabus;
  bool publicSyllabusToAuth;
  int storageQuotaMb;
  bool isPublicToAuthUsers;
  bool homeroomCourse;
  Null courseColor;
  bool applyAssignmentGroupWeights;
  Calendar calendar;
  String timeZone;
  bool blueprint;
  bool template;
  List<Enrollments> enrollments;
  bool hideFinalGrades;
  String workflowState;
  bool restrictEnrollmentsToCourseDates;
  String overriddenCourseVisibility;

  Courses(
      {this.id,
      this.name,
      this.accountId,
      this.uuid,
      this.startAt,
      this.gradingStandardId,
      this.isPublic,
      this.createdAt,
      this.courseCode,
      this.defaultView,
      this.rootAccountId,
      this.enrollmentTermId,
      this.license,
      this.gradePassbackSetting,
      this.endAt,
      this.publicSyllabus,
      this.publicSyllabusToAuth,
      this.storageQuotaMb,
      this.isPublicToAuthUsers,
      this.homeroomCourse,
      this.courseColor,
      this.applyAssignmentGroupWeights,
      this.calendar,
      this.timeZone,
      this.blueprint,
      this.template,
      this.enrollments,
      this.hideFinalGrades,
      this.workflowState,
      this.restrictEnrollmentsToCourseDates,
      this.overriddenCourseVisibility});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    accountId = json['account_id'];
    uuid = json['uuid'];
    startAt = json['start_at'];
    gradingStandardId = json['grading_standard_id'];
    isPublic = json['is_public'];
    createdAt = json['created_at'];
    courseCode = json['course_code'];
    defaultView = json['default_view'];
    rootAccountId = json['root_account_id'];
    enrollmentTermId = json['enrollment_term_id'];
    license = json['license'];
    gradePassbackSetting = json['grade_passback_setting'];
    endAt = json['end_at'];
    publicSyllabus = json['public_syllabus'];
    publicSyllabusToAuth = json['public_syllabus_to_auth'];
    storageQuotaMb = json['storage_quota_mb'];
    isPublicToAuthUsers = json['is_public_to_auth_users'];
    homeroomCourse = json['homeroom_course'];
    courseColor = json['course_color'];
    applyAssignmentGroupWeights = json['apply_assignment_group_weights'];
    calendar = json['calendar'] != null
        ? new Calendar.fromJson(json['calendar'])
        : null;
    timeZone = json['time_zone'];
    blueprint = json['blueprint'];
    template = json['template'];
    if (json['enrollments'] != null) {
      enrollments = new List<Enrollments>();
      json['enrollments'].forEach((v) {
        enrollments.add(new Enrollments.fromJson(v));
      });
    }
    hideFinalGrades = json['hide_final_grades'];
    workflowState = json['workflow_state'];
    restrictEnrollmentsToCourseDates =
        json['restrict_enrollments_to_course_dates'];
    overriddenCourseVisibility = json['overridden_course_visibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['account_id'] = this.accountId;
    data['uuid'] = this.uuid;
    data['start_at'] = this.startAt;
    data['grading_standard_id'] = this.gradingStandardId;
    data['is_public'] = this.isPublic;
    data['created_at'] = this.createdAt;
    data['course_code'] = this.courseCode;
    data['default_view'] = this.defaultView;
    data['root_account_id'] = this.rootAccountId;
    data['enrollment_term_id'] = this.enrollmentTermId;
    data['license'] = this.license;
    data['grade_passback_setting'] = this.gradePassbackSetting;
    data['end_at'] = this.endAt;
    data['public_syllabus'] = this.publicSyllabus;
    data['public_syllabus_to_auth'] = this.publicSyllabusToAuth;
    data['storage_quota_mb'] = this.storageQuotaMb;
    data['is_public_to_auth_users'] = this.isPublicToAuthUsers;
    data['homeroom_course'] = this.homeroomCourse;
    data['course_color'] = this.courseColor;
    data['apply_assignment_group_weights'] = this.applyAssignmentGroupWeights;
    if (this.calendar != null) {
      data['calendar'] = this.calendar.toJson();
    }
    data['time_zone'] = this.timeZone;
    data['blueprint'] = this.blueprint;
    data['template'] = this.template;
    if (this.enrollments != null) {
      data['enrollments'] = this.enrollments.map((v) => v.toJson()).toList();
    }
    data['hide_final_grades'] = this.hideFinalGrades;
    data['workflow_state'] = this.workflowState;
    data['restrict_enrollments_to_course_dates'] =
        this.restrictEnrollmentsToCourseDates;
    data['overridden_course_visibility'] = this.overriddenCourseVisibility;
    return data;
  }
}

class Calendar {
  String ics;

  Calendar({this.ics});

  Calendar.fromJson(Map<String, dynamic> json) {
    ics = json['ics'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ics'] = this.ics;
    return data;
  }
}

class Enrollments {
  String type;
  String role;
  int roleId;
  int userId;
  String enrollmentState;
  bool limitPrivilegesToCourseSection;

  Enrollments(
      {this.type,
      this.role,
      this.roleId,
      this.userId,
      this.enrollmentState,
      this.limitPrivilegesToCourseSection});

  Enrollments.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    role = json['role'];
    roleId = json['role_id'];
    userId = json['user_id'];
    enrollmentState = json['enrollment_state'];
    limitPrivilegesToCourseSection = json['limit_privileges_to_course_section'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['role'] = this.role;
    data['role_id'] = this.roleId;
    data['user_id'] = this.userId;
    data['enrollment_state'] = this.enrollmentState;
    data['limit_privileges_to_course_section'] =
        this.limitPrivilegesToCourseSection;
    return data;
  }
}
