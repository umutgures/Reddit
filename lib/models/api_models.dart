// To parse this JSON data, do
//
//     final reddit = redditFromJson(jsonString);

import 'dart:convert';

Reddit redditFromJson(String str) => Reddit.fromJson(json.decode(str));

String redditToJson(Reddit data) => json.encode(data.toJson());

class Reddit {
  Reddit({
    this.kind,
    this.data,
  });

  String kind;
  RedditData data;

  factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
    kind: json["kind"],
    data: RedditData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "data": data.toJson(),
  };
}

class RedditData {
  RedditData({
    this.modhash,
    this.dist,
    this.children,
    this.after,
    this.before,
  });

  String modhash;
  int dist;
  List<Child> children;
  dynamic after;
  String before;

  factory RedditData.fromJson(Map<String, dynamic> json) => RedditData(
    modhash: json["modhash"],
    dist: json["dist"],
    children: List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
    after: json["after"],
    before: json["before"],
  );

  Map<String, dynamic> toJson() => {
    "modhash": modhash,
    "dist": dist,
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
    "after": after,
    "before": before,
  };
}

class Child {
  Child({
    this.kind,
    this.data,
  });

  String kind;
  ChildData data;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    kind: json["kind"],
    data: ChildData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "data": data.toJson(),
  };
}

class ChildData {
  ChildData({
    this.approvedAtUtc,
    this.subreddit,
    this.selftext,
    this.authorFullname,
    this.saved,
    this.modReasonTitle,
    this.gilded,
    this.clicked,
    this.title,
    this.linkFlairRichtext,
    this.subredditNamePrefixed,
    this.hidden,
    this.pwls,
    this.linkFlairCssClass,
    this.downs,
    this.thumbnailHeight,
    this.topAwardedType,
    this.hideScore,
    this.name,
    this.quarantine,
    this.linkFlairTextColor,
    this.upvoteRatio,
    this.authorFlairBackgroundColor,
    this.subredditType,
    this.ups,
    this.totalAwardsReceived,
    this.mediaEmbed,
    this.thumbnailWidth,
    this.authorFlairTemplateId,
    this.isOriginalContent,
    this.userReports,
    this.secureMedia,
    this.isRedditMediaDomain,
    this.isMeta,
    this.category,
    this.secureMediaEmbed,
    this.linkFlairText,
    this.canModPost,
    this.score,
    this.approvedBy,
    this.authorPremium,
    this.thumbnail,
    this.edited,
    this.authorFlairCssClass,
    this.authorFlairRichtext,
    this.gildings,
    this.postHint,
    this.contentCategories,
    this.isSelf,
    this.modNote,
    this.created,
    this.linkFlairType,
    this.wls,
    this.removedByCategory,
    this.bannedBy,
    this.authorFlairType,
    this.domain,
    this.allowLiveComments,
    this.selftextHtml,
    this.likes,
    this.suggestedSort,
    this.bannedAtUtc,
    this.urlOverriddenByDest,
    this.viewCount,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
    this.preview,
    this.allAwardings,
    this.awarders,
    this.mediaOnly,
    this.linkFlairTemplateId,
    this.canGild,
    this.spoiler,
    this.locked,
    this.authorFlairText,
    this.treatmentTags,
    this.visited,
    this.removedBy,
    this.numReports,
    this.distinguished,
    this.subredditId,
    this.modReasonBy,
    this.removalReason,
    this.linkFlairBackgroundColor,
    this.id,
    this.isRobotIndexable,
    this.reportReasons,
    this.author,
    this.discussionType,
    this.numComments,
    this.sendReplies,
    this.whitelistStatus,
    this.contestMode,
    this.modReports,
    this.authorPatreonFlair,
    this.authorFlairTextColor,
    this.permalink,
    this.parentWhitelistStatus,
    this.stickied,
    this.url,
    this.subredditSubscribers,
    this.createdUtc,
    this.numCrossposts,
    this.media,
    this.isVideo,
  });

