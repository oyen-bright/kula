// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RestaurantState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<Restaurant> restaurants, List<Meal> todaySpecials)
        loaded,
    required TResult Function(
            List<Restaurant> restaurants, List<Meal> todaySpecials)
        loading,
    required TResult Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loaded,
    TResult? Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loading,
    TResult? Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loaded,
    TResult Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loading,
    TResult Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantStateCopyWith<$Res> {
  factory $RestaurantStateCopyWith(
          RestaurantState value, $Res Function(RestaurantState) then) =
      _$RestaurantStateCopyWithImpl<$Res, RestaurantState>;
}

/// @nodoc
class _$RestaurantStateCopyWithImpl<$Res, $Val extends RestaurantState>
    implements $RestaurantStateCopyWith<$Res> {
  _$RestaurantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RestaurantStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'RestaurantState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<Restaurant> restaurants, List<Meal> todaySpecials)
        loaded,
    required TResult Function(
            List<Restaurant> restaurants, List<Meal> todaySpecials)
        loading,
    required TResult Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loaded,
    TResult? Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loading,
    TResult? Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)?
        error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loaded,
    TResult Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loading,
    TResult Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends RestaurantState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Restaurant> restaurants, List<Meal> todaySpecials});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$RestaurantStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurants = null,
    Object? todaySpecials = null,
  }) {
    return _then(_$LoadedImpl(
      restaurants: null == restaurants
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      todaySpecials: null == todaySpecials
          ? _value._todaySpecials
          : todaySpecials // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl(
      {required final List<Restaurant> restaurants,
      required final List<Meal> todaySpecials})
      : _restaurants = restaurants,
        _todaySpecials = todaySpecials,
        super._();

  final List<Restaurant> _restaurants;
  @override
  List<Restaurant> get restaurants {
    if (_restaurants is EqualUnmodifiableListView) return _restaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  final List<Meal> _todaySpecials;
  @override
  List<Meal> get todaySpecials {
    if (_todaySpecials is EqualUnmodifiableListView) return _todaySpecials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todaySpecials);
  }

  @override
  String toString() {
    return 'RestaurantState.loaded(restaurants: $restaurants, todaySpecials: $todaySpecials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants) &&
            const DeepCollectionEquality()
                .equals(other._todaySpecials, _todaySpecials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_restaurants),
      const DeepCollectionEquality().hash(_todaySpecials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<Restaurant> restaurants, List<Meal> todaySpecials)
        loaded,
    required TResult Function(
            List<Restaurant> restaurants, List<Meal> todaySpecials)
        loading,
    required TResult Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)
        error,
  }) {
    return loaded(restaurants, todaySpecials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loaded,
    TResult? Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loading,
    TResult? Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)?
        error,
  }) {
    return loaded?.call(restaurants, todaySpecials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loaded,
    TResult Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loading,
    TResult Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(restaurants, todaySpecials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends RestaurantState {
  const factory _Loaded(
      {required final List<Restaurant> restaurants,
      required final List<Meal> todaySpecials}) = _$LoadedImpl;
  const _Loaded._() : super._();

  List<Restaurant> get restaurants;
  List<Meal> get todaySpecials;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Restaurant> restaurants, List<Meal> todaySpecials});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$RestaurantStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurants = null,
    Object? todaySpecials = null,
  }) {
    return _then(_$LoadingImpl(
      restaurants: null == restaurants
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      todaySpecials: null == todaySpecials
          ? _value._todaySpecials
          : todaySpecials // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl(
      {required final List<Restaurant> restaurants,
      required final List<Meal> todaySpecials})
      : _restaurants = restaurants,
        _todaySpecials = todaySpecials,
        super._();

  final List<Restaurant> _restaurants;
  @override
  List<Restaurant> get restaurants {
    if (_restaurants is EqualUnmodifiableListView) return _restaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  final List<Meal> _todaySpecials;
  @override
  List<Meal> get todaySpecials {
    if (_todaySpecials is EqualUnmodifiableListView) return _todaySpecials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todaySpecials);
  }

  @override
  String toString() {
    return 'RestaurantState.loading(restaurants: $restaurants, todaySpecials: $todaySpecials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants) &&
            const DeepCollectionEquality()
                .equals(other._todaySpecials, _todaySpecials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_restaurants),
      const DeepCollectionEquality().hash(_todaySpecials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<Restaurant> restaurants, List<Meal> todaySpecials)
        loaded,
    required TResult Function(
            List<Restaurant> restaurants, List<Meal> todaySpecials)
        loading,
    required TResult Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)
        error,
  }) {
    return loading(restaurants, todaySpecials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loaded,
    TResult? Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loading,
    TResult? Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)?
        error,
  }) {
    return loading?.call(restaurants, todaySpecials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loaded,
    TResult Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loading,
    TResult Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(restaurants, todaySpecials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends RestaurantState {
  const factory _Loading(
      {required final List<Restaurant> restaurants,
      required final List<Meal> todaySpecials}) = _$LoadingImpl;
  const _Loading._() : super._();

  List<Restaurant> get restaurants;
  List<Meal> get todaySpecials;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String error, List<Restaurant> restaurants, List<Meal> todaySpecials});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$RestaurantStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? restaurants = null,
    Object? todaySpecials = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      restaurants: null == restaurants
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      todaySpecials: null == todaySpecials
          ? _value._todaySpecials
          : todaySpecials // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
    ));
  }
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl(
      {required this.error,
      final List<Restaurant> restaurants = const [],
      final List<Meal> todaySpecials = const []})
      : _restaurants = restaurants,
        _todaySpecials = todaySpecials,
        super._();

  @override
  final String error;
  final List<Restaurant> _restaurants;
  @override
  @JsonKey()
  List<Restaurant> get restaurants {
    if (_restaurants is EqualUnmodifiableListView) return _restaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  final List<Meal> _todaySpecials;
  @override
  @JsonKey()
  List<Meal> get todaySpecials {
    if (_todaySpecials is EqualUnmodifiableListView) return _todaySpecials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todaySpecials);
  }

  @override
  String toString() {
    return 'RestaurantState.error(error: $error, restaurants: $restaurants, todaySpecials: $todaySpecials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants) &&
            const DeepCollectionEquality()
                .equals(other._todaySpecials, _todaySpecials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      error,
      const DeepCollectionEquality().hash(_restaurants),
      const DeepCollectionEquality().hash(_todaySpecials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<Restaurant> restaurants, List<Meal> todaySpecials)
        loaded,
    required TResult Function(
            List<Restaurant> restaurants, List<Meal> todaySpecials)
        loading,
    required TResult Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)
        error,
  }) {
    return error(this.error, restaurants, todaySpecials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loaded,
    TResult? Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loading,
    TResult? Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)?
        error,
  }) {
    return error?.call(this.error, restaurants, todaySpecials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loaded,
    TResult Function(List<Restaurant> restaurants, List<Meal> todaySpecials)?
        loading,
    TResult Function(String error, List<Restaurant> restaurants,
            List<Meal> todaySpecials)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, restaurants, todaySpecials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends RestaurantState {
  const factory _Error(
      {required final String error,
      final List<Restaurant> restaurants,
      final List<Meal> todaySpecials}) = _$ErrorImpl;
  const _Error._() : super._();

  String get error;
  List<Restaurant> get restaurants;
  List<Meal> get todaySpecials;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
