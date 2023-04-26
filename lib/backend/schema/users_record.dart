import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get username;

  String? get bio;

  String? get website;

  BuiltList<DocumentReference>? get following;

  @BuiltValueField(wireName: 'enable_email')
  bool? get enableEmail;

  DateTime? get birthday;

  BuiltList<DocumentReference>? get unreadNotifications;

  BuiltList<DocumentReference>? get chats;

  @BuiltValueField(wireName: 'cover_image1')
  String? get coverImage1;

  @BuiltValueField(wireName: 'cover_image2')
  String? get coverImage2;

  @BuiltValueField(wireName: 'cover_image3')
  String? get coverImage3;

  @BuiltValueField(wireName: 'cover_image4')
  String? get coverImage4;

  @BuiltValueField(wireName: 'cover_image')
  String? get coverImage;

  @BuiltValueField(wireName: 'open_direct_messages')
  bool? get openDirectMessages;

  @BuiltValueField(wireName: 'enable_followers')
  bool? get enableFollowers;

  @BuiltValueField(wireName: 'enable_social_links')
  bool? get enableSocialLinks;

  @BuiltValueField(wireName: 'enable_ice_breakers')
  bool? get enableIceBreakers;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..username = ''
    ..bio = ''
    ..website = ''
    ..following = ListBuilder()
    ..enableEmail = false
    ..unreadNotifications = ListBuilder()
    ..chats = ListBuilder()
    ..coverImage1 = ''
    ..coverImage2 = ''
    ..coverImage3 = ''
    ..coverImage4 = ''
    ..coverImage = ''
    ..openDirectMessages = false
    ..enableFollowers = false
    ..enableSocialLinks = false
    ..enableIceBreakers = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? username,
  String? bio,
  String? website,
  bool? enableEmail,
  DateTime? birthday,
  String? coverImage1,
  String? coverImage2,
  String? coverImage3,
  String? coverImage4,
  String? coverImage,
  bool? openDirectMessages,
  bool? enableFollowers,
  bool? enableSocialLinks,
  bool? enableIceBreakers,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..username = username
        ..bio = bio
        ..website = website
        ..following = null
        ..enableEmail = enableEmail
        ..birthday = birthday
        ..unreadNotifications = null
        ..chats = null
        ..coverImage1 = coverImage1
        ..coverImage2 = coverImage2
        ..coverImage3 = coverImage3
        ..coverImage4 = coverImage4
        ..coverImage = coverImage
        ..openDirectMessages = openDirectMessages
        ..enableFollowers = enableFollowers
        ..enableSocialLinks = enableSocialLinks
        ..enableIceBreakers = enableIceBreakers,
    ),
  );

  return firestoreData;
}
