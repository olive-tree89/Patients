import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_email')
  String get userEmail;

  @nullable
  @BuiltValueField(wireName: 'user_username')
  String get userUsername;

  @nullable
  @BuiltValueField(wireName: 'user_photo')
  String get userPhoto;

  @nullable
  @BuiltValueField(wireName: 'user_ID')
  String get userID;

  @nullable
  @BuiltValueField(wireName: 'user_createdat')
  Timestamp get userCreatedat;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..userEmail = ''
    ..userUsername = ''
    ..userPhoto = ''
    ..userID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;
}

Map<String, dynamic> createUsersRecordData({
  String userEmail,
  String userUsername,
  String userPhoto,
  String userID,
  Timestamp userCreatedat,
}) =>
    serializers.serializeWith(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..userEmail = userEmail
          ..userUsername = userUsername
          ..userPhoto = userPhoto
          ..userID = userID
          ..userCreatedat = userCreatedat));

UsersRecord get dummyUsersRecord {
  final builder = UsersRecordBuilder()
    ..userEmail = dummyString
    ..userUsername = dummyString
    ..userPhoto = dummyImagePath
    ..userID = dummyString
    ..userCreatedat = dummyTimestamp;
  return builder.build();
}

List<UsersRecord> createDummyUsersRecord({int count}) =>
    List.generate(count, (_) => dummyUsersRecord);
