import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'ideas_record.g.dart';

abstract class IdeasRecord implements Built<IdeasRecord, IdeasRecordBuilder> {
  static Serializer<IdeasRecord> get serializer => _$ideasRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'Ideas')
  String get ideas;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(IdeasRecordBuilder builder) => builder
    ..name = ''
    ..ideas = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ideas');

  static Stream<IdeasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  IdeasRecord._();
  factory IdeasRecord([void Function(IdeasRecordBuilder) updates]) =
      _$IdeasRecord;
}

Map<String, dynamic> createIdeasRecordData({
  String name,
  String ideas,
}) =>
    serializers.serializeWith(
        IdeasRecord.serializer,
        IdeasRecord((i) => i
          ..name = name
          ..ideas = ideas));

IdeasRecord get dummyIdeasRecord {
  final builder = IdeasRecordBuilder()
    ..name = dummyString
    ..ideas = dummyString;
  return builder.build();
}

List<IdeasRecord> createDummyIdeasRecord({int count}) =>
    List.generate(count, (_) => dummyIdeasRecord);