  dynamic approvedAtUtc;
  String subreddit;
  String selftext;
  String authorFullname;
  bool saved;
  dynamic modReasonTitle;
  int gilded;
  bool clicked;
  String title;
  List<dynamic> linkFlairRichtext;
  String subredditNamePrefixed;
  bool hidden;
  int pwls;
  String linkFlairCssClass;
  int downs;
  int thumbnailHeight;
  dynamic topAwardedType;
  bool hideScore;
  String name;
  bool quarantine;
  String linkFlairTextColor;
  double upvoteRatio;
  String authorFlairBackgroundColor;
  String subredditType;
  int ups;
  int totalAwardsReceived;
  MediaEmbed mediaEmbed;
  int thumbnailWidth;
  dynamic authorFlairTemplateId;
  bool isOriginalContent;
  List<dynamic> userReports;
  Media secureMedia;
  bool isRedditMediaDomain;
  bool isMeta;
  dynamic category;
  MediaEmbed secureMediaEmbed;
  String linkFlairText;
  bool canModPost;
  int score;
  dynamic approvedBy;
  bool authorPremium;
  String thumbnail;
  dynamic edited;
  String authorFlairCssClass;
  List<dynamic> authorFlairRichtext;
  Gildings gildings;
  String postHint;
  dynamic contentCategories;
  bool isSelf;
  dynamic modNote;
  double created;
  String linkFlairType;
  int wls;
  dynamic removedByCategory;
  dynamic bannedBy;
  String authorFlairType;
  String domain;
  bool allowLiveComments;
  String selftextHtml;
  dynamic likes;
  dynamic suggestedSort;
  dynamic bannedAtUtc;
  String urlOverriddenByDest;
  dynamic viewCount;
  bool archived;
  bool noFollow;
  bool isCrosspostable;
  bool pinned;
  bool over18;
  Preview preview;
  List<AllAwarding> allAwardings;
  List<dynamic> awarders;
  bool mediaOnly;
  String linkFlairTemplateId;
  bool canGild;
  bool spoiler;
  bool locked;
  String authorFlairText;
  List<dynamic> treatmentTags;
  bool visited;
  dynamic removedBy;
  dynamic numReports;
  dynamic distinguished;
  String subredditId;
  dynamic modReasonBy;
  dynamic removalReason;
  String linkFlairBackgroundColor;
  String id;
  bool isRobotIndexable;
  dynamic reportReasons;
  String author;
  dynamic discussionType;
  int numComments;
  bool sendReplies;
  String whitelistStatus;
  bool contestMode;
  List<dynamic> modReports;
  bool authorPatreonFlair;
  String authorFlairTextColor;
  String permalink;
  String parentWhitelistStatus;
  bool stickied;
  String url;
  int subredditSubscribers;
  double createdUtc;
  int numCrossposts;
  Media media;
  bool isVideo;

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
    approvedAtUtc: json["approved_at_utc"],
    subreddit: json["subreddit"],
    selftext: json["selftext"],
    authorFullname: json["author_fullname"],
    saved: json["saved"],
    modReasonTitle: json["mod_reason_title"],
    gilded: json["gilded"],
    clicked: json["clicked"],
    title: json["title"],
    linkFlairRichtext: List<dynamic>.from(json["link_flair_richtext"].map((x) => x)),
    subredditNamePrefixed: json["subreddit_name_prefixed"],
    hidden: json["hidden"],
    pwls: json["pwls"],
    linkFlairCssClass: json["link_flair_css_class"],
    downs: json["downs"],
    thumbnailHeight: json["thumbnail_height"] == null ? null : json["thumbnail_height"],
    topAwardedType: json["top_awarded_type"],
    hideScore: json["hide_score"],
    name: json["name"],
    quarantine: json["quarantine"],
    linkFlairTextColor: json["link_flair_text_color"],
    upvoteRatio: json["upvote_ratio"].toDouble(),
    authorFlairBackgroundColor: json["author_flair_background_color"],
    subredditType: json["subreddit_type"],
    ups: json["ups"],
    totalAwardsReceived: json["total_awards_received"],
    mediaEmbed: MediaEmbed.fromJson(json["media_embed"]),
    thumbnailWidth: json["thumbnail_width"] == null ? null : json["thumbnail_width"],
    authorFlairTemplateId: json["author_flair_template_id"],
    isOriginalContent: json["is_original_content"],
    userReports: List<dynamic>.from(json["user_reports"].map((x) => x)),
    secureMedia: json["secure_media"] == null ? null : Media.fromJson(json["secure_media"]),
    isRedditMediaDomain: json["is_reddit_media_domain"],
    isMeta: json["is_meta"],
    category: json["category"],
    secureMediaEmbed: MediaEmbed.fromJson(json["secure_media_embed"]),
    linkFlairText: json["link_flair_text"],
    canModPost: json["can_mod_post"],
    score: json["score"],
    approvedBy: json["approved_by"],
    authorPremium: json["author_premium"],
    thumbnail: json["thumbnail"],
    edited: json["edited"],
    authorFlairCssClass: json["author_flair_css_class"],
    authorFlairRichtext: List<dynamic>.from(json["author_flair_richtext"].map((x) => x)),
    gildings: Gildings.fromJson(json["gildings"]),
    postHint: json["post_hint"] == null ? null : json["post_hint"],
    contentCategories: json["content_categories"],
    isSelf: json["is_self"],
    modNote: json["mod_note"],
    created: json["created"],
    linkFlairType: json["link_flair_type"],
    wls: json["wls"],
    removedByCategory: json["removed_by_category"],
    bannedBy: json["banned_by"],
    authorFlairType: json["author_flair_type"],
    domain: json["domain"],
    allowLiveComments: json["allow_live_comments"],
    selftextHtml: json["selftext_html"] == null ? null : json["selftext_html"],
    likes: json["likes"],
    suggestedSort: json["suggested_sort"],
    bannedAtUtc: json["banned_at_utc"],
    urlOverriddenByDest: json["url_overridden_by_dest"] == null ? null : json["url_overridden_by_dest"],
    viewCount: json["view_count"],
    archived: json["archived"],
    noFollow: json["no_follow"],
    isCrosspostable: json["is_crosspostable"],
    pinned: json["pinned"],
    over18: json["over_18"],
    preview: json["preview"] == null ? null : Preview.fromJson(json["preview"]),
    allAwardings: List<AllAwarding>.from(json["all_awardings"].map((x) => AllAwarding.fromJson(x))),
    awarders: List<dynamic>.from(json["awarders"].map((x) => x)),
    mediaOnly: json["media_only"],
    linkFlairTemplateId: json["link_flair_template_id"],
    canGild: json["can_gild"],
    spoiler: json["spoiler"],
    locked: json["locked"],
    authorFlairText: json["author_flair_text"],
    treatmentTags: List<dynamic>.from(json["treatment_tags"].map((x) => x)),
    visited: json["visited"],
    removedBy: json["removed_by"],
    numReports: json["num_reports"],
    distinguished: json["distinguished"],
    subredditId: json["subreddit_id"],
    modReasonBy: json["mod_reason_by"],
    removalReason: json["removal_reason"],
    linkFlairBackgroundColor: json["link_flair_background_color"],
    id: json["id"],
    isRobotIndexable: json["is_robot_indexable"],
    reportReasons: json["report_reasons"],
    author: json["author"],
    discussionType: json["discussion_type"],
    numComments: json["num_comments"],
    sendReplies: json["send_replies"],
    whitelistStatus: json["whitelist_status"],
    contestMode: json["contest_mode"],
    modReports: List<dynamic>.from(json["mod_reports"].map((x) => x)),
    authorPatreonFlair: json["author_patreon_flair"],
    authorFlairTextColor: json["author_flair_text_color"],
    permalink: json["permalink"],
    parentWhitelistStatus: json["parent_whitelist_status"],
    stickied: json["stickied"],
    url: json["url"],
    subredditSubscribers: json["subreddit_subscribers"],
    createdUtc: json["created_utc"],
    numCrossposts: json["num_crossposts"],
    media: json["media"] == null ? null : Media.fromJson(json["media"]),
    isVideo: json["is_video"],
  );

  Map<String, dynamic> toJson() => {
    "approved_at_utc": approvedAtUtc,
    "subreddit": subreddit,
    "selftext": selftext,
    "author_fullname": authorFullname,
    "saved": saved,
    "mod_reason_title": modReasonTitle,
    "gilded": gilded,
    "clicked": clicked,
    "title": title,
    "link_flair_richtext": List<dynamic>.from(linkFlairRichtext.map((x) => x)),
    "subreddit_name_prefixed": subredditNamePrefixed,
    "hidden": hidden,
    "pwls": pwls,
    "link_flair_css_class": linkFlairCssClass,
    "downs": downs,
    "thumbnail_height": thumbnailHeight == null ? null : thumbnailHeight,
    "top_awarded_type": topAwardedType,
    "hide_score": hideScore,
    "name": name,
    "quarantine": quarantine,
    "link_flair_text_color": linkFlairTextColor,
    "upvote_ratio": upvoteRatio,
    "author_flair_background_color": authorFlairBackgroundColor,
    "subreddit_type": subredditType,
    "ups": ups,
    "total_awards_received": totalAwardsReceived,
    "media_embed": mediaEmbed.toJson(),
    "thumbnail_width": thumbnailWidth == null ? null : thumbnailWidth,
    "author_flair_template_id": authorFlairTemplateId,
    "is_original_content": isOriginalContent,
    "user_reports": List<dynamic>.from(userReports.map((x) => x)),
    "secure_media": secureMedia == null ? null : secureMedia.toJson(),
    "is_reddit_media_domain": isRedditMediaDomain,
    "is_meta": isMeta,
    "category": category,
    "secure_media_embed": secureMediaEmbed.toJson(),
    "link_flair_text": linkFlairText,
    "can_mod_post": canModPost,
    "score": score,
    "approved_by": approvedBy,
    "author_premium": authorPremium,
    "thumbnail": thumbnail,
    "edited": edited,
    "author_flair_css_class": authorFlairCssClass,
    "author_flair_richtext": List<dynamic>.from(authorFlairRichtext.map((x) => x)),
    "gildings": gildings.toJson(),
    "post_hint": postHint == null ? null : postHint,
    "content_categories": contentCategories,
    "is_self": isSelf,
    "mod_note": modNote,
    "created": created,
    "link_flair_type": linkFlairType,
    "wls": wls,
    "removed_by_category": removedByCategory,
    "banned_by": bannedBy,
    "author_flair_type": authorFlairType,
    "domain": domain,
    "allow_live_comments": allowLiveComments,
    "selftext_html": selftextHtml == null ? null : selftextHtml,
    "likes": likes,
    "suggested_sort": suggestedSort,
    "banned_at_utc": bannedAtUtc,
    "url_overridden_by_dest": urlOverriddenByDest == null ? null : urlOverriddenByDest,
    "view_count": viewCount,
    "archived": archived,
    "no_follow": noFollow,
    "is_crosspostable": isCrosspostable,
    "pinned": pinned,
    "over_18": over18,
    "preview": preview == null ? null : preview.toJson(),
    "all_awardings": List<dynamic>.from(allAwardings.map((x) => x.toJson())),
    "awarders": List<dynamic>.from(awarders.map((x) => x)),
    "media_only": mediaOnly,
    "link_flair_template_id": linkFlairTemplateId,
    "can_gild": canGild,
    "spoiler": spoiler,
    "locked": locked,
    "author_flair_text": authorFlairText,
    "treatment_tags": List<dynamic>.from(treatmentTags.map((x) => x)),
    "visited": visited,
    "removed_by": removedBy,
    "num_reports": numReports,
    "distinguished": distinguished,
    "subreddit_id": subredditId,
    "mod_reason_by": modReasonBy,
    "removal_reason": removalReason,
    "link_flair_background_color": linkFlairBackgroundColor,
    "id": id,
    "is_robot_indexable": isRobotIndexable,
    "report_reasons": reportReasons,
    "author": author,
    "discussion_type": discussionType,
    "num_comments": numComments,
    "send_replies": sendReplies,
    "whitelist_status": whitelistStatus,
    "contest_mode": contestMode,
    "mod_reports": List<dynamic>.from(modReports.map((x) => x)),
    "author_patreon_flair": authorPatreonFlair,
    "author_flair_text_color": authorFlairTextColor,
    "permalink": permalink,
    "parent_whitelist_status": parentWhitelistStatus,
    "stickied": stickied,
    "url": url,
    "subreddit_subscribers": subredditSubscribers,
    "created_utc": createdUtc,
    "num_crossposts": numCrossposts,
    "media": media == null ? null : media.toJson(),
    "is_video": isVideo,
  };
}

