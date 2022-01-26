// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_sub_cons_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JobSubConsRecord> _$jobSubConsRecordSerializer =
    new _$JobSubConsRecordSerializer();

class _$JobSubConsRecordSerializer
    implements StructuredSerializer<JobSubConsRecord> {
  @override
  final Iterable<Type> types = const [JobSubConsRecord, _$JobSubConsRecord];
  @override
  final String wireName = 'JobSubConsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, JobSubConsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.jobTitle;
    if (value != null) {
      result
        ..add('JobTitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobDesc;
    if (value != null) {
      result
        ..add('JobDesc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('Created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('Photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  JobSubConsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JobSubConsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'JobTitle':
          result.jobTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'JobDesc':
          result.jobDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'Photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$JobSubConsRecord extends JobSubConsRecord {
  @override
  final DocumentReference<Object> uid;
  @override
  final String jobTitle;
  @override
  final String jobDesc;
  @override
  final DateTime createdTime;
  @override
  final String photoUrl;
  @override
  final DocumentReference<Object> reference;

  factory _$JobSubConsRecord(
          [void Function(JobSubConsRecordBuilder) updates]) =>
      (new JobSubConsRecordBuilder()..update(updates)).build();

  _$JobSubConsRecord._(
      {this.uid,
      this.jobTitle,
      this.jobDesc,
      this.createdTime,
      this.photoUrl,
      this.reference})
      : super._();

  @override
  JobSubConsRecord rebuild(void Function(JobSubConsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JobSubConsRecordBuilder toBuilder() =>
      new JobSubConsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobSubConsRecord &&
        uid == other.uid &&
        jobTitle == other.jobTitle &&
        jobDesc == other.jobDesc &&
        createdTime == other.createdTime &&
        photoUrl == other.photoUrl &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, uid.hashCode), jobTitle.hashCode),
                    jobDesc.hashCode),
                createdTime.hashCode),
            photoUrl.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('JobSubConsRecord')
          ..add('uid', uid)
          ..add('jobTitle', jobTitle)
          ..add('jobDesc', jobDesc)
          ..add('createdTime', createdTime)
          ..add('photoUrl', photoUrl)
          ..add('reference', reference))
        .toString();
  }
}

class JobSubConsRecordBuilder
    implements Builder<JobSubConsRecord, JobSubConsRecordBuilder> {
  _$JobSubConsRecord _$v;

  DocumentReference<Object> _uid;
  DocumentReference<Object> get uid => _$this._uid;
  set uid(DocumentReference<Object> uid) => _$this._uid = uid;

  String _jobTitle;
  String get jobTitle => _$this._jobTitle;
  set jobTitle(String jobTitle) => _$this._jobTitle = jobTitle;

  String _jobDesc;
  String get jobDesc => _$this._jobDesc;
  set jobDesc(String jobDesc) => _$this._jobDesc = jobDesc;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  JobSubConsRecordBuilder() {
    JobSubConsRecord._initializeBuilder(this);
  }

  JobSubConsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _jobTitle = $v.jobTitle;
      _jobDesc = $v.jobDesc;
      _createdTime = $v.createdTime;
      _photoUrl = $v.photoUrl;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JobSubConsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JobSubConsRecord;
  }

  @override
  void update(void Function(JobSubConsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$JobSubConsRecord build() {
    final _$result = _$v ??
        new _$JobSubConsRecord._(
            uid: uid,
            jobTitle: jobTitle,
            jobDesc: jobDesc,
            createdTime: createdTime,
            photoUrl: photoUrl,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
