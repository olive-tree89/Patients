import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'patient_record.g.dart';

abstract class PatientRecord
    implements Built<PatientRecord, PatientRecordBuilder> {
  static Serializer<PatientRecord> get serializer => _$patientRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'p_name')
  String get pName;

  @nullable
  @BuiltValueField(wireName: 'p_surname')
  String get pSurname;

  @nullable
  @BuiltValueField(wireName: 'p_addDate')
  Timestamp get pAddDate;

  @nullable
  @BuiltValueField(wireName: 'p_birthDate')
  Timestamp get pBirthDate;

  @nullable
  @BuiltValueField(wireName: 'p_sex')
  String get pSex;

  @nullable
  @BuiltValueField(wireName: 'p_pathologyHypothesis')
  String get pPathologyHypothesis;

  @nullable
  @BuiltValueField(wireName: 'p_pathologyDiagnosisMain')
  String get pPathologyDiagnosisMain;

  @nullable
  @BuiltValueField(wireName: 'p_pathologyDiagnosisSecondary')
  String get pPathologyDiagnosisSecondary;

  @nullable
  @BuiltValueField(wireName: 'p_where')
  String get pWhere;

  @nullable
  @BuiltValueField(wireName: 'p_ipp')
  String get pIpp;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PatientRecordBuilder builder) => builder
    ..pName = ''
    ..pSurname = ''
    ..pSex = ''
    ..pPathologyHypothesis = ''
    ..pPathologyDiagnosisMain = ''
    ..pPathologyDiagnosisSecondary = ''
    ..pWhere = ''
    ..pIpp = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('patient');

  static Stream<PatientRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PatientRecord._();
  factory PatientRecord([void Function(PatientRecordBuilder) updates]) =
      _$PatientRecord;
}

Map<String, dynamic> createPatientRecordData({
  String pName,
  String pSurname,
  Timestamp pAddDate,
  Timestamp pBirthDate,
  String pSex,
  String pPathologyHypothesis,
  String pPathologyDiagnosisMain,
  String pPathologyDiagnosisSecondary,
  String pWhere,
  String pIpp,
}) =>
    serializers.serializeWith(
        PatientRecord.serializer,
        PatientRecord((p) => p
          ..pName = pName
          ..pSurname = pSurname
          ..pAddDate = pAddDate
          ..pBirthDate = pBirthDate
          ..pSex = pSex
          ..pPathologyHypothesis = pPathologyHypothesis
          ..pPathologyDiagnosisMain = pPathologyDiagnosisMain
          ..pPathologyDiagnosisSecondary = pPathologyDiagnosisSecondary
          ..pWhere = pWhere
          ..pIpp = pIpp));

PatientRecord get dummyPatientRecord {
  final builder = PatientRecordBuilder()
    ..pName = dummyString
    ..pSurname = dummyString
    ..pAddDate = dummyTimestamp
    ..pBirthDate = dummyTimestamp
    ..pSex = dummyString
    ..pPathologyHypothesis = dummyString
    ..pPathologyDiagnosisMain = dummyString
    ..pPathologyDiagnosisSecondary = dummyString
    ..pWhere = dummyString
    ..pIpp = dummyString;
  return builder.build();
}

List<PatientRecord> createDummyPatientRecord({int count}) =>
    List.generate(count, (_) => dummyPatientRecord);