class AllAwarding {
  AllAwarding({
    this.giverCoinReward,
    this.subredditId,
    this.isNew,
    this.daysOfDripExtension,
    this.coinPrice,
    this.id,
    this.pennyDonate,
    this.awardSubType,
    this.coinReward,
    this.iconUrl,
    this.daysOfPremium,
    this.tiersByRequiredAwardings,
    this.resizedIcons,
    this.iconWidth,
    this.staticIconWidth,
    this.startDate,
    this.isEnabled,
    this.awardingsRequiredToGrantBenefits,
    this.description,
    this.endDate,
    this.subredditCoinReward,
    this.count,
    this.staticIconHeight,
    this.name,
    this.resizedStaticIcons,
    this.iconFormat,
    this.iconHeight,
    this.pennyPrice,
    this.awardType,
    this.staticIconUrl,
  });

  dynamic giverCoinReward;
  dynamic subredditId;
  bool isNew;
  int daysOfDripExtension;
  int coinPrice;
  String id;
  dynamic pennyDonate;
  String awardSubType;
  int coinReward;
  String iconUrl;
  int daysOfPremium;
  dynamic tiersByRequiredAwardings;
  List<ResizedIcon> resizedIcons;
  int iconWidth;
  int staticIconWidth;
  dynamic startDate;
  bool isEnabled;
  dynamic awardingsRequiredToGrantBenefits;
  String description;
  dynamic endDate;
  int subredditCoinReward;
  int count;
  int staticIconHeight;
  String name;
  List<ResizedIcon> resizedStaticIcons;
  dynamic iconFormat;
  int iconHeight;
  dynamic pennyPrice;
  String awardType;
  String staticIconUrl;

