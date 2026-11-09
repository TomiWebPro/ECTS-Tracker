// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CoursesTable extends Courses with TableInfo<$CoursesTable, CourseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoursesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ectsCreditsMeta = const VerificationMeta(
    'ectsCredits',
  );
  @override
  late final GeneratedColumn<double> ectsCredits = GeneratedColumn<double>(
    'ects_credits',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deadlineMeta = const VerificationMeta(
    'deadline',
  );
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
    'deadline',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSampleMeta = const VerificationMeta(
    'isSample',
  );
  @override
  late final GeneratedColumn<bool> isSample = GeneratedColumn<bool>(
    'is_sample',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sample" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _startEarlyMeta = const VerificationMeta(
    'startEarly',
  );
  @override
  late final GeneratedColumn<bool> startEarly = GeneratedColumn<bool>(
    'start_early',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("start_early" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    ectsCredits,
    startDate,
    deadline,
    notes,
    colorValue,
    isSample,
    startEarly,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'courses';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ects_credits')) {
      context.handle(
        _ectsCreditsMeta,
        ectsCredits.isAcceptableOrUnknown(
          data['ects_credits']!,
          _ectsCreditsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ectsCreditsMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('deadline')) {
      context.handle(
        _deadlineMeta,
        deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    }
    if (data.containsKey('is_sample')) {
      context.handle(
        _isSampleMeta,
        isSample.isAcceptableOrUnknown(data['is_sample']!, _isSampleMeta),
      );
    }
    if (data.containsKey('start_early')) {
      context.handle(
        _startEarlyMeta,
        startEarly.isAcceptableOrUnknown(data['start_early']!, _startEarlyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      ectsCredits: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ects_credits'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      deadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      ),
      isSample: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sample'],
      )!,
      startEarly: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}start_early'],
      )!,
    );
  }

  @override
  $CoursesTable createAlias(String alias) {
    return $CoursesTable(attachedDatabase, alias);
  }
}

class CourseRow extends DataClass implements Insertable<CourseRow> {
  final int id;
  final String name;
  final double ectsCredits;
  final DateTime? startDate;
  final DateTime? deadline;
  final String? notes;
  final int? colorValue;
  final bool isSample;
  final bool startEarly;
  const CourseRow({
    required this.id,
    required this.name,
    required this.ectsCredits,
    this.startDate,
    this.deadline,
    this.notes,
    this.colorValue,
    required this.isSample,
    required this.startEarly,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['ects_credits'] = Variable<double>(ectsCredits);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || colorValue != null) {
      map['color_value'] = Variable<int>(colorValue);
    }
    map['is_sample'] = Variable<bool>(isSample);
    map['start_early'] = Variable<bool>(startEarly);
    return map;
  }

  CoursesCompanion toCompanion(bool nullToAbsent) {
    return CoursesCompanion(
      id: Value(id),
      name: Value(name),
      ectsCredits: Value(ectsCredits),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      colorValue: colorValue == null && nullToAbsent
          ? const Value.absent()
          : Value(colorValue),
      isSample: Value(isSample),
      startEarly: Value(startEarly),
    );
  }

  factory CourseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ectsCredits: serializer.fromJson<double>(json['ectsCredits']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      notes: serializer.fromJson<String?>(json['notes']),
      colorValue: serializer.fromJson<int?>(json['colorValue']),
      isSample: serializer.fromJson<bool>(json['isSample']),
      startEarly: serializer.fromJson<bool>(json['startEarly']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'ectsCredits': serializer.toJson<double>(ectsCredits),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'notes': serializer.toJson<String?>(notes),
      'colorValue': serializer.toJson<int?>(colorValue),
      'isSample': serializer.toJson<bool>(isSample),
      'startEarly': serializer.toJson<bool>(startEarly),
    };
  }

  CourseRow copyWith({
    int? id,
    String? name,
    double? ectsCredits,
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> deadline = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<int?> colorValue = const Value.absent(),
    bool? isSample,
    bool? startEarly,
  }) => CourseRow(
    id: id ?? this.id,
    name: name ?? this.name,
    ectsCredits: ectsCredits ?? this.ectsCredits,
    startDate: startDate.present ? startDate.value : this.startDate,
    deadline: deadline.present ? deadline.value : this.deadline,
    notes: notes.present ? notes.value : this.notes,
    colorValue: colorValue.present ? colorValue.value : this.colorValue,
    isSample: isSample ?? this.isSample,
    startEarly: startEarly ?? this.startEarly,
  );
  CourseRow copyWithCompanion(CoursesCompanion data) {
    return CourseRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      ectsCredits: data.ectsCredits.present
          ? data.ectsCredits.value
          : this.ectsCredits,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      notes: data.notes.present ? data.notes.value : this.notes,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      isSample: data.isSample.present ? data.isSample.value : this.isSample,
      startEarly: data.startEarly.present
          ? data.startEarly.value
          : this.startEarly,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ectsCredits: $ectsCredits, ')
          ..write('startDate: $startDate, ')
          ..write('deadline: $deadline, ')
          ..write('notes: $notes, ')
          ..write('colorValue: $colorValue, ')
          ..write('isSample: $isSample, ')
          ..write('startEarly: $startEarly')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    ectsCredits,
    startDate,
    deadline,
    notes,
    colorValue,
    isSample,
    startEarly,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.ectsCredits == this.ectsCredits &&
          other.startDate == this.startDate &&
          other.deadline == this.deadline &&
          other.notes == this.notes &&
          other.colorValue == this.colorValue &&
          other.isSample == this.isSample &&
          other.startEarly == this.startEarly);
}

class CoursesCompanion extends UpdateCompanion<CourseRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> ectsCredits;
  final Value<DateTime?> startDate;
  final Value<DateTime?> deadline;
  final Value<String?> notes;
  final Value<int?> colorValue;
  final Value<bool> isSample;
  final Value<bool> startEarly;
  const CoursesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ectsCredits = const Value.absent(),
    this.startDate = const Value.absent(),
    this.deadline = const Value.absent(),
    this.notes = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isSample = const Value.absent(),
    this.startEarly = const Value.absent(),
  });
  CoursesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double ectsCredits,
    this.startDate = const Value.absent(),
    this.deadline = const Value.absent(),
    this.notes = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isSample = const Value.absent(),
    this.startEarly = const Value.absent(),
  }) : name = Value(name),
       ectsCredits = Value(ectsCredits);
  static Insertable<CourseRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? ectsCredits,
    Expression<DateTime>? startDate,
    Expression<DateTime>? deadline,
    Expression<String>? notes,
    Expression<int>? colorValue,
    Expression<bool>? isSample,
    Expression<bool>? startEarly,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ectsCredits != null) 'ects_credits': ectsCredits,
      if (startDate != null) 'start_date': startDate,
      if (deadline != null) 'deadline': deadline,
      if (notes != null) 'notes': notes,
      if (colorValue != null) 'color_value': colorValue,
      if (isSample != null) 'is_sample': isSample,
      if (startEarly != null) 'start_early': startEarly,
    });
  }

  CoursesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? ectsCredits,
    Value<DateTime?>? startDate,
    Value<DateTime?>? deadline,
    Value<String?>? notes,
    Value<int?>? colorValue,
    Value<bool>? isSample,
    Value<bool>? startEarly,
  }) {
    return CoursesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ectsCredits: ectsCredits ?? this.ectsCredits,
      startDate: startDate ?? this.startDate,
      deadline: deadline ?? this.deadline,
      notes: notes ?? this.notes,
      colorValue: colorValue ?? this.colorValue,
      isSample: isSample ?? this.isSample,
      startEarly: startEarly ?? this.startEarly,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ectsCredits.present) {
      map['ects_credits'] = Variable<double>(ectsCredits.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (isSample.present) {
      map['is_sample'] = Variable<bool>(isSample.value);
    }
    if (startEarly.present) {
      map['start_early'] = Variable<bool>(startEarly.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoursesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ectsCredits: $ectsCredits, ')
          ..write('startDate: $startDate, ')
          ..write('deadline: $deadline, ')
          ..write('notes: $notes, ')
          ..write('colorValue: $colorValue, ')
          ..write('isSample: $isSample, ')
          ..write('startEarly: $startEarly')
          ..write(')'))
        .toString();
  }
}

class $StudySessionsTable extends StudySessions
    with TableInfo<$StudySessionsTable, SessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudySessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  @override
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES courses (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _minutesMeta = const VerificationMeta(
    'minutes',
  );
  @override
  late final GeneratedColumn<int> minutes = GeneratedColumn<int>(
    'minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSampleMeta = const VerificationMeta(
    'isSample',
  );
  @override
  late final GeneratedColumn<bool> isSample = GeneratedColumn<bool>(
    'is_sample',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sample" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    courseId,
    minutes,
    date,
    notes,
    isSample,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('minutes')) {
      context.handle(
        _minutesMeta,
        minutes.isAcceptableOrUnknown(data['minutes']!, _minutesMeta),
      );
    } else if (isInserting) {
      context.missing(_minutesMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_sample')) {
      context.handle(
        _isSampleMeta,
        isSample.isAcceptableOrUnknown(data['is_sample']!, _isSampleMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}course_id'],
      )!,
      minutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isSample: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sample'],
      )!,
    );
  }

  @override
  $StudySessionsTable createAlias(String alias) {
    return $StudySessionsTable(attachedDatabase, alias);
  }
}

