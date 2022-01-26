import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'job_sub_cons_record.g.dart';

abstract class JobSubConsRecord
    implements Built<JobSubConsRecord, JobSubConsRecordBuilder> {
  static Serializer<JobSubConsRecord> get serializer =>
      _$jobSubConsRecordSerializer;

  @nullable
  DocumentReference get uid;

  @nullable
  @BuiltValueField(wireName: 'JobTitle')
  String get jobTitle;

  @nullable
  @BuiltValueField(wireName: 'JobDesc')
  String get jobDesc;

  @nullable
  @BuiltValueField(wireName: 'Created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'Photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(JobSubConsRecordBuilder builder) => builder
    ..jobTitle = ''
    ..jobDesc = ''
    ..photoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('JobSubCons');

  static Stream<JobSubConsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<JobSubConsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  JobSubConsRecord._();
  factory JobSubConsRecord([void Function(JobSubConsRecordBuilder) updates]) =
      _$JobSubConsRecord;

  static JobSubConsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createJobSubConsRecordData({
  DocumentReference uid,
  String jobTitle,
  String jobDesc,
  DateTime createdTime,
  String photoUrl,
}) =>
    serializers.toFirestore(
        JobSubConsRecord.serializer,
        JobSubConsRecord((j) => j
          ..uid = uid
          ..jobTitle = jobTitle
          ..jobDesc = jobDesc
          ..createdTime = createdTime
          ..photoUrl = photoUrl));