  factory AllAwarding.fromJson(Map<String, dynamic> json) => AllAwarding(
    giverCoinReward: json["giver_coin_reward"],
    subredditId: json["subreddit_id"],
    isNew: json["is_new"],
    daysOfDripExtension: json["days_of_drip_extension"],
    coinPrice: json["coin_price"],
    id: json["id"],
    pennyDonate: json["penny_donate"],
    awardSubType: json["award_sub_type"],
    coinReward: json["coin_reward"],
    iconUrl: json["icon_url"],
    daysOfPremium: json["days_of_premium"],
    tiersByRequiredAwardings: json["tiers_by_required_awardings"],
    resizedIcons: List<ResizedIcon>.from(json["resized_icons"].map((x) => ResizedIcon.fromJson(x))),
    iconWidth: json["icon_width"],
    staticIconWidth: json["static_icon_width"],
    startDate: json["start_date"],
    isEnabled: json["is_enabled"],
    awardingsRequiredToGrantBenefits: json["awardings_required_to_grant_benefits"],
    description: json["description"],
    endDate: json["end_date"],
    subredditCoinReward: json["subreddit_coin_reward"],
    count: json["count"],
    staticIconHeight: json["static_icon_height"],
    name: json["name"],
    resizedStaticIcons: List<ResizedIcon>.from(json["resized_static_icons"].map((x) => ResizedIcon.fromJson(x))),
    iconFormat: json["icon_format"],
    iconHeight: json["icon_height"],
    pennyPrice: json["penny_price"],
    awardType: json["award_type"],
    staticIconUrl: json["static_icon_url"],
  );

