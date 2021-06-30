class CalendarEvent {
  String title;
  String description;
  String workflowState;
  String createdAt;
  String updatedAt;
  bool allDay;
  String allDayDate;
  String id;
  String type;
  Assignment assignment;
  String htmlUrl;
  String contextCode;
  String contextName;
  String endAt;
  String startAt;
  String url;

  CalendarEvent(
      {this.title,
      this.description,
      this.workflowState,
      this.createdAt,
      this.updatedAt,
      this.allDay,
      this.allDayDate,
      this.id,
      this.type,
      this.assignment,
      this.htmlUrl,
      this.contextCode,
      this.contextName,
      this.endAt,
      this.startAt,
      this.url});

  CalendarEvent.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    workflowState = json['workflow_state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    allDay = json['all_day'];
    allDayDate = json['all_day_date'];
    id = json['id'];
    type = json['type'];
    assignment = json['assignment'] != null
        ? new Assignment.fromJson(json['assignment'])
        : null;
    htmlUrl = json['html_url'];
    contextCode = json['context_code'];
    contextName = json['context_name'];
    endAt = json['end_at'];
    startAt = json['start_at'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['workflow_state'] = this.workflowState;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['all_day'] = this.allDay;
    data['all_day_date'] = this.allDayDate;
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.assignment != null) {
      data['assignment'] = this.assignment.toJson();
    }
    data['html_url'] = this.htmlUrl;
    data['context_code'] = this.contextCode;
    data['context_name'] = this.contextName;
    data['end_at'] = this.endAt;
    data['start_at'] = this.startAt;
    data['url'] = this.url;
    return data;
  }
}

class Assignment {
  int id;
  String description;
  String dueAt;
  String unlockAt;
  Null lockAt;
  double pointsPossible;
  String gradingType;
  int assignmentGroupId;
  Null gradingStandardId;
  String createdAt;
  String updatedAt;
  bool peerReviews;
  bool automaticPeerReviews;
  int position;
  bool gradeGroupStudentsIndividually;
  bool anonymousPeerReviews;
  Null groupCategoryId;
  bool postToSis;
  bool moderatedGrading;
  bool omitFromFinalGrade;
  bool intraGroupPeerReviews;
  bool anonymousInstructorAnnotations;
  bool anonymousGrading;
  bool gradersAnonymousToGraders;
  int graderCount;
  bool graderCommentsVisibleToGraders;
  Null finalGraderId;
  bool graderNamesVisibleToFinalGrader;
  int allowedAttempts;
  String secureParams;
  int courseId;
  String name;
  List<String> submissionTypes;
  bool hasSubmittedSubmissions;
  bool dueDateRequired;
  int maxNameLength;
  bool inClosedGradingPeriod;
  bool userSubmitted;
  bool isQuizAssignment;
  bool canDuplicate;
  Null originalCourseId;
  Null originalAssignmentId;
  Null originalAssignmentName;
  Null originalQuizId;
  String workflowState;
  bool muted;
  String htmlUrl;
  bool hasOverrides;
  int needsGradingCount;
  bool published;
  bool unpublishable;
  bool onlyVisibleToOverrides;
  bool lockedForUser;
  String submissionsDownloadUrl;
  bool postManually;
  bool anonymizeStudents;
  bool requireLockdownBrowser;

  Assignment(
      {this.id,
      this.description,
      this.dueAt,
      this.unlockAt,
      this.lockAt,
      this.pointsPossible,
      this.gradingType,
      this.assignmentGroupId,
      this.gradingStandardId,
      this.createdAt,
      this.updatedAt,
      this.peerReviews,
      this.automaticPeerReviews,
      this.position,
      this.gradeGroupStudentsIndividually,
      this.anonymousPeerReviews,
      this.groupCategoryId,
      this.postToSis,
      this.moderatedGrading,
      this.omitFromFinalGrade,
      this.intraGroupPeerReviews,
      this.anonymousInstructorAnnotations,
      this.anonymousGrading,
      this.gradersAnonymousToGraders,
      this.graderCount,
      this.graderCommentsVisibleToGraders,
      this.finalGraderId,
      this.graderNamesVisibleToFinalGrader,
      this.allowedAttempts,
      this.secureParams,
      this.courseId,
      this.name,
      this.submissionTypes,
      this.hasSubmittedSubmissions,
      this.dueDateRequired,
      this.maxNameLength,
      this.inClosedGradingPeriod,
      this.userSubmitted,
      this.isQuizAssignment,
      this.canDuplicate,
      this.originalCourseId,
      this.originalAssignmentId,
      this.originalAssignmentName,
      this.originalQuizId,
      this.workflowState,
      this.muted,
      this.htmlUrl,
      this.hasOverrides,
      this.needsGradingCount,
      this.published,
      this.unpublishable,
      this.onlyVisibleToOverrides,
      this.lockedForUser,
      this.submissionsDownloadUrl,
      this.postManually,
      this.anonymizeStudents,
      this.requireLockdownBrowser});

  Assignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    dueAt = json['due_at'];
    unlockAt = json['unlock_at'];
    lockAt = json['lock_at'];
    pointsPossible = json['points_possible'].toDouble();
    gradingType = json['grading_type'];
    assignmentGroupId = json['assignment_group_id'];
    gradingStandardId = json['grading_standard_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    peerReviews = json['peer_reviews'];
    automaticPeerReviews = json['automatic_peer_reviews'];
    position = json['position'];
    gradeGroupStudentsIndividually = json['grade_group_students_individually'];
    anonymousPeerReviews = json['anonymous_peer_reviews'];
    groupCategoryId = json['group_category_id'];
    postToSis = json['post_to_sis'];
    moderatedGrading = json['moderated_grading'];
    omitFromFinalGrade = json['omit_from_final_grade'];
    intraGroupPeerReviews = json['intra_group_peer_reviews'];
    anonymousInstructorAnnotations = json['anonymous_instructor_annotations'];
    anonymousGrading = json['anonymous_grading'];
    gradersAnonymousToGraders = json['graders_anonymous_to_graders'];
    graderCount = json['grader_count'];
    graderCommentsVisibleToGraders = json['grader_comments_visible_to_graders'];
    finalGraderId = json['final_grader_id'];
    graderNamesVisibleToFinalGrader =
        json['grader_names_visible_to_final_grader'];
    allowedAttempts = json['allowed_attempts'];
    secureParams = json['secure_params'];
    courseId = json['course_id'];
    name = json['name'];
    submissionTypes = json['submission_types'].cast<String>();
    hasSubmittedSubmissions = json['has_submitted_submissions'];
    dueDateRequired = json['due_date_required'];
    maxNameLength = json['max_name_length'];
    inClosedGradingPeriod = json['in_closed_grading_period'];
    userSubmitted = json['user_submitted'];
    isQuizAssignment = json['is_quiz_assignment'];
    canDuplicate = json['can_duplicate'];
    originalCourseId = json['original_course_id'];
    originalAssignmentId = json['original_assignment_id'];
    originalAssignmentName = json['original_assignment_name'];
    originalQuizId = json['original_quiz_id'];
    workflowState = json['workflow_state'];
    muted = json['muted'];
    htmlUrl = json['html_url'];
    hasOverrides = json['has_overrides'];
    needsGradingCount = json['needs_grading_count'];
    published = json['published'];
    unpublishable = json['unpublishable'];
    onlyVisibleToOverrides = json['only_visible_to_overrides'];
    lockedForUser = json['locked_for_user'];
    submissionsDownloadUrl = json['submissions_download_url'];
    postManually = json['post_manually'];
    anonymizeStudents = json['anonymize_students'];
    requireLockdownBrowser = json['require_lockdown_browser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['due_at'] = this.dueAt;
    data['unlock_at'] = this.unlockAt;
    data['lock_at'] = this.lockAt;
    data['points_possible'] = this.pointsPossible;
    data['grading_type'] = this.gradingType;
    data['assignment_group_id'] = this.assignmentGroupId;
    data['grading_standard_id'] = this.gradingStandardId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['peer_reviews'] = this.peerReviews;
    data['automatic_peer_reviews'] = this.automaticPeerReviews;
    data['position'] = this.position;
    data['grade_group_students_individually'] =
        this.gradeGroupStudentsIndividually;
    data['anonymous_peer_reviews'] = this.anonymousPeerReviews;
    data['group_category_id'] = this.groupCategoryId;
    data['post_to_sis'] = this.postToSis;
    data['moderated_grading'] = this.moderatedGrading;
    data['omit_from_final_grade'] = this.omitFromFinalGrade;
    data['intra_group_peer_reviews'] = this.intraGroupPeerReviews;
    data['anonymous_instructor_annotations'] =
        this.anonymousInstructorAnnotations;
    data['anonymous_grading'] = this.anonymousGrading;
    data['graders_anonymous_to_graders'] = this.gradersAnonymousToGraders;
    data['grader_count'] = this.graderCount;
    data['grader_comments_visible_to_graders'] =
        this.graderCommentsVisibleToGraders;
    data['final_grader_id'] = this.finalGraderId;
    data['grader_names_visible_to_final_grader'] =
        this.graderNamesVisibleToFinalGrader;
    data['allowed_attempts'] = this.allowedAttempts;
    data['secure_params'] = this.secureParams;
    data['course_id'] = this.courseId;
    data['name'] = this.name;
    data['submission_types'] = this.submissionTypes;
    data['has_submitted_submissions'] = this.hasSubmittedSubmissions;
    data['due_date_required'] = this.dueDateRequired;
    data['max_name_length'] = this.maxNameLength;
    data['in_closed_grading_period'] = this.inClosedGradingPeriod;
    data['user_submitted'] = this.userSubmitted;
    data['is_quiz_assignment'] = this.isQuizAssignment;
    data['can_duplicate'] = this.canDuplicate;
    data['original_course_id'] = this.originalCourseId;
    data['original_assignment_id'] = this.originalAssignmentId;
    data['original_assignment_name'] = this.originalAssignmentName;
    data['original_quiz_id'] = this.originalQuizId;
    data['workflow_state'] = this.workflowState;
    data['muted'] = this.muted;
    data['html_url'] = this.htmlUrl;
    data['has_overrides'] = this.hasOverrides;
    data['needs_grading_count'] = this.needsGradingCount;
    data['published'] = this.published;
    data['unpublishable'] = this.unpublishable;
    data['only_visible_to_overrides'] = this.onlyVisibleToOverrides;
    data['locked_for_user'] = this.lockedForUser;
    data['submissions_download_url'] = this.submissionsDownloadUrl;
    data['post_manually'] = this.postManually;
    data['anonymize_students'] = this.anonymizeStudents;
    data['require_lockdown_browser'] = this.requireLockdownBrowser;
    return data;
  }
}
