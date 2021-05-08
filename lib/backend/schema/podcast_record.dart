import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'podcast_record.g.dart';

abstract class PodcastRecord
    implements Built<PodcastRecord, PodcastRecordBuilder> {
  static Serializer<PodcastRecord> get serializer => _$podcastRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Audio')
  String get audio;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PodcastRecordBuilder builder) =>
      builder..audio = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Podcast');

  static Stream<PodcastRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PodcastRecord._();
  factory PodcastRecord([void Function(PodcastRecordBuilder) updates]) =
      _$PodcastRecord;
}

Map<String, dynamic> createPodcastRecordData({
  String audio,
}) =>
    serializers.serializeWith(
        PodcastRecord.serializer, PodcastRecord((p) => p..audio = audio));

PodcastRecord get dummyPodcastRecord {
  final builder = PodcastRecordBuilder()..audio = dummyVideoPath;
  return builder.build();
}

List<PodcastRecord> createDummyPodcastRecord({int count}) =>
    List.generate(count, (_) => dummyPodcastRecord);