  Map<String, dynamic> toJson() => {
    "giver_coin_reward": giverCoinReward,
    "subreddit_id": subredditId,
    "is_new": isNew,
    "days_of_drip_extension": daysOfDripExtension,
    "coin_price": coinPrice,
    "id": id,
    "penny_donate": pennyDonate,
    "award_sub_type": awardSubType,
    "coin_reward": coinReward,
    "icon_url": iconUrl,
    "days_of_premium": daysOfPremium,
    "tiers_by_required_awardings": tiersByRequiredAwardings,
    "resized_icons": List<dynamic>.from(resizedIcons.map((x) => x.toJson())),
    "icon_width": iconWidth,
    "static_icon_width": staticIconWidth,
    "start_date": startDate,
    "is_enabled": isEnabled,
    "awardings_required_to_grant_benefits": awardingsRequiredToGrantBenefits,
    "description": description,
    "end_date": endDate,
    "subreddit_coin_reward": subredditCoinReward,
    "count": count,
    "static_icon_height": staticIconHeight,
    "name": name,
    "resized_static_icons": List<dynamic>.from(resizedStaticIcons.map((x) => x.toJson())),
    "icon_format": iconFormat,
    "icon_height": iconHeight,
    "penny_price": pennyPrice,
    "award_type": awardType,
    "static_icon_url": staticIconUrl,
  };
}

