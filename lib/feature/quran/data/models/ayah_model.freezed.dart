// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ayah_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AyahModel {
  int get numberInSurah;
  String get text;
  String get audio;

  /// Create a copy of AyahModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AyahModelCopyWith<AyahModel> get copyWith =>
      _$AyahModelCopyWithImpl<AyahModel>(this as AyahModel, _$identity);

  /// Serializes this AyahModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AyahModel &&
            (identical(other.numberInSurah, numberInSurah) ||
                other.numberInSurah == numberInSurah) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, numberInSurah, text, audio);

  @override
  String toString() {
    return 'AyahModel(numberInSurah: $numberInSurah, text: $text, audio: $audio)';
  }
}

/// @nodoc
abstract mixin class $AyahModelCopyWith<$Res> {
  factory $AyahModelCopyWith(AyahModel value, $Res Function(AyahModel) _then) =
      _$AyahModelCopyWithImpl;
  @useResult
  $Res call({int numberInSurah, String text, String audio});
}

/// @nodoc
class _$AyahModelCopyWithImpl<$Res> implements $AyahModelCopyWith<$Res> {
  _$AyahModelCopyWithImpl(this._self, this._then);

  final AyahModel _self;
  final $Res Function(AyahModel) _then;

  /// Create a copy of AyahModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberInSurah = null,
    Object? text = null,
    Object? audio = null,
  }) {
    return _then(_self.copyWith(
      numberInSurah: null == numberInSurah
          ? _self.numberInSurah
          : numberInSurah // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AyahModel].
extension AyahModelPatterns on AyahModel {
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
    TResult Function(_AyahModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AyahModel() when $default != null:
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
    TResult Function(_AyahModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AyahModel():
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
    TResult? Function(_AyahModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AyahModel() when $default != null:
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
    TResult Function(int numberInSurah, String text, String audio)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AyahModel() when $default != null:
        return $default(_that.numberInSurah, _that.text, _that.audio);
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
    TResult Function(int numberInSurah, String text, String audio) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AyahModel():
        return $default(_that.numberInSurah, _that.text, _that.audio);
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
    TResult? Function(int numberInSurah, String text, String audio)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AyahModel() when $default != null:
        return $default(_that.numberInSurah, _that.text, _that.audio);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AyahModel implements AyahModel {
  const _AyahModel(
      {required this.numberInSurah, required this.text, required this.audio});
  factory _AyahModel.fromJson(Map<String, dynamic> json) =>
      _$AyahModelFromJson(json);

  @override
  final int numberInSurah;
  @override
  final String text;
  @override
  final String audio;

  /// Create a copy of AyahModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AyahModelCopyWith<_AyahModel> get copyWith =>
      __$AyahModelCopyWithImpl<_AyahModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AyahModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AyahModel &&
            (identical(other.numberInSurah, numberInSurah) ||
                other.numberInSurah == numberInSurah) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, numberInSurah, text, audio);

  @override
  String toString() {
    return 'AyahModel(numberInSurah: $numberInSurah, text: $text, audio: $audio)';
  }
}

/// @nodoc
abstract mixin class _$AyahModelCopyWith<$Res>
    implements $AyahModelCopyWith<$Res> {
  factory _$AyahModelCopyWith(
          _AyahModel value, $Res Function(_AyahModel) _then) =
      __$AyahModelCopyWithImpl;
  @override
  @useResult
  $Res call({int numberInSurah, String text, String audio});
}

/// @nodoc
class __$AyahModelCopyWithImpl<$Res> implements _$AyahModelCopyWith<$Res> {
  __$AyahModelCopyWithImpl(this._self, this._then);

  final _AyahModel _self;
  final $Res Function(_AyahModel) _then;

  /// Create a copy of AyahModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? numberInSurah = null,
    Object? text = null,
    Object? audio = null,
  }) {
    return _then(_AyahModel(
      numberInSurah: null == numberInSurah
          ? _self.numberInSurah
          : numberInSurah // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