class SessionRow extends DataClass implements Insertable<SessionRow> {
  final int id;
  final int courseId;

  /// Duration stored in minutes; hours are derived.
  final int minutes;
  final DateTime date;
  final String? notes;
  final bool isSample;
  const SessionRow({
    required this.id,
    required this.courseId,
    required this.minutes,
    required this.date,
    this.notes,
    required this.isSample,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['course_id'] = Variable<int>(courseId);
    map['minutes'] = Variable<int>(minutes);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_sample'] = Variable<bool>(isSample);
    return map;
  }

  StudySessionsCompanion toCompanion(bool nullToAbsent) {
    return StudySessionsCompanion(
      id: Value(id),
      courseId: Value(courseId),
      minutes: Value(minutes),
      date: Value(date),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      isSample: Value(isSample),
    );
  }

  factory SessionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionRow(
      id: serializer.fromJson<int>(json['id']),
      courseId: serializer.fromJson<int>(json['courseId']),
      minutes: serializer.fromJson<int>(json['minutes']),
      date: serializer.fromJson<DateTime>(json['date']),
      notes: serializer.fromJson<String?>(json['notes']),
      isSample: serializer.fromJson<bool>(json['isSample']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'courseId': serializer.toJson<int>(courseId),
      'minutes': serializer.toJson<int>(minutes),
      'date': serializer.toJson<DateTime>(date),
      'notes': serializer.toJson<String?>(notes),
      'isSample': serializer.toJson<bool>(isSample),
    };
  }

  SessionRow copyWith({
    int? id,
    int? courseId,
    int? minutes,
    DateTime? date,
    Value<String?> notes = const Value.absent(),
    bool? isSample,
  }) => SessionRow(
    id: id ?? this.id,
    courseId: courseId ?? this.courseId,
    minutes: minutes ?? this.minutes,
    date: date ?? this.date,
    notes: notes.present ? notes.value : this.notes,
    isSample: isSample ?? this.isSample,
  );
  SessionRow copyWithCompanion(StudySessionsCompanion data) {
    return SessionRow(
      id: data.id.present ? data.id.value : this.id,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      minutes: data.minutes.present ? data.minutes.value : this.minutes,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
      isSample: data.isSample.present ? data.isSample.value : this.isSample,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionRow(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('minutes: $minutes, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('isSample: $isSample')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, courseId, minutes, date, notes, isSample);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionRow &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.minutes == this.minutes &&
          other.date == this.date &&
          other.notes == this.notes &&
          other.isSample == this.isSample);
}

class StudySessionsCompanion extends UpdateCompanion<SessionRow> {
  final Value<int> id;
  final Value<int> courseId;
  final Value<int> minutes;
  final Value<DateTime> date;
  final Value<String?> notes;
  final Value<bool> isSample;
  const StudySessionsCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.minutes = const Value.absent(),
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
    this.isSample = const Value.absent(),
  });
  StudySessionsCompanion.insert({
    this.id = const Value.absent(),
    required int courseId,
    required int minutes,
    required DateTime date,
    this.notes = const Value.absent(),
    this.isSample = const Value.absent(),
  }) : courseId = Value(courseId),
       minutes = Value(minutes),
       date = Value(date);
  static Insertable<SessionRow> custom({
    Expression<int>? id,
    Expression<int>? courseId,
    Expression<int>? minutes,
    Expression<DateTime>? date,
    Expression<String>? notes,
    Expression<bool>? isSample,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (minutes != null) 'minutes': minutes,
      if (date != null) 'date': date,
      if (notes != null) 'notes': notes,
      if (isSample != null) 'is_sample': isSample,
    });
  }

  StudySessionsCompanion copyWith({
    Value<int>? id,
    Value<int>? courseId,
    Value<int>? minutes,
    Value<DateTime>? date,
    Value<String?>? notes,
    Value<bool>? isSample,
  }) {
    return StudySessionsCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      minutes: minutes ?? this.minutes,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      isSample: isSample ?? this.isSample,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
    }
    if (minutes.present) {
      map['minutes'] = Variable<int>(minutes.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isSample.present) {
      map['is_sample'] = Variable<bool>(isSample.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudySessionsCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('minutes: $minutes, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('isSample: $isSample')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _hoursPerEctsMeta = const VerificationMeta(
    'hoursPerEcts',
  );
  @override
  late final GeneratedColumn<double> hoursPerEcts = GeneratedColumn<double>(
    'hours_per_ects',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(30),
  );
  static const VerificationMeta _dailyTargetMinutesMeta =
      const VerificationMeta('dailyTargetMinutes');
  @override
  late final GeneratedColumn<int> dailyTargetMinutes = GeneratedColumn<int>(
    'daily_target_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _firstWeekdayMeta = const VerificationMeta(
    'firstWeekday',
  );
  @override
  late final GeneratedColumn<int> firstWeekday = GeneratedColumn<int>(
    'first_weekday',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<int> themeMode = GeneratedColumn<int>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _paceToleranceDaysMeta = const VerificationMeta(
    'paceToleranceDays',
  );
  @override
  late final GeneratedColumn<double> paceToleranceDays =
      GeneratedColumn<double>(
        'pace_tolerance_days',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(5),
      );
  static const VerificationMeta _weeklyOverloadHoursMeta =
      const VerificationMeta('weeklyOverloadHours');
  @override
  late final GeneratedColumn<double> weeklyOverloadHours =
      GeneratedColumn<double>(
        'weekly_overload_hours',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(35),
      );
  static const VerificationMeta _displaySizeMeta = const VerificationMeta(
    'displaySize',
  );
  @override
  late final GeneratedColumn<int> displaySize = GeneratedColumn<int>(
    'display_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _accentMeta = const VerificationMeta('accent');
  @override
  late final GeneratedColumn<int> accent = GeneratedColumn<int>(
    'accent',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(3),
  );
  static const VerificationMeta _localeCodeMeta = const VerificationMeta(
    'localeCode',
  );
  @override
  late final GeneratedColumn<String> localeCode = GeneratedColumn<String>(
    'locale_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _liquidGlassMeta = const VerificationMeta(
    'liquidGlass',
  );
  @override
  late final GeneratedColumn<bool> liquidGlass = GeneratedColumn<bool>(
    'liquid_glass',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("liquid_glass" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    hoursPerEcts,
    dailyTargetMinutes,
    firstWeekday,
    themeMode,
    paceToleranceDays,
    weeklyOverloadHours,
    displaySize,
    accent,
    localeCode,
    liquidGlass,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingsRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hours_per_ects')) {
      context.handle(
        _hoursPerEctsMeta,
        hoursPerEcts.isAcceptableOrUnknown(
          data['hours_per_ects']!,
          _hoursPerEctsMeta,
        ),
      );
    }
    if (data.containsKey('daily_target_minutes')) {
      context.handle(
        _dailyTargetMinutesMeta,
        dailyTargetMinutes.isAcceptableOrUnknown(
          data['daily_target_minutes']!,
          _dailyTargetMinutesMeta,
        ),
      );
    }
    if (data.containsKey('first_weekday')) {
      context.handle(
        _firstWeekdayMeta,
        firstWeekday.isAcceptableOrUnknown(
          data['first_weekday']!,
          _firstWeekdayMeta,
        ),
      );
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    if (data.containsKey('pace_tolerance_days')) {
      context.handle(
        _paceToleranceDaysMeta,
        paceToleranceDays.isAcceptableOrUnknown(
          data['pace_tolerance_days']!,
          _paceToleranceDaysMeta,
        ),
      );
    }
    if (data.containsKey('weekly_overload_hours')) {
      context.handle(
        _weeklyOverloadHoursMeta,
        weeklyOverloadHours.isAcceptableOrUnknown(
          data['weekly_overload_hours']!,
          _weeklyOverloadHoursMeta,
        ),
      );
    }
    if (data.containsKey('display_size')) {
      context.handle(
        _displaySizeMeta,
        displaySize.isAcceptableOrUnknown(
          data['display_size']!,
          _displaySizeMeta,
        ),
      );
    }
    if (data.containsKey('accent')) {
      context.handle(
        _accentMeta,
        accent.isAcceptableOrUnknown(data['accent']!, _accentMeta),
      );
    }
    if (data.containsKey('locale_code')) {
      context.handle(
        _localeCodeMeta,
        localeCode.isAcceptableOrUnknown(data['locale_code']!, _localeCodeMeta),
      );
    }
    if (data.containsKey('liquid_glass')) {
      context.handle(
        _liquidGlassMeta,
        liquidGlass.isAcceptableOrUnknown(
          data['liquid_glass']!,
          _liquidGlassMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      hoursPerEcts: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hours_per_ects'],
      )!,
      dailyTargetMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_target_minutes'],
      )!,
      firstWeekday: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}first_weekday'],
      )!,
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}theme_mode'],
      )!,
      paceToleranceDays: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pace_tolerance_days'],
      )!,
      weeklyOverloadHours: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weekly_overload_hours'],
      )!,
      displaySize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}display_size'],
      )!,
      accent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}accent'],
      )!,
      localeCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locale_code'],
      ),
      liquidGlass: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}liquid_glass'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class SettingsRow extends DataClass implements Insertable<SettingsRow> {
  final int id;
  final double hoursPerEcts;
  final int dailyTargetMinutes;

  /// ISO weekday 1..7 (Monday=1). Default Monday.
  final int firstWeekday;

  /// 0=system, 1=light, 2=dark.
  final int themeMode;

  /// Ahead/behind tolerance in days of current need. Default 5.
  final double paceToleranceDays;

  /// Coming-load overload cutoff in hours/week. Default 35.
  final double weeklyOverloadHours;

  /// Display size 0=compact, 1=comfortable, 2=large. Default 1.
  final int displaySize;

  /// Theme accent 0=teal, 1=forest, 2=clay, 3=slate, 4=berry. Default 3.
  final int accent;

  /// App-language code (ARB `@@locale` tag, e.g. `de`, `zh_Hans`).
  /// Null means "follow the system language". Default null.
  final String? localeCode;

  /// Liquid-glass chrome opt-in. Default false (legacy chrome).
  final bool liquidGlass;
  const SettingsRow({
    required this.id,
    required this.hoursPerEcts,
    required this.dailyTargetMinutes,
    required this.firstWeekday,
    required this.themeMode,
    required this.paceToleranceDays,
    required this.weeklyOverloadHours,
    required this.displaySize,
    required this.accent,
    this.localeCode,
    required this.liquidGlass,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hours_per_ects'] = Variable<double>(hoursPerEcts);
    map['daily_target_minutes'] = Variable<int>(dailyTargetMinutes);
    map['first_weekday'] = Variable<int>(firstWeekday);
    map['theme_mode'] = Variable<int>(themeMode);
    map['pace_tolerance_days'] = Variable<double>(paceToleranceDays);
    map['weekly_overload_hours'] = Variable<double>(weeklyOverloadHours);
    map['display_size'] = Variable<int>(displaySize);
    map['accent'] = Variable<int>(accent);
    if (!nullToAbsent || localeCode != null) {
      map['locale_code'] = Variable<String>(localeCode);
    }
    map['liquid_glass'] = Variable<bool>(liquidGlass);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      hoursPerEcts: Value(hoursPerEcts),
      dailyTargetMinutes: Value(dailyTargetMinutes),
      firstWeekday: Value(firstWeekday),
      themeMode: Value(themeMode),
      paceToleranceDays: Value(paceToleranceDays),
      weeklyOverloadHours: Value(weeklyOverloadHours),
      displaySize: Value(displaySize),
      accent: Value(accent),
      localeCode: localeCode == null && nullToAbsent
          ? const Value.absent()
          : Value(localeCode),
      liquidGlass: Value(liquidGlass),
    );
  }

  factory SettingsRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsRow(
      id: serializer.fromJson<int>(json['id']),
      hoursPerEcts: serializer.fromJson<double>(json['hoursPerEcts']),
      dailyTargetMinutes: serializer.fromJson<int>(json['dailyTargetMinutes']),
      firstWeekday: serializer.fromJson<int>(json['firstWeekday']),
      themeMode: serializer.fromJson<int>(json['themeMode']),
      paceToleranceDays: serializer.fromJson<double>(json['paceToleranceDays']),
      weeklyOverloadHours: serializer.fromJson<double>(
        json['weeklyOverloadHours'],
      ),
      displaySize: serializer.fromJson<int>(json['displaySize']),
      accent: serializer.fromJson<int>(json['accent']),
      localeCode: serializer.fromJson<String?>(json['localeCode']),
      liquidGlass: serializer.fromJson<bool>(json['liquidGlass']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hoursPerEcts': serializer.toJson<double>(hoursPerEcts),
      'dailyTargetMinutes': serializer.toJson<int>(dailyTargetMinutes),
      'firstWeekday': serializer.toJson<int>(firstWeekday),
      'themeMode': serializer.toJson<int>(themeMode),
      'paceToleranceDays': serializer.toJson<double>(paceToleranceDays),
      'weeklyOverloadHours': serializer.toJson<double>(weeklyOverloadHours),
      'displaySize': serializer.toJson<int>(displaySize),
      'accent': serializer.toJson<int>(accent),
      'localeCode': serializer.toJson<String?>(localeCode),
      'liquidGlass': serializer.toJson<bool>(liquidGlass),
    };
  }

  SettingsRow copyWith({
    int? id,
    double? hoursPerEcts,
    int? dailyTargetMinutes,
    int? firstWeekday,
    int? themeMode,
    double? paceToleranceDays,
    double? weeklyOverloadHours,
    int? displaySize,
    int? accent,
    Value<String?> localeCode = const Value.absent(),
    bool? liquidGlass,
  }) => SettingsRow(
    id: id ?? this.id,
    hoursPerEcts: hoursPerEcts ?? this.hoursPerEcts,
    dailyTargetMinutes: dailyTargetMinutes ?? this.dailyTargetMinutes,
    firstWeekday: firstWeekday ?? this.firstWeekday,
    themeMode: themeMode ?? this.themeMode,
    paceToleranceDays: paceToleranceDays ?? this.paceToleranceDays,
    weeklyOverloadHours: weeklyOverloadHours ?? this.weeklyOverloadHours,
    displaySize: displaySize ?? this.displaySize,
    accent: accent ?? this.accent,
    localeCode: localeCode.present ? localeCode.value : this.localeCode,
    liquidGlass: liquidGlass ?? this.liquidGlass,
  );
  SettingsRow copyWithCompanion(SettingsCompanion data) {
    return SettingsRow(
      id: data.id.present ? data.id.value : this.id,
      hoursPerEcts: data.hoursPerEcts.present
          ? data.hoursPerEcts.value
          : this.hoursPerEcts,
      dailyTargetMinutes: data.dailyTargetMinutes.present
          ? data.dailyTargetMinutes.value
          : this.dailyTargetMinutes,
      firstWeekday: data.firstWeekday.present
          ? data.firstWeekday.value
          : this.firstWeekday,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      paceToleranceDays: data.paceToleranceDays.present
          ? data.paceToleranceDays.value
          : this.paceToleranceDays,
      weeklyOverloadHours: data.weeklyOverloadHours.present
          ? data.weeklyOverloadHours.value
          : this.weeklyOverloadHours,
      displaySize: data.displaySize.present
          ? data.displaySize.value
          : this.displaySize,
      accent: data.accent.present ? data.accent.value : this.accent,
      localeCode: data.localeCode.present
          ? data.localeCode.value
          : this.localeCode,
      liquidGlass: data.liquidGlass.present
          ? data.liquidGlass.value
          : this.liquidGlass,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsRow(')
          ..write('id: $id, ')
          ..write('hoursPerEcts: $hoursPerEcts, ')
          ..write('dailyTargetMinutes: $dailyTargetMinutes, ')
          ..write('firstWeekday: $firstWeekday, ')
          ..write('themeMode: $themeMode, ')
          ..write('paceToleranceDays: $paceToleranceDays, ')
          ..write('weeklyOverloadHours: $weeklyOverloadHours, ')
          ..write('displaySize: $displaySize, ')
          ..write('accent: $accent, ')
          ..write('localeCode: $localeCode, ')
          ..write('liquidGlass: $liquidGlass')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    hoursPerEcts,
    dailyTargetMinutes,
    firstWeekday,
    themeMode,
    paceToleranceDays,
    weeklyOverloadHours,
    displaySize,
    accent,
    localeCode,
    liquidGlass,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsRow &&
          other.id == this.id &&
          other.hoursPerEcts == this.hoursPerEcts &&
          other.dailyTargetMinutes == this.dailyTargetMinutes &&
          other.firstWeekday == this.firstWeekday &&
          other.themeMode == this.themeMode &&
          other.paceToleranceDays == this.paceToleranceDays &&
          other.weeklyOverloadHours == this.weeklyOverloadHours &&
          other.displaySize == this.displaySize &&
          other.accent == this.accent &&
          other.localeCode == this.localeCode &&
          other.liquidGlass == this.liquidGlass);
}

class SettingsCompanion extends UpdateCompanion<SettingsRow> {
  final Value<int> id;
  final Value<double> hoursPerEcts;
  final Value<int> dailyTargetMinutes;
  final Value<int> firstWeekday;
  final Value<int> themeMode;
  final Value<double> paceToleranceDays;
  final Value<double> weeklyOverloadHours;
  final Value<int> displaySize;
  final Value<int> accent;
  final Value<String?> localeCode;
  final Value<bool> liquidGlass;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.hoursPerEcts = const Value.absent(),
    this.dailyTargetMinutes = const Value.absent(),
    this.firstWeekday = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.paceToleranceDays = const Value.absent(),
    this.weeklyOverloadHours = const Value.absent(),
    this.displaySize = const Value.absent(),
    this.accent = const Value.absent(),
    this.localeCode = const Value.absent(),
    this.liquidGlass = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.hoursPerEcts = const Value.absent(),
    this.dailyTargetMinutes = const Value.absent(),
    this.firstWeekday = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.paceToleranceDays = const Value.absent(),
    this.weeklyOverloadHours = const Value.absent(),
    this.displaySize = const Value.absent(),
    this.accent = const Value.absent(),
    this.localeCode = const Value.absent(),
    this.liquidGlass = const Value.absent(),
  });
  static Insertable<SettingsRow> custom({
    Expression<int>? id,
    Expression<double>? hoursPerEcts,
    Expression<int>? dailyTargetMinutes,
    Expression<int>? firstWeekday,
    Expression<int>? themeMode,
    Expression<double>? paceToleranceDays,
    Expression<double>? weeklyOverloadHours,
    Expression<int>? displaySize,
    Expression<int>? accent,
    Expression<String>? localeCode,
    Expression<bool>? liquidGlass,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hoursPerEcts != null) 'hours_per_ects': hoursPerEcts,
      if (dailyTargetMinutes != null)
        'daily_target_minutes': dailyTargetMinutes,
      if (firstWeekday != null) 'first_weekday': firstWeekday,
      if (themeMode != null) 'theme_mode': themeMode,
      if (paceToleranceDays != null) 'pace_tolerance_days': paceToleranceDays,
      if (weeklyOverloadHours != null)
        'weekly_overload_hours': weeklyOverloadHours,
      if (displaySize != null) 'display_size': displaySize,
      if (accent != null) 'accent': accent,
      if (localeCode != null) 'locale_code': localeCode,
      if (liquidGlass != null) 'liquid_glass': liquidGlass,
    });
  }

  SettingsCompanion copyWith({
    Value<int>? id,
    Value<double>? hoursPerEcts,
    Value<int>? dailyTargetMinutes,
    Value<int>? firstWeekday,
    Value<int>? themeMode,
    Value<double>? paceToleranceDays,
    Value<double>? weeklyOverloadHours,
    Value<int>? displaySize,
    Value<int>? accent,
    Value<String?>? localeCode,
    Value<bool>? liquidGlass,
  }) {
    return SettingsCompanion(
      id: id ?? this.id,
      hoursPerEcts: hoursPerEcts ?? this.hoursPerEcts,
      dailyTargetMinutes: dailyTargetMinutes ?? this.dailyTargetMinutes,
      firstWeekday: firstWeekday ?? this.firstWeekday,
      themeMode: themeMode ?? this.themeMode,
      paceToleranceDays: paceToleranceDays ?? this.paceToleranceDays,
      weeklyOverloadHours: weeklyOverloadHours ?? this.weeklyOverloadHours,
      displaySize: displaySize ?? this.displaySize,
      accent: accent ?? this.accent,
      localeCode: localeCode ?? this.localeCode,
      liquidGlass: liquidGlass ?? this.liquidGlass,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hoursPerEcts.present) {
      map['hours_per_ects'] = Variable<double>(hoursPerEcts.value);
    }
    if (dailyTargetMinutes.present) {
      map['daily_target_minutes'] = Variable<int>(dailyTargetMinutes.value);
    }
    if (firstWeekday.present) {
      map['first_weekday'] = Variable<int>(firstWeekday.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<int>(themeMode.value);
    }
    if (paceToleranceDays.present) {
      map['pace_tolerance_days'] = Variable<double>(paceToleranceDays.value);
    }
    if (weeklyOverloadHours.present) {
      map['weekly_overload_hours'] = Variable<double>(
        weeklyOverloadHours.value,
      );
    }
    if (displaySize.present) {
      map['display_size'] = Variable<int>(displaySize.value);
    }
    if (accent.present) {
      map['accent'] = Variable<int>(accent.value);
    }
    if (localeCode.present) {
      map['locale_code'] = Variable<String>(localeCode.value);
    }
    if (liquidGlass.present) {
      map['liquid_glass'] = Variable<bool>(liquidGlass.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('hoursPerEcts: $hoursPerEcts, ')
          ..write('dailyTargetMinutes: $dailyTargetMinutes, ')
          ..write('firstWeekday: $firstWeekday, ')
          ..write('themeMode: $themeMode, ')
          ..write('paceToleranceDays: $paceToleranceDays, ')
          ..write('weeklyOverloadHours: $weeklyOverloadHours, ')
          ..write('displaySize: $displaySize, ')
          ..write('accent: $accent, ')
          ..write('localeCode: $localeCode, ')
          ..write('liquidGlass: $liquidGlass')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CoursesTable courses = $CoursesTable(this);
  late final $StudySessionsTable studySessions = $StudySessionsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    courses,
    studySessions,
    settings,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'courses',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('study_sessions', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CoursesTableCreateCompanionBuilder = CoursesCompanion Function({
  Value<int> id,
  required String name,
  required double ectsCredits,
  Value<DateTime?> startDate,
  Value<DateTime?> deadline,
  Value<String?> notes,
  Value<int?> colorValue,
  Value<bool> isSample,
  Value<bool> startEarly,
});
typedef $$CoursesTableUpdateCompanionBuilder = CoursesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<double> ectsCredits,
  Value<DateTime?> startDate,
  Value<DateTime?> deadline,
  Value<String?> notes,
  Value<int?> colorValue,
  Value<bool> isSample,
  Value<bool> startEarly,
});

final class $$CoursesTableReferences
    extends BaseReferences<_$AppDatabase, $CoursesTable, CourseRow> {
  $$CoursesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StudySessionsTable, List<SessionRow>>
  _studySessionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.studySessions,
    aliasName: 'courses__id__study_sessions__course_id',
  );

  $$StudySessionsTableProcessedTableManager get studySessionsRefs {
    final manager = $$StudySessionsTableTableManager(
      $_db,
      $_db.studySessions,
    ).filter((f) => f.courseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studySessionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CoursesTableFilterComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ectsCredits => $composableBuilder(
    column: $table.ectsCredits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSample => $composableBuilder(
    column: $table.isSample,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get startEarly => $composableBuilder(
    column: $table.startEarly,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> studySessionsRefs(
    Expression<bool> Function($$StudySessionsTableFilterComposer f) f,
  ) {
    final $$StudySessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studySessions,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudySessionsTableFilterComposer(
            $db: $db,
            $table: $db.studySessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CoursesTableOrderingComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ectsCredits => $composableBuilder(
    column: $table.ectsCredits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSample => $composableBuilder(
    column: $table.isSample,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get startEarly => $composableBuilder(
    column: $table.startEarly,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CoursesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get ectsCredits => $composableBuilder(
    column: $table.ectsCredits,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSample =>
      $composableBuilder(column: $table.isSample, builder: (column) => column);

  GeneratedColumn<bool> get startEarly => $composableBuilder(
    column: $table.startEarly,
    builder: (column) => column,
  );

  Expression<T> studySessionsRefs<T extends Object>(
    Expression<T> Function($$StudySessionsTableAnnotationComposer a) f,
  ) {
    final $$StudySessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studySessions,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudySessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.studySessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CoursesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CoursesTable,
          CourseRow,
          $$CoursesTableFilterComposer,
          $$CoursesTableOrderingComposer,
          $$CoursesTableAnnotationComposer,
          $$CoursesTableCreateCompanionBuilder,
          $$CoursesTableUpdateCompanionBuilder,
          (CourseRow, $$CoursesTableReferences),
          CourseRow,
          PrefetchHooks Function({bool studySessionsRefs})
        > {
  $$CoursesTableTableManager(_$AppDatabase db, $CoursesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoursesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoursesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoursesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> ectsCredits = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<bool> isSample = const Value.absent(),
                Value<bool> startEarly = const Value.absent(),
              }) => CoursesCompanion(
                id: id,
                name: name,
                ectsCredits: ectsCredits,
                startDate: startDate,
                deadline: deadline,
                notes: notes,
                colorValue: colorValue,
                isSample: isSample,
                startEarly: startEarly,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double ectsCredits,
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<bool> isSample = const Value.absent(),
                Value<bool> startEarly = const Value.absent(),
              }) => CoursesCompanion.insert(
                id: id,
                name: name,
                ectsCredits: ectsCredits,
                startDate: startDate,
                deadline: deadline,
                notes: notes,
                colorValue: colorValue,
                isSample: isSample,
                startEarly: startEarly,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CoursesTable, CourseRow>(table),
                  $$CoursesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({studySessionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (studySessionsRefs) db.studySessions,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (studySessionsRefs)
                    await $_getPrefetchedDataByColumns<
                      CourseRow,
                      $CoursesTable,
                      SessionRow,
                      $StudySessionsTable
                    >(
                      currentTable: table,
                      referencedTable: $$CoursesTableReferences
                          ._studySessionsRefsTable(db),
                      managerFromTypedResult: (p0) => $$CoursesTableReferences(
                        db,
                        table,
                        p0,
                      ).studySessionsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'course_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CoursesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CoursesTable,
      CourseRow,
      $$CoursesTableFilterComposer,
      $$CoursesTableOrderingComposer,
      $$CoursesTableAnnotationComposer,
      $$CoursesTableCreateCompanionBuilder,
      $$CoursesTableUpdateCompanionBuilder,
      (CourseRow, $$CoursesTableReferences),
      CourseRow,
      PrefetchHooks Function({bool studySessionsRefs})
    >;
typedef $$StudySessionsTableCreateCompanionBuilder =
    StudySessionsCompanion Function({
      Value<int> id,
      required int courseId,
      required int minutes,
      required DateTime date,
      Value<String?> notes,
      Value<bool> isSample,
    });
typedef $$StudySessionsTableUpdateCompanionBuilder =
    StudySessionsCompanion Function({
      Value<int> id,
      Value<int> courseId,
      Value<int> minutes,
      Value<DateTime> date,
      Value<String?> notes,
      Value<bool> isSample,
    });

final class $$StudySessionsTableReferences
    extends BaseReferences<_$AppDatabase, $StudySessionsTable, SessionRow> {
  $$StudySessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CoursesTable _courseIdTable(_$AppDatabase db) =>
      db.courses.createAlias('study_sessions__course_id__courses__id');

  $$CoursesTableProcessedTableManager get courseId {
    final $_column = $_itemColumn<int>('course_id')!;

    final manager = $$CoursesTableTableManager(
      $_db,
      $_db.courses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_courseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StudySessionsTableFilterComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutes => $composableBuilder(
    column: $table.minutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSample => $composableBuilder(
    column: $table.isSample,
    builder: (column) => ColumnFilters(column),
  );

  $$CoursesTableFilterComposer get courseId {
    final $$CoursesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoursesTableFilterComposer(
            $db: $db,
            $table: $db.courses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudySessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutes => $composableBuilder(
    column: $table.minutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSample => $composableBuilder(
    column: $table.isSample,
    builder: (column) => ColumnOrderings(column),
  );

  $$CoursesTableOrderingComposer get courseId {
    final $$CoursesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoursesTableOrderingComposer(
            $db: $db,
            $table: $db.courses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudySessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get minutes =>
      $composableBuilder(column: $table.minutes, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isSample =>
      $composableBuilder(column: $table.isSample, builder: (column) => column);

  $$CoursesTableAnnotationComposer get courseId {
    final $$CoursesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoursesTableAnnotationComposer(
            $db: $db,
            $table: $db.courses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudySessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudySessionsTable,
          SessionRow,
          $$StudySessionsTableFilterComposer,
          $$StudySessionsTableOrderingComposer,
          $$StudySessionsTableAnnotationComposer,
          $$StudySessionsTableCreateCompanionBuilder,
          $$StudySessionsTableUpdateCompanionBuilder,
          (SessionRow, $$StudySessionsTableReferences),
          SessionRow,
          PrefetchHooks Function({bool courseId})
        > {
  $$StudySessionsTableTableManager(_$AppDatabase db, $StudySessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudySessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudySessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudySessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> courseId = const Value.absent(),
                Value<int> minutes = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isSample = const Value.absent(),
              }) => StudySessionsCompanion(
                id: id,
                courseId: courseId,
                minutes: minutes,
                date: date,
                notes: notes,
                isSample: isSample,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int courseId,
                required int minutes,
                required DateTime date,
                Value<String?> notes = const Value.absent(),
                Value<bool> isSample = const Value.absent(),
              }) => StudySessionsCompanion.insert(
                id: id,
                courseId: courseId,
                minutes: minutes,
                date: date,
                notes: notes,
                isSample: isSample,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StudySessionsTable, SessionRow>(table),
                  $$StudySessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({courseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (courseId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.courseId,
                        referencedTable: $$StudySessionsTableReferences
                            ._courseIdTable(db),
                        referencedColumn: $$StudySessionsTableReferences
                            ._courseIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StudySessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudySessionsTable,
      SessionRow,
      $$StudySessionsTableFilterComposer,
      $$StudySessionsTableOrderingComposer,
      $$StudySessionsTableAnnotationComposer,
      $$StudySessionsTableCreateCompanionBuilder,
      $$StudySessionsTableUpdateCompanionBuilder,
      (SessionRow, $$StudySessionsTableReferences),
      SessionRow,
      PrefetchHooks Function({bool courseId})
    >;
typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<double> hoursPerEcts,
  Value<int> dailyTargetMinutes,
  Value<int> firstWeekday,
  Value<int> themeMode,
  Value<double> paceToleranceDays,
  Value<double> weeklyOverloadHours,
  Value<int> displaySize,
  Value<int> accent,
  Value<String?> localeCode,
  Value<bool> liquidGlass,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<double> hoursPerEcts,
  Value<int> dailyTargetMinutes,
  Value<int> firstWeekday,
  Value<int> themeMode,
  Value<double> paceToleranceDays,
  Value<double> weeklyOverloadHours,
  Value<int> displaySize,
  Value<int> accent,
  Value<String?> localeCode,
  Value<bool> liquidGlass,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hoursPerEcts => $composableBuilder(
    column: $table.hoursPerEcts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyTargetMinutes => $composableBuilder(
    column: $table.dailyTargetMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get firstWeekday => $composableBuilder(
    column: $table.firstWeekday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get paceToleranceDays => $composableBuilder(
    column: $table.paceToleranceDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weeklyOverloadHours => $composableBuilder(
    column: $table.weeklyOverloadHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get displaySize => $composableBuilder(
    column: $table.displaySize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accent => $composableBuilder(
    column: $table.accent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get liquidGlass => $composableBuilder(
    column: $table.liquidGlass,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hoursPerEcts => $composableBuilder(
    column: $table.hoursPerEcts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyTargetMinutes => $composableBuilder(
    column: $table.dailyTargetMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get firstWeekday => $composableBuilder(
    column: $table.firstWeekday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get paceToleranceDays => $composableBuilder(
    column: $table.paceToleranceDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weeklyOverloadHours => $composableBuilder(
    column: $table.weeklyOverloadHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get displaySize => $composableBuilder(
    column: $table.displaySize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accent => $composableBuilder(
    column: $table.accent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get liquidGlass => $composableBuilder(
    column: $table.liquidGlass,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get hoursPerEcts => $composableBuilder(
    column: $table.hoursPerEcts,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dailyTargetMinutes => $composableBuilder(
    column: $table.dailyTargetMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get firstWeekday => $composableBuilder(
    column: $table.firstWeekday,
    builder: (column) => column,
  );

  GeneratedColumn<int> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<double> get paceToleranceDays => $composableBuilder(
    column: $table.paceToleranceDays,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weeklyOverloadHours => $composableBuilder(
    column: $table.weeklyOverloadHours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get displaySize => $composableBuilder(
    column: $table.displaySize,
    builder: (column) => column,
  );

  GeneratedColumn<int> get accent =>
      $composableBuilder(column: $table.accent, builder: (column) => column);

  GeneratedColumn<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get liquidGlass => $composableBuilder(
    column: $table.liquidGlass,
    builder: (column) => column,
  );
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          SettingsRow,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (
            SettingsRow,
            BaseReferences<_$AppDatabase, $SettingsTable, SettingsRow>,
          ),
          SettingsRow,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> hoursPerEcts = const Value.absent(),
                Value<int> dailyTargetMinutes = const Value.absent(),
                Value<int> firstWeekday = const Value.absent(),
                Value<int> themeMode = const Value.absent(),
                Value<double> paceToleranceDays = const Value.absent(),
                Value<double> weeklyOverloadHours = const Value.absent(),
                Value<int> displaySize = const Value.absent(),
                Value<int> accent = const Value.absent(),
                Value<String?> localeCode = const Value.absent(),
                Value<bool> liquidGlass = const Value.absent(),
              }) => SettingsCompanion(
                id: id,
                hoursPerEcts: hoursPerEcts,
                dailyTargetMinutes: dailyTargetMinutes,
                firstWeekday: firstWeekday,
                themeMode: themeMode,
                paceToleranceDays: paceToleranceDays,
                weeklyOverloadHours: weeklyOverloadHours,
                displaySize: displaySize,
                accent: accent,
                localeCode: localeCode,
                liquidGlass: liquidGlass,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> hoursPerEcts = const Value.absent(),
                Value<int> dailyTargetMinutes = const Value.absent(),
                Value<int> firstWeekday = const Value.absent(),
                Value<int> themeMode = const Value.absent(),
                Value<double> paceToleranceDays = const Value.absent(),
                Value<double> weeklyOverloadHours = const Value.absent(),
                Value<int> displaySize = const Value.absent(),
                Value<int> accent = const Value.absent(),
                Value<String?> localeCode = const Value.absent(),
                Value<bool> liquidGlass = const Value.absent(),
              }) => SettingsCompanion.insert(
                id: id,
                hoursPerEcts: hoursPerEcts,
                dailyTargetMinutes: dailyTargetMinutes,
                firstWeekday: firstWeekday,
                themeMode: themeMode,
                paceToleranceDays: paceToleranceDays,
                weeklyOverloadHours: weeklyOverloadHours,
                displaySize: displaySize,
                accent: accent,
                localeCode: localeCode,
                liquidGlass: liquidGlass,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsTable, SettingsRow>(table),
                  BaseReferences<_$AppDatabase, $SettingsTable, SettingsRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      SettingsRow,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (SettingsRow, BaseReferences<_$AppDatabase, $SettingsTable, SettingsRow>),
      SettingsRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CoursesTableTableManager get courses =>
      $$CoursesTableTableManager(_db, _db.courses);
  $$StudySessionsTableTableManager get studySessions =>
      $$StudySessionsTableTableManager(_db, _db.studySessions);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
