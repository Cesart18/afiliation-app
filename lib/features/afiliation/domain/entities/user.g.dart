// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserCollection on Isar {
  IsarCollection<User> get users => this.collection();
}

const UserSchema = CollectionSchema(
  name: r'User',
  id: -7838171048429979076,
  properties: {
    r'firstName': PropertySchema(
      id: 0,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'isDoctor': PropertySchema(
      id: 1,
      name: r'isDoctor',
      type: IsarType.bool,
    ),
    r'lastName': PropertySchema(
      id: 2,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'nationalId': PropertySchema(
      id: 3,
      name: r'nationalId',
      type: IsarType.string,
    )
  },
  estimateSize: _userEstimateSize,
  serialize: _userSerialize,
  deserialize: _userDeserialize,
  deserializeProp: _userDeserializeProp,
  idName: r'id',
  indexes: {
    r'nationalId': IndexSchema(
      id: -5894875709063437769,
      name: r'nationalId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nationalId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'historial': LinkSchema(
      id: 8571192864059613835,
      name: r'historial',
      target: r'UserHistorial',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _userGetId,
  getLinks: _userGetLinks,
  attach: _userAttach,
  version: '3.1.0+1',
);

int _userEstimateSize(
  User object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.firstName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nationalId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userSerialize(
  User object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.firstName);
  writer.writeBool(offsets[1], object.isDoctor);
  writer.writeString(offsets[2], object.lastName);
  writer.writeString(offsets[3], object.nationalId);
}

User _userDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = User(
    firstName: reader.readStringOrNull(offsets[0]),
    id: id,
    isDoctor: reader.readBoolOrNull(offsets[1]),
    lastName: reader.readStringOrNull(offsets[2]),
    nationalId: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _userDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userGetId(User object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _userGetLinks(User object) {
  return [object.historial];
}

void _userAttach(IsarCollection<dynamic> col, Id id, User object) {
  object.id = id;
  object.historial
      .attach(col, col.isar.collection<UserHistorial>(), r'historial', id);
}

extension UserByIndex on IsarCollection<User> {
  Future<User?> getByNationalId(String? nationalId) {
    return getByIndex(r'nationalId', [nationalId]);
  }

  User? getByNationalIdSync(String? nationalId) {
    return getByIndexSync(r'nationalId', [nationalId]);
  }

  Future<bool> deleteByNationalId(String? nationalId) {
    return deleteByIndex(r'nationalId', [nationalId]);
  }

  bool deleteByNationalIdSync(String? nationalId) {
    return deleteByIndexSync(r'nationalId', [nationalId]);
  }

  Future<List<User?>> getAllByNationalId(List<String?> nationalIdValues) {
    final values = nationalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'nationalId', values);
  }

  List<User?> getAllByNationalIdSync(List<String?> nationalIdValues) {
    final values = nationalIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'nationalId', values);
  }

  Future<int> deleteAllByNationalId(List<String?> nationalIdValues) {
    final values = nationalIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'nationalId', values);
  }

  int deleteAllByNationalIdSync(List<String?> nationalIdValues) {
    final values = nationalIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'nationalId', values);
  }

  Future<Id> putByNationalId(User object) {
    return putByIndex(r'nationalId', object);
  }

  Id putByNationalIdSync(User object, {bool saveLinks = true}) {
    return putByIndexSync(r'nationalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNationalId(List<User> objects) {
    return putAllByIndex(r'nationalId', objects);
  }

  List<Id> putAllByNationalIdSync(List<User> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'nationalId', objects, saveLinks: saveLinks);
  }
}

extension UserQueryWhereSort on QueryBuilder<User, User, QWhere> {
  QueryBuilder<User, User, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserQueryWhere on QueryBuilder<User, User, QWhereClause> {
  QueryBuilder<User, User, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> nationalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nationalId',
        value: [null],
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> nationalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nationalId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> nationalIdEqualTo(
      String? nationalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nationalId',
        value: [nationalId],
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> nationalIdNotEqualTo(
      String? nationalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalId',
              lower: [],
              upper: [nationalId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalId',
              lower: [nationalId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalId',
              lower: [nationalId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalId',
              lower: [],
              upper: [nationalId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UserQueryFilter on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> firstNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> isDoctorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isDoctor',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> isDoctorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isDoctor',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> isDoctorEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDoctor',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nationalId',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nationalId',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nationalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nationalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nationalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nationalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nationalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nationalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nationalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalId',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nationalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nationalId',
        value: '',
      ));
    });
  }
}

extension UserQueryObject on QueryBuilder<User, User, QFilterCondition> {}

extension UserQueryLinks on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> historial(
      FilterQuery<UserHistorial> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'historial');
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> historialLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'historial', length, true, length, true);
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> historialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'historial', 0, true, 0, true);
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> historialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'historial', 0, false, 999999, true);
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> historialLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'historial', 0, true, length, include);
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> historialLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'historial', length, include, 999999, true);
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> historialLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'historial', lower, includeLower, upper, includeUpper);
    });
  }
}

extension UserQuerySortBy on QueryBuilder<User, User, QSortBy> {
  QueryBuilder<User, User, QAfterSortBy> sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByIsDoctor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDoctor', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByIsDoctorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDoctor', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByNationalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalId', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByNationalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalId', Sort.desc);
    });
  }
}

extension UserQuerySortThenBy on QueryBuilder<User, User, QSortThenBy> {
  QueryBuilder<User, User, QAfterSortBy> thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIsDoctor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDoctor', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIsDoctorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDoctor', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByNationalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalId', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByNationalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalId', Sort.desc);
    });
  }
}

extension UserQueryWhereDistinct on QueryBuilder<User, User, QDistinct> {
  QueryBuilder<User, User, QDistinct> distinctByFirstName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByIsDoctor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDoctor');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByLastName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByNationalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nationalId', caseSensitive: caseSensitive);
    });
  }
}

extension UserQueryProperty on QueryBuilder<User, User, QQueryProperty> {
  QueryBuilder<User, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<User, bool?, QQueryOperations> isDoctorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDoctor');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> nationalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nationalId');
    });
  }
}