class ResizedIcon {
  ResizedIcon({
    this.url,
    this.width,
    this.height,
  });

  String url;
  int width;
  int height;

  factory ResizedIcon.fromJson(Map<String, dynamic> json) => ResizedIcon(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class Gildings {
  Gildings({
    this.gid1,
  });

  int gid1;

  factory Gildings.fromJson(Map<String, dynamic> json) => Gildings(
    gid1: json["gid_1"] == null ? null : json["gid_1"],
  );

  Map<String, dynamic> toJson() => {
    "gid_1": gid1 == null ? null : gid1,
  };
}

class Media {
  Media({
    this.type,
    this.oembed,
  });

  String type;
  Oembed oembed;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    type: json["type"],
    oembed: Oembed.fromJson(json["oembed"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "oembed": oembed.toJson(),
  };
}

class Oembed {
  Oembed({
    this.providerUrl,
    this.version,
    this.title,
    this.type,
    this.thumbnailWidth,
    this.height,
    this.width,
    this.html,
    this.authorName,
    this.providerName,
    this.thumbnailUrl,
    this.thumbnailHeight,
    this.authorUrl,
  });

  String providerUrl;
  String version;
  String title;
  String type;
  int thumbnailWidth;
  int height;
  int width;
  String html;
  String authorName;
  String providerName;
  String thumbnailUrl;
  int thumbnailHeight;
  String authorUrl;

  factory Oembed.fromJson(Map<String, dynamic> json) => Oembed(
    providerUrl: json["provider_url"],
    version: json["version"],
    title: json["title"],
    type: json["type"],
    thumbnailWidth: json["thumbnail_width"],
    height: json["height"],
    width: json["width"],
    html: json["html"],
    authorName: json["author_name"],
    providerName: json["provider_name"],
    thumbnailUrl: json["thumbnail_url"],
    thumbnailHeight: json["thumbnail_height"],
    authorUrl: json["author_url"],
  );

  Map<String, dynamic> toJson() => {
    "provider_url": providerUrl,
    "version": version,
    "title": title,
    "type": type,
    "thumbnail_width": thumbnailWidth,
    "height": height,
    "width": width,
    "html": html,
    "author_name": authorName,
    "provider_name": providerName,
    "thumbnail_url": thumbnailUrl,
    "thumbnail_height": thumbnailHeight,
    "author_url": authorUrl,
  };
}

class MediaEmbed {
  MediaEmbed({
    this.content,
    this.width,
    this.scrolling,
    this.height,
    this.mediaDomainUrl,
  });

  String content;
  int width;
  bool scrolling;
  int height;
  String mediaDomainUrl;

  factory MediaEmbed.fromJson(Map<String, dynamic> json) => MediaEmbed(
    content: json["content"] == null ? null : json["content"],
    width: json["width"] == null ? null : json["width"],
    scrolling: json["scrolling"] == null ? null : json["scrolling"],
    height: json["height"] == null ? null : json["height"],
    mediaDomainUrl: json["media_domain_url"] == null ? null : json["media_domain_url"],
  );

  Map<String, dynamic> toJson() => {
    "content": content == null ? null : content,
    "width": width == null ? null : width,
    "scrolling": scrolling == null ? null : scrolling,
    "height": height == null ? null : height,
    "media_domain_url": mediaDomainUrl == null ? null : mediaDomainUrl,
  };
}

class Preview {
  Preview({
    this.images,
    this.enabled,
  });

  List<Image> images;
  bool enabled;

  factory Preview.fromJson(Map<String, dynamic> json) => Preview(
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    enabled: json["enabled"],
  );

  Map<String, dynamic> toJson() => {
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "enabled": enabled,
  };
}

class Image {
  Image({
    this.source,
    this.resolutions,
    this.variants,
    this.id,
  });

  ResizedIcon source;
  List<ResizedIcon> resolutions;
  Variants variants;
  String id;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    source: ResizedIcon.fromJson(json["source"]),
    resolutions: List<ResizedIcon>.from(json["resolutions"].map((x) => ResizedIcon.fromJson(x))),
    variants: Variants.fromJson(json["variants"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "resolutions": List<dynamic>.from(resolutions.map((x) => x.toJson())),
    "variants": variants.toJson(),
    "id": id,
  };
}

class Variants {
  Variants();

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
  );

  Map<String, dynamic> toJson() => {
  };
}
