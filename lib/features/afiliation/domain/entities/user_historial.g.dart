// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_historial.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserHistorialCollection on Isar {
  IsarCollection<UserHistorial> get userHistorials => this.collection();
}

const UserHistorialSchema = CollectionSchema(
  name: r'UserHistorial',
  id: -7319258772363455131,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'billNumber': PropertySchema(
      id: 1,
      name: r'billNumber',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _userHistorialEstimateSize,
  serialize: _userHistorialSerialize,
  deserialize: _userHistorialDeserialize,
  deserializeProp: _userHistorialDeserializeProp,
  idName: r'id',
  indexes: {
    r'billNumber': IndexSchema(
      id: 1059943391792785230,
      name: r'billNumber',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'billNumber',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'user': LinkSchema(
      id: 9096105637217062385,
      name: r'user',
      target: r'User',
      single: true,
      linkName: r'historial',
    )
  },
  embeddedSchemas: {},
  getId: _userHistorialGetId,
  getLinks: _userHistorialGetLinks,
  attach: _userHistorialAttach,
  version: '3.1.0+1',
);

int _userHistorialEstimateSize(
  UserHistorial object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.billNumber.length * 3;
  return bytesCount;
}

void _userHistorialSerialize(
  UserHistorial object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.billNumber);
  writer.writeDateTime(offsets[2], object.date);
}

UserHistorial _userHistorialDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserHistorial();
  object.amount = reader.readDouble(offsets[0]);
  object.billNumber = reader.readString(offsets[1]);
  object.date = reader.readDateTime(offsets[2]);
  object.id = id;
  return object;
}

P _userHistorialDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userHistorialGetId(UserHistorial object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _userHistorialGetLinks(UserHistorial object) {
  return [object.user];
}

void _userHistorialAttach(
    IsarCollection<dynamic> col, Id id, UserHistorial object) {
  object.id = id;
  object.user.attach(col, col.isar.collection<User>(), r'user', id);
}

extension UserHistorialByIndex on IsarCollection<UserHistorial> {
  Future<UserHistorial?> getByBillNumber(String billNumber) {
    return getByIndex(r'billNumber', [billNumber]);
  }

  UserHistorial? getByBillNumberSync(String billNumber) {
    return getByIndexSync(r'billNumber', [billNumber]);
  }

  Future<bool> deleteByBillNumber(String billNumber) {
    return deleteByIndex(r'billNumber', [billNumber]);
  }

  bool deleteByBillNumberSync(String billNumber) {
    return deleteByIndexSync(r'billNumber', [billNumber]);
  }

  Future<List<UserHistorial?>> getAllByBillNumber(
      List<String> billNumberValues) {
    final values = billNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'billNumber', values);
  }

  List<UserHistorial?> getAllByBillNumberSync(List<String> billNumberValues) {
    final values = billNumberValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'billNumber', values);
  }

  Future<int> deleteAllByBillNumber(List<String> billNumberValues) {
    final values = billNumberValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'billNumber', values);
  }

  int deleteAllByBillNumberSync(List<String> billNumberValues) {
    final values = billNumberValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'billNumber', values);
  }

  Future<Id> putByBillNumber(UserHistorial object) {
    return putByIndex(r'billNumber', object);
  }

  Id putByBillNumberSync(UserHistorial object, {bool saveLinks = true}) {
    return putByIndexSync(r'billNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBillNumber(List<UserHistorial> objects) {
    return putAllByIndex(r'billNumber', objects);
  }

  List<Id> putAllByBillNumberSync(List<UserHistorial> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'billNumber', objects, saveLinks: saveLinks);
  }
}

extension UserHistorialQueryWhereSort
    on QueryBuilder<UserHistorial, UserHistorial, QWhere> {
  QueryBuilder<UserHistorial, UserHistorial, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserHistorialQueryWhere
    on QueryBuilder<UserHistorial, UserHistorial, QWhereClause> {
  QueryBuilder<UserHistorial, UserHistorial, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<UserHistorial, UserHistorial, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterWhereClause> idBetween(
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

  QueryBuilder<UserHistorial, UserHistorial, QAfterWhereClause>
      billNumberEqualTo(String billNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'billNumber',
        value: [billNumber],
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterWhereClause>
      billNumberNotEqualTo(String billNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'billNumber',
              lower: [],
              upper: [billNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'billNumber',
              lower: [billNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'billNumber',
              lower: [billNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'billNumber',
              lower: [],
              upper: [billNumber],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UserHistorialQueryFilter
    on QueryBuilder<UserHistorial, UserHistorial, QFilterCondition> {
  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      billNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      billNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'billNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      billNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'billNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      billNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'billNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      billNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'billNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      billNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'billNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      billNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'billNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      billNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'billNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      billNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      billNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'billNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition> idBetween(
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
}

extension UserHistorialQueryObject
    on QueryBuilder<UserHistorial, UserHistorial, QFilterCondition> {}

extension UserHistorialQueryLinks
    on QueryBuilder<UserHistorial, UserHistorial, QFilterCondition> {
  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition> user(
      FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterFilterCondition>
      userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }
}

extension UserHistorialQuerySortBy
    on QueryBuilder<UserHistorial, UserHistorial, QSortBy> {
  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> sortByBillNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billNumber', Sort.asc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy>
      sortByBillNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billNumber', Sort.desc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }
}

extension UserHistorialQuerySortThenBy
    on QueryBuilder<UserHistorial, UserHistorial, QSortThenBy> {
  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> thenByBillNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billNumber', Sort.asc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy>
      thenByBillNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billNumber', Sort.desc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension UserHistorialQueryWhereDistinct
    on QueryBuilder<UserHistorial, UserHistorial, QDistinct> {
  QueryBuilder<UserHistorial, UserHistorial, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QDistinct> distinctByBillNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'billNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserHistorial, UserHistorial, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }
}

extension UserHistorialQueryProperty
    on QueryBuilder<UserHistorial, UserHistorial, QQueryProperty> {
  QueryBuilder<UserHistorial, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserHistorial, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<UserHistorial, String, QQueryOperations> billNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billNumber');
    });
  }

  QueryBuilder<UserHistorial, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }
}
