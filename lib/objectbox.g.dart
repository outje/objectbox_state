// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/student.dart';
import 'models/teacher.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 5098487427476663425),
      name: 'Student',
      lastPropertyId: const IdUid(2, 6065517782433223186),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7203820297145335623),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6065517782433223186),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 3170423351305081729),
            name: 'teachers',
            targetId: const IdUid(2, 6863038802240204703))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 6863038802240204703),
      name: 'Teacher',
      lastPropertyId: const IdUid(2, 7124313780590616382),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4138153841289686699),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7124313780590616382),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(2, 9219091769393234244),
            name: 'teachers',
            targetId: const IdUid(1, 5098487427476663425))
      ],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 6863038802240204703),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(2, 9219091769393234244),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Student: EntityDefinition<Student>(
        model: _entities[0],
        toOneRelations: (Student object) => [],
        toManyRelations: (Student object) =>
            {RelInfo<Student>.toMany(1, object.id): object.teachers},
        getId: (Student object) => object.id,
        setId: (Student object, int id) {
          object.id = id;
        },
        objectToFB: (Student object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Student(
              const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          InternalToManyAccess.setRelInfo(object.teachers, store,
              RelInfo<Student>.toMany(1, object.id), store.box<Student>());
          return object;
        }),
    Teacher: EntityDefinition<Teacher>(
        model: _entities[1],
        toOneRelations: (Teacher object) => [],
        toManyRelations: (Teacher object) =>
            {RelInfo<Teacher>.toMany(2, object.id): object.teachers},
        getId: (Teacher object) => object.id,
        setId: (Teacher object, int id) {
          object.id = id;
        },
        objectToFB: (Teacher object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Teacher(
              const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          InternalToManyAccess.setRelInfo(object.teachers, store,
              RelInfo<Teacher>.toMany(2, object.id), store.box<Teacher>());
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Student] entity fields to define ObjectBox queries.
class Student_ {
  /// see [Student.id]
  static final id = QueryIntegerProperty<Student>(_entities[0].properties[0]);

  /// see [Student.name]
  static final name = QueryStringProperty<Student>(_entities[0].properties[1]);

  /// see [Student.teachers]
  static final teachers =
      QueryRelationToMany<Student, Teacher>(_entities[0].relations[0]);
}

/// [Teacher] entity fields to define ObjectBox queries.
class Teacher_ {
  /// see [Teacher.id]
  static final id = QueryIntegerProperty<Teacher>(_entities[1].properties[0]);

  /// see [Teacher.name]
  static final name = QueryStringProperty<Teacher>(_entities[1].properties[1]);

  /// see [Teacher.teachers]
  static final teachers =
      QueryRelationToMany<Teacher, Student>(_entities[1].relations[0]);
}
