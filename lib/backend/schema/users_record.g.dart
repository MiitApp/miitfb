// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.following;
    if (value != null) {
      result
        ..add('following')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.enableEmail;
    if (value != null) {
      result
        ..add('enable_email')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.birthday;
    if (value != null) {
      result
        ..add('birthday')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.unreadNotifications;
    if (value != null) {
      result
        ..add('unreadNotifications')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.chats;
    if (value != null) {
      result
        ..add('chats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.coverImage1;
    if (value != null) {
      result
        ..add('cover_image1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coverImage2;
    if (value != null) {
      result
        ..add('cover_image2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coverImage3;
    if (value != null) {
      result
        ..add('cover_image3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coverImage4;
    if (value != null) {
      result
        ..add('cover_image4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coverImage;
    if (value != null) {
      result
        ..add('cover_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.openDirectMessages;
    if (value != null) {
      result
        ..add('open_direct_messages')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enableFollowers;
    if (value != null) {
      result
        ..add('enable_followers')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enableSocialLinks;
    if (value != null) {
      result
        ..add('enable_social_links')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enableIceBreakers;
    if (value != null) {
      result
        ..add('enable_ice_breakers')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'following':
          result.following.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'enable_email':
          result.enableEmail = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'unreadNotifications':
          result.unreadNotifications.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'chats':
          result.chats.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'cover_image1':
          result.coverImage1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cover_image2':
          result.coverImage2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cover_image3':
          result.coverImage3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cover_image4':
          result.coverImage4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cover_image':
          result.coverImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'open_direct_messages':
          result.openDirectMessages = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enable_followers':
          result.enableFollowers = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enable_social_links':
          result.enableSocialLinks = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enable_ice_breakers':
          result.enableIceBreakers = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? username;
  @override
  final String? bio;
  @override
  final String? website;
  @override
  final BuiltList<DocumentReference<Object?>>? following;
  @override
  final bool? enableEmail;
  @override
  final DateTime? birthday;
  @override
  final BuiltList<DocumentReference<Object?>>? unreadNotifications;
  @override
  final BuiltList<DocumentReference<Object?>>? chats;
  @override
  final String? coverImage1;
  @override
  final String? coverImage2;
  @override
  final String? coverImage3;
  @override
  final String? coverImage4;
  @override
  final String? coverImage;
  @override
  final bool? openDirectMessages;
  @override
  final bool? enableFollowers;
  @override
  final bool? enableSocialLinks;
  @override
  final bool? enableIceBreakers;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.username,
      this.bio,
      this.website,
      this.following,
      this.enableEmail,
      this.birthday,
      this.unreadNotifications,
      this.chats,
      this.coverImage1,
      this.coverImage2,
      this.coverImage3,
      this.coverImage4,
      this.coverImage,
      this.openDirectMessages,
      this.enableFollowers,
      this.enableSocialLinks,
      this.enableIceBreakers,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        username == other.username &&
        bio == other.bio &&
        website == other.website &&
        following == other.following &&
        enableEmail == other.enableEmail &&
        birthday == other.birthday &&
        unreadNotifications == other.unreadNotifications &&
        chats == other.chats &&
        coverImage1 == other.coverImage1 &&
        coverImage2 == other.coverImage2 &&
        coverImage3 == other.coverImage3 &&
        coverImage4 == other.coverImage4 &&
        coverImage == other.coverImage &&
        openDirectMessages == other.openDirectMessages &&
        enableFollowers == other.enableFollowers &&
        enableSocialLinks == other.enableSocialLinks &&
        enableIceBreakers == other.enableIceBreakers &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jc(_$hash, website.hashCode);
    _$hash = $jc(_$hash, following.hashCode);
    _$hash = $jc(_$hash, enableEmail.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, unreadNotifications.hashCode);
    _$hash = $jc(_$hash, chats.hashCode);
    _$hash = $jc(_$hash, coverImage1.hashCode);
    _$hash = $jc(_$hash, coverImage2.hashCode);
    _$hash = $jc(_$hash, coverImage3.hashCode);
    _$hash = $jc(_$hash, coverImage4.hashCode);
    _$hash = $jc(_$hash, coverImage.hashCode);
    _$hash = $jc(_$hash, openDirectMessages.hashCode);
    _$hash = $jc(_$hash, enableFollowers.hashCode);
    _$hash = $jc(_$hash, enableSocialLinks.hashCode);
    _$hash = $jc(_$hash, enableIceBreakers.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('username', username)
          ..add('bio', bio)
          ..add('website', website)
          ..add('following', following)
          ..add('enableEmail', enableEmail)
          ..add('birthday', birthday)
          ..add('unreadNotifications', unreadNotifications)
          ..add('chats', chats)
          ..add('coverImage1', coverImage1)
          ..add('coverImage2', coverImage2)
          ..add('coverImage3', coverImage3)
          ..add('coverImage4', coverImage4)
          ..add('coverImage', coverImage)
          ..add('openDirectMessages', openDirectMessages)
          ..add('enableFollowers', enableFollowers)
          ..add('enableSocialLinks', enableSocialLinks)
          ..add('enableIceBreakers', enableIceBreakers)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  ListBuilder<DocumentReference<Object?>>? _following;
  ListBuilder<DocumentReference<Object?>> get following =>
      _$this._following ??= new ListBuilder<DocumentReference<Object?>>();
  set following(ListBuilder<DocumentReference<Object?>>? following) =>
      _$this._following = following;

  bool? _enableEmail;
  bool? get enableEmail => _$this._enableEmail;
  set enableEmail(bool? enableEmail) => _$this._enableEmail = enableEmail;

  DateTime? _birthday;
  DateTime? get birthday => _$this._birthday;
  set birthday(DateTime? birthday) => _$this._birthday = birthday;

  ListBuilder<DocumentReference<Object?>>? _unreadNotifications;
  ListBuilder<DocumentReference<Object?>> get unreadNotifications =>
      _$this._unreadNotifications ??=
          new ListBuilder<DocumentReference<Object?>>();
  set unreadNotifications(
          ListBuilder<DocumentReference<Object?>>? unreadNotifications) =>
      _$this._unreadNotifications = unreadNotifications;

  ListBuilder<DocumentReference<Object?>>? _chats;
  ListBuilder<DocumentReference<Object?>> get chats =>
      _$this._chats ??= new ListBuilder<DocumentReference<Object?>>();
  set chats(ListBuilder<DocumentReference<Object?>>? chats) =>
      _$this._chats = chats;

  String? _coverImage1;
  String? get coverImage1 => _$this._coverImage1;
  set coverImage1(String? coverImage1) => _$this._coverImage1 = coverImage1;

  String? _coverImage2;
  String? get coverImage2 => _$this._coverImage2;
  set coverImage2(String? coverImage2) => _$this._coverImage2 = coverImage2;

  String? _coverImage3;
  String? get coverImage3 => _$this._coverImage3;
  set coverImage3(String? coverImage3) => _$this._coverImage3 = coverImage3;

  String? _coverImage4;
  String? get coverImage4 => _$this._coverImage4;
  set coverImage4(String? coverImage4) => _$this._coverImage4 = coverImage4;

  String? _coverImage;
  String? get coverImage => _$this._coverImage;
  set coverImage(String? coverImage) => _$this._coverImage = coverImage;

  bool? _openDirectMessages;
  bool? get openDirectMessages => _$this._openDirectMessages;
  set openDirectMessages(bool? openDirectMessages) =>
      _$this._openDirectMessages = openDirectMessages;

  bool? _enableFollowers;
  bool? get enableFollowers => _$this._enableFollowers;
  set enableFollowers(bool? enableFollowers) =>
      _$this._enableFollowers = enableFollowers;

  bool? _enableSocialLinks;
  bool? get enableSocialLinks => _$this._enableSocialLinks;
  set enableSocialLinks(bool? enableSocialLinks) =>
      _$this._enableSocialLinks = enableSocialLinks;

  bool? _enableIceBreakers;
  bool? get enableIceBreakers => _$this._enableIceBreakers;
  set enableIceBreakers(bool? enableIceBreakers) =>
      _$this._enableIceBreakers = enableIceBreakers;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _username = $v.username;
      _bio = $v.bio;
      _website = $v.website;
      _following = $v.following?.toBuilder();
      _enableEmail = $v.enableEmail;
      _birthday = $v.birthday;
      _unreadNotifications = $v.unreadNotifications?.toBuilder();
      _chats = $v.chats?.toBuilder();
      _coverImage1 = $v.coverImage1;
      _coverImage2 = $v.coverImage2;
      _coverImage3 = $v.coverImage3;
      _coverImage4 = $v.coverImage4;
      _coverImage = $v.coverImage;
      _openDirectMessages = $v.openDirectMessages;
      _enableFollowers = $v.enableFollowers;
      _enableSocialLinks = $v.enableSocialLinks;
      _enableIceBreakers = $v.enableIceBreakers;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              username: username,
              bio: bio,
              website: website,
              following: _following?.build(),
              enableEmail: enableEmail,
              birthday: birthday,
              unreadNotifications: _unreadNotifications?.build(),
              chats: _chats?.build(),
              coverImage1: coverImage1,
              coverImage2: coverImage2,
              coverImage3: coverImage3,
              coverImage4: coverImage4,
              coverImage: coverImage,
              openDirectMessages: openDirectMessages,
              enableFollowers: enableFollowers,
              enableSocialLinks: enableSocialLinks,
              enableIceBreakers: enableIceBreakers,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'following';
        _following?.build();

        _$failedField = 'unreadNotifications';
        _unreadNotifications?.build();
        _$failedField = 'chats';
        _chats?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
