// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String vendorID, List<CartItem> items) hasItem,
    required TResult Function(String? vendorID, List<CartItem>? items) loading,
    required TResult Function(
            String error, String? vendorID, List<CartItem>? items)
        message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String vendorID, List<CartItem> items)? hasItem,
    TResult? Function(String? vendorID, List<CartItem>? items)? loading,
    TResult? Function(String error, String? vendorID, List<CartItem>? items)?
        message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String vendorID, List<CartItem> items)? hasItem,
    TResult Function(String? vendorID, List<CartItem>? items)? loading,
    TResult Function(String error, String? vendorID, List<CartItem>? items)?
        message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_HasItem value) hasItem,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_HasItem value)? hasItem,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_HasItem value)? hasItem,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

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
    extends _$CartStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CartState.initial()';
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
    required TResult Function(String vendorID, List<CartItem> items) hasItem,
    required TResult Function(String? vendorID, List<CartItem>? items) loading,
    required TResult Function(
            String error, String? vendorID, List<CartItem>? items)
        message,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String vendorID, List<CartItem> items)? hasItem,
    TResult? Function(String? vendorID, List<CartItem>? items)? loading,
    TResult? Function(String error, String? vendorID, List<CartItem>? items)?
        message,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String vendorID, List<CartItem> items)? hasItem,
    TResult Function(String? vendorID, List<CartItem>? items)? loading,
    TResult Function(String error, String? vendorID, List<CartItem>? items)?
        message,
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
    required TResult Function(_HasItem value) hasItem,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) message,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_HasItem value)? hasItem,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? message,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_HasItem value)? hasItem,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? message,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends CartState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$HasItemImplCopyWith<$Res> {
  factory _$$HasItemImplCopyWith(
          _$HasItemImpl value, $Res Function(_$HasItemImpl) then) =
      __$$HasItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String vendorID, List<CartItem> items});
}

/// @nodoc
class __$$HasItemImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$HasItemImpl>
    implements _$$HasItemImplCopyWith<$Res> {
  __$$HasItemImplCopyWithImpl(
      _$HasItemImpl _value, $Res Function(_$HasItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorID = null,
    Object? items = null,
  }) {
    return _then(_$HasItemImpl(
      vendorID: null == vendorID
          ? _value.vendorID
          : vendorID // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ));
  }
}

/// @nodoc

class _$HasItemImpl extends _HasItem {
  const _$HasItemImpl(
      {required this.vendorID, required final List<CartItem> items})
      : _items = items,
        super._();

  @override
  final String vendorID;
  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartState.hasItem(vendorID: $vendorID, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HasItemImpl &&
            (identical(other.vendorID, vendorID) ||
                other.vendorID == vendorID) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, vendorID, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HasItemImplCopyWith<_$HasItemImpl> get copyWith =>
      __$$HasItemImplCopyWithImpl<_$HasItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String vendorID, List<CartItem> items) hasItem,
    required TResult Function(String? vendorID, List<CartItem>? items) loading,
    required TResult Function(
            String error, String? vendorID, List<CartItem>? items)
        message,
  }) {
    return hasItem(vendorID, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String vendorID, List<CartItem> items)? hasItem,
    TResult? Function(String? vendorID, List<CartItem>? items)? loading,
    TResult? Function(String error, String? vendorID, List<CartItem>? items)?
        message,
  }) {
    return hasItem?.call(vendorID, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String vendorID, List<CartItem> items)? hasItem,
    TResult Function(String? vendorID, List<CartItem>? items)? loading,
    TResult Function(String error, String? vendorID, List<CartItem>? items)?
        message,
    required TResult orElse(),
  }) {
    if (hasItem != null) {
      return hasItem(vendorID, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_HasItem value) hasItem,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) message,
  }) {
    return hasItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_HasItem value)? hasItem,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? message,
  }) {
    return hasItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_HasItem value)? hasItem,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? message,
    required TResult orElse(),
  }) {
    if (hasItem != null) {
      return hasItem(this);
    }
    return orElse();
  }
}

