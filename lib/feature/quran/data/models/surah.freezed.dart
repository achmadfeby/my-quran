// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'surah.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SurahModel {
  int get number;
  String get englishName;
  int get numberOfAyahs;
  String get englishNameTranslation;

  /// Create a copy of SurahModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SurahModelCopyWith<SurahModel> get copyWith =>
      _$SurahModelCopyWithImpl<SurahModel>(this as SurahModel, _$identity);

  /// Serializes this SurahModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SurahModel &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.numberOfAyahs, numberOfAyahs) ||
                other.numberOfAyahs == numberOfAyahs) &&
            (identical(other.englishNameTranslation, englishNameTranslation) ||
                other.englishNameTranslation == englishNameTranslation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, number, englishName, numberOfAyahs, englishNameTranslation);

  @override
  String toString() {
    return 'SurahModel(number: $number, englishName: $englishName, numberOfAyahs: $numberOfAyahs, englishNameTranslation: $englishNameTranslation)';
  }
}

/// @nodoc
abstract mixin class $SurahModelCopyWith<$Res> {
  factory $SurahModelCopyWith(
          SurahModel value, $Res Function(SurahModel) _then) =
      _$SurahModelCopyWithImpl;
  @useResult
  $Res call(
      {int number,
      String englishName,
      int numberOfAyahs,
      String englishNameTranslation});
}

/// @nodoc
class _$SurahModelCopyWithImpl<$Res> implements $SurahModelCopyWith<$Res> {
  _$SurahModelCopyWithImpl(this._self, this._then);

  final SurahModel _self;
  final $Res Function(SurahModel) _then;

  /// Create a copy of SurahModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? englishName = null,
    Object? numberOfAyahs = null,
    Object? englishNameTranslation = null,
  }) {
    return _then(_self.copyWith(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      englishName: null == englishName
          ? _self.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfAyahs: null == numberOfAyahs
          ? _self.numberOfAyahs
          : numberOfAyahs // ignore: cast_nullable_to_non_nullable
              as int,
      englishNameTranslation: null == englishNameTranslation
          ? _self.englishNameTranslation
          : englishNameTranslation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SurahModel].
extension SurahModelPatterns on SurahModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SurahModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SurahModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SurahModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SurahModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SurahModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SurahModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int number, String englishName, int numberOfAyahs,
            String englishNameTranslation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SurahModel() when $default != null:
        return $default(_that.number, _that.englishName, _that.numberOfAyahs,
            _that.englishNameTranslation);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int number, String englishName, int numberOfAyahs,
            String englishNameTranslation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SurahModel():
        return $default(_that.number, _that.englishName, _that.numberOfAyahs,
            _that.englishNameTranslation);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int number, String englishName, int numberOfAyahs,
            String englishNameTranslation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SurahModel() when $default != null:
        return $default(_that.number, _that.englishName, _that.numberOfAyahs,
            _that.englishNameTranslation);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SurahModel implements SurahModel {
  const _SurahModel(
      {required this.number,
      required this.englishName,
      required this.numberOfAyahs,
      required this.englishNameTranslation});
  factory _SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);

  @override
  final int number;
  @override
  final String englishName;
  @override
  final int numberOfAyahs;
  @override
  final String englishNameTranslation;

  /// Create a copy of SurahModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SurahModelCopyWith<_SurahModel> get copyWith =>
      __$SurahModelCopyWithImpl<_SurahModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SurahModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SurahModel &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.numberOfAyahs, numberOfAyahs) ||
                other.numberOfAyahs == numberOfAyahs) &&
            (identical(other.englishNameTranslation, englishNameTranslation) ||
                other.englishNameTranslation == englishNameTranslation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, number, englishName, numberOfAyahs, englishNameTranslation);

  @override
  String toString() {
    return 'SurahModel(number: $number, englishName: $englishName, numberOfAyahs: $numberOfAyahs, englishNameTranslation: $englishNameTranslation)';
  }
}

/// @nodoc
abstract mixin class _$SurahModelCopyWith<$Res>
    implements $SurahModelCopyWith<$Res> {
  factory _$SurahModelCopyWith(
          _SurahModel value, $Res Function(_SurahModel) _then) =
      __$SurahModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int number,
      String englishName,
      int numberOfAyahs,
      String englishNameTranslation});
}

/// @nodoc
class __$SurahModelCopyWithImpl<$Res> implements _$SurahModelCopyWith<$Res> {
  __$SurahModelCopyWithImpl(this._self, this._then);

  final _SurahModel _self;
  final $Res Function(_SurahModel) _then;

  /// Create a copy of SurahModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? number = null,
    Object? englishName = null,
    Object? numberOfAyahs = null,
    Object? englishNameTranslation = null,
  }) {
    return _then(_SurahModel(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      englishName: null == englishName
          ? _self.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfAyahs: null == numberOfAyahs
          ? _self.numberOfAyahs
          : numberOfAyahs // ignore: cast_nullable_to_non_nullable
              as int,
      englishNameTranslation: null == englishNameTranslation
          ? _self.englishNameTranslation
          : englishNameTranslation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
