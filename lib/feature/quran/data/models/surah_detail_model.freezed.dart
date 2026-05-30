// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'surah_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SurahDetailModel {
  int get number;
  String get englishName;
  List<AyahModel> get ayahs;

  /// Create a copy of SurahDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SurahDetailModelCopyWith<SurahDetailModel> get copyWith =>
      _$SurahDetailModelCopyWithImpl<SurahDetailModel>(
          this as SurahDetailModel, _$identity);

  /// Serializes this SurahDetailModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SurahDetailModel &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            const DeepCollectionEquality().equals(other.ayahs, ayahs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, englishName,
      const DeepCollectionEquality().hash(ayahs));

  @override
  String toString() {
    return 'SurahDetailModel(number: $number, englishName: $englishName, ayahs: $ayahs)';
  }
}

/// @nodoc
abstract mixin class $SurahDetailModelCopyWith<$Res> {
  factory $SurahDetailModelCopyWith(
          SurahDetailModel value, $Res Function(SurahDetailModel) _then) =
      _$SurahDetailModelCopyWithImpl;
  @useResult
  $Res call({int number, String englishName, List<AyahModel> ayahs});
}

/// @nodoc
class _$SurahDetailModelCopyWithImpl<$Res>
    implements $SurahDetailModelCopyWith<$Res> {
  _$SurahDetailModelCopyWithImpl(this._self, this._then);

  final SurahDetailModel _self;
  final $Res Function(SurahDetailModel) _then;

  /// Create a copy of SurahDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? englishName = null,
    Object? ayahs = null,
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
      ayahs: null == ayahs
          ? _self.ayahs
          : ayahs // ignore: cast_nullable_to_non_nullable
              as List<AyahModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SurahDetailModel].
extension SurahDetailModelPatterns on SurahDetailModel {
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
    TResult Function(_SurahDetailModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SurahDetailModel() when $default != null:
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
    TResult Function(_SurahDetailModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SurahDetailModel():
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
    TResult? Function(_SurahDetailModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SurahDetailModel() when $default != null:
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
    TResult Function(int number, String englishName, List<AyahModel> ayahs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SurahDetailModel() when $default != null:
        return $default(_that.number, _that.englishName, _that.ayahs);
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
    TResult Function(int number, String englishName, List<AyahModel> ayahs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SurahDetailModel():
        return $default(_that.number, _that.englishName, _that.ayahs);
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
    TResult? Function(int number, String englishName, List<AyahModel> ayahs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SurahDetailModel() when $default != null:
        return $default(_that.number, _that.englishName, _that.ayahs);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SurahDetailModel implements SurahDetailModel {
  const _SurahDetailModel(
      {required this.number,
      required this.englishName,
      required final List<AyahModel> ayahs})
      : _ayahs = ayahs;
  factory _SurahDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SurahDetailModelFromJson(json);

  @override
  final int number;
  @override
  final String englishName;
  final List<AyahModel> _ayahs;
  @override
  List<AyahModel> get ayahs {
    if (_ayahs is EqualUnmodifiableListView) return _ayahs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ayahs);
  }

  /// Create a copy of SurahDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SurahDetailModelCopyWith<_SurahDetailModel> get copyWith =>
      __$SurahDetailModelCopyWithImpl<_SurahDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SurahDetailModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SurahDetailModel &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            const DeepCollectionEquality().equals(other._ayahs, _ayahs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, englishName,
      const DeepCollectionEquality().hash(_ayahs));

  @override
  String toString() {
    return 'SurahDetailModel(number: $number, englishName: $englishName, ayahs: $ayahs)';
  }
}

/// @nodoc
abstract mixin class _$SurahDetailModelCopyWith<$Res>
    implements $SurahDetailModelCopyWith<$Res> {
  factory _$SurahDetailModelCopyWith(
          _SurahDetailModel value, $Res Function(_SurahDetailModel) _then) =
      __$SurahDetailModelCopyWithImpl;
  @override
  @useResult
  $Res call({int number, String englishName, List<AyahModel> ayahs});
}

/// @nodoc
class __$SurahDetailModelCopyWithImpl<$Res>
    implements _$SurahDetailModelCopyWith<$Res> {
  __$SurahDetailModelCopyWithImpl(this._self, this._then);

  final _SurahDetailModel _self;
  final $Res Function(_SurahDetailModel) _then;

  /// Create a copy of SurahDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? number = null,
    Object? englishName = null,
    Object? ayahs = null,
  }) {
    return _then(_SurahDetailModel(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      englishName: null == englishName
          ? _self.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      ayahs: null == ayahs
          ? _self._ayahs
          : ayahs // ignore: cast_nullable_to_non_nullable
              as List<AyahModel>,
    ));
  }
}

// dart format on