abstract class _HasItem extends CartState {
  const factory _HasItem(
      {required final String vendorID,
      required final List<CartItem> items}) = _$HasItemImpl;
  const _HasItem._() : super._();

  String get vendorID;
  List<CartItem> get items;
  @JsonKey(ignore: true)
  _$$HasItemImplCopyWith<_$HasItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? vendorID, List<CartItem>? items});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorID = freezed,
    Object? items = freezed,
  }) {
    return _then(_$LoadingImpl(
      vendorID: freezed == vendorID
          ? _value.vendorID
          : vendorID // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>?,
    ));
  }
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl({this.vendorID, final List<CartItem>? items})
      : _items = items,
        super._();

  @override
  final String? vendorID;
  final List<CartItem>? _items;
  @override
  List<CartItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CartState.loading(vendorID: $vendorID, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.vendorID, vendorID) ||
                other.vendorID == vendorID) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, vendorID, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String vendorID, List<CartItem> items) hasItem,
    required TResult Function(String? vendorID, List<CartItem>? items) loading,
    required TResult Function(
            String error, String? vendorID, List<CartItem>? items)
        message,
  }) {
    return loading(vendorID, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String vendorID, List<CartItem> items)? hasItem,
    TResult? Function(String? vendorID, List<CartItem>? items)? loading,
    TResult? Function(String error, String? vendorID, List<CartItem>? items)?
        message,
  }) {
    return loading?.call(vendorID, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String vendorID, List<CartItem> items)? hasItem,
    TResult Function(String? vendorID, List<CartItem>? items)? loading,
    TResult Function(String error, String? vendorID, List<CartItem>? items)?
        message,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(vendorID, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_HasItem value) hasItem,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) message,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_HasItem value)? hasItem,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? message,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_HasItem value)? hasItem,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? message,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends CartState {
  const factory _Loading(
      {final String? vendorID, final List<CartItem>? items}) = _$LoadingImpl;
  const _Loading._() : super._();

  String? get vendorID;
  List<CartItem>? get items;
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
  $Res call({String error, String? vendorID, List<CartItem>? items});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? vendorID = freezed,
    Object? items = freezed,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      vendorID: freezed == vendorID
          ? _value.vendorID
          : vendorID // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl(
      {required this.error,
      required this.vendorID,
      required final List<CartItem>? items})
      : _items = items,
        super._();

  @override
  final String error;
  @override
  final String? vendorID;
  final List<CartItem>? _items;
  @override
  List<CartItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CartState.message(error: $error, vendorID: $vendorID, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.vendorID, vendorID) ||
                other.vendorID == vendorID) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, vendorID,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String vendorID, List<CartItem> items) hasItem,
    required TResult Function(String? vendorID, List<CartItem>? items) loading,
    required TResult Function(
            String error, String? vendorID, List<CartItem>? items)
        message,
  }) {
    return message(error, vendorID, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String vendorID, List<CartItem> items)? hasItem,
    TResult? Function(String? vendorID, List<CartItem>? items)? loading,
    TResult? Function(String error, String? vendorID, List<CartItem>? items)?
        message,
  }) {
    return message?.call(error, vendorID, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String vendorID, List<CartItem> items)? hasItem,
    TResult Function(String? vendorID, List<CartItem>? items)? loading,
    TResult Function(String error, String? vendorID, List<CartItem>? items)?
        message,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(error, vendorID, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_HasItem value) hasItem,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) message,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_HasItem value)? hasItem,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? message,
  }) {
    return message?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_HasItem value)? hasItem,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? message,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this);
    }
    return orElse();
  }
}

abstract class _Error extends CartState {
  const factory _Error(
      {required final String error,
      required final String? vendorID,
      required final List<CartItem>? items}) = _$ErrorImpl;
  const _Error._() : super._();

  String get error;
  String? get vendorID;
  List<CartItem>? get items;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
