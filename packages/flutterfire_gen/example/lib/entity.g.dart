// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

class ReadEntity {
  const ReadEntity({
    required this.name,
    required this.age,
    required this.isAdult,
    required this.nullableInt,
    required this.nullableText,
    required this.foo,
  });

  final String name;
  final int age;
  final bool isAdult;
  final int? nullableInt;
  final String? nullableText;
  final Foo foo;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'isAdult': isAdult,
      'nullableInt': nullableInt,
      'nullableText': nullableText,
      'foo': foo,
    };
  }

  factory ReadEntity.fromJson(Map<String, dynamic> json) {
    return ReadEntity(
      name: json['name'] as String,
      age: json['age'] as int,
      isAdult: json['isAdult'] as bool? ?? false,
      nullableInt: json['nullableInt'] as int?,
      nullableText: json['nullableText'] as String? ?? 'defaultText',
      foo: json['foo'] as Foo? ?? const Foo('bar'),
    );
  }

  factory ReadEntity.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadEntity.fromJson(<String, dynamic>{
      ...data,
      'entityId': ds.id,
    });
  }

  ReadEntity copyWith({
    String? name,
    int? age,
    bool? isAdult,
    int? nullableInt,
    String? nullableText,
    Foo? foo,
  }) {
    return ReadEntity(
      name: name ?? this.name,
      age: age ?? this.age,
      isAdult: isAdult ?? this.isAdult,
      nullableInt: nullableInt ?? this.nullableInt,
      nullableText: nullableText ?? this.nullableText,
      foo: foo ?? this.foo,
    );
  }
}

/// A [CollectionReference] to entities collection to read.
final readEntityCollectionReference =
    FirebaseFirestore.instance.collection('entities').withConverter(
          fromFirestore: (ds, _) => ReadEntity.fromDocumentSnapshot(ds),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// A [DocumentReference] to entity document to read.
DocumentReference<ReadEntity> readEntityDocumentReference({
  required String entityId,
}) =>
    readEntityCollectionReference.doc(entityId);

/// A query manager to execute query against [Entity].
class EntityQuery {
  /// Fetches [ReadEntity] documents.
  Future<List<ReadEntity>> fetchDocuments({
    GetOptions? options,
    Query<ReadEntity>? Function(Query<ReadEntity> query)? queryBuilder,
    int Function(ReadEntity lhs, ReadEntity rhs)? compare,
  }) async {
    Query<ReadEntity> query = readEntityCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final qs = await query.get(options);
    final result = qs.docs.map((qds) => qds.data()).toList();
    if (compare != null) {
      result.sort(compare);
    }
    return result;
  }

  /// Subscribes [Entity] documents.
  Stream<List<ReadEntity>> subscribeDocuments({
    Query<ReadEntity>? Function(Query<ReadEntity> query)? queryBuilder,
    int Function(ReadEntity lhs, ReadEntity rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadEntity> query = readEntityCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    var streamQs =
        query.snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamQs = streamQs.where((qs) => !qs.metadata.hasPendingWrites);
    }
    return streamQs.map((qs) {
      final result = qs.docs.map((qds) => qds.data()).toList();
      if (compare != null) {
        result.sort(compare);
      }
      return result;
    });
  }

  /// Fetches [ReadEntity] document.
  Future<ReadEntity?> fetchDocument({
    required String entityId,
    GetOptions? options,
  }) async {
    final ds =
        await readEntityDocumentReference(entityId: entityId).get(options);
    return ds.data();
  }

  /// Subscribes [Entity] document.
  Future<Stream<ReadEntity?>> subscribeDocument({
    required String entityId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) async {
    var streamDs = readEntityDocumentReference(entityId: entityId)
        .snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }
}
