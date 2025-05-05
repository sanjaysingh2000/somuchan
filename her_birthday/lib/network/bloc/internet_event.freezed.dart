// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internet_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InternetEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isConnected) statusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isConnected)? statusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isConnected)? statusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternetStarted value) started,
    required TResult Function(InternetStatusChanged value) statusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternetStarted value)? started,
    TResult? Function(InternetStatusChanged value)? statusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternetStarted value)? started,
    TResult Function(InternetStatusChanged value)? statusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternetEventCopyWith<$Res> {
  factory $InternetEventCopyWith(
          InternetEvent value, $Res Function(InternetEvent) then) =
      _$InternetEventCopyWithImpl<$Res, InternetEvent>;
}

/// @nodoc
class _$InternetEventCopyWithImpl<$Res, $Val extends InternetEvent>
    implements $InternetEventCopyWith<$Res> {
  _$InternetEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InternetEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InternetStartedImplCopyWith<$Res> {
  factory _$$InternetStartedImplCopyWith(_$InternetStartedImpl value,
          $Res Function(_$InternetStartedImpl) then) =
      __$$InternetStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternetStartedImplCopyWithImpl<$Res>
    extends _$InternetEventCopyWithImpl<$Res, _$InternetStartedImpl>
    implements _$$InternetStartedImplCopyWith<$Res> {
  __$$InternetStartedImplCopyWithImpl(
      _$InternetStartedImpl _value, $Res Function(_$InternetStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InternetEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InternetStartedImpl implements InternetStarted {
  const _$InternetStartedImpl();

  @override
  String toString() {
    return 'InternetEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InternetStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isConnected) statusChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isConnected)? statusChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isConnected)? statusChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternetStarted value) started,
    required TResult Function(InternetStatusChanged value) statusChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternetStarted value)? started,
    TResult? Function(InternetStatusChanged value)? statusChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternetStarted value)? started,
    TResult Function(InternetStatusChanged value)? statusChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class InternetStarted implements InternetEvent {
  const factory InternetStarted() = _$InternetStartedImpl;
}

/// @nodoc
abstract class _$$InternetStatusChangedImplCopyWith<$Res> {
  factory _$$InternetStatusChangedImplCopyWith(
          _$InternetStatusChangedImpl value,
          $Res Function(_$InternetStatusChangedImpl) then) =
      __$$InternetStatusChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isConnected});
}

/// @nodoc
class __$$InternetStatusChangedImplCopyWithImpl<$Res>
    extends _$InternetEventCopyWithImpl<$Res, _$InternetStatusChangedImpl>
    implements _$$InternetStatusChangedImplCopyWith<$Res> {
  __$$InternetStatusChangedImplCopyWithImpl(_$InternetStatusChangedImpl _value,
      $Res Function(_$InternetStatusChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InternetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
  }) {
    return _then(_$InternetStatusChangedImpl(
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InternetStatusChangedImpl implements InternetStatusChanged {
  const _$InternetStatusChangedImpl({required this.isConnected});

  @override
  final bool isConnected;

  @override
  String toString() {
    return 'InternetEvent.statusChanged(isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternetStatusChangedImpl &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnected);

  /// Create a copy of InternetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InternetStatusChangedImplCopyWith<_$InternetStatusChangedImpl>
      get copyWith => __$$InternetStatusChangedImplCopyWithImpl<
          _$InternetStatusChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isConnected) statusChanged,
  }) {
    return statusChanged(isConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isConnected)? statusChanged,
  }) {
    return statusChanged?.call(isConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isConnected)? statusChanged,
    required TResult orElse(),
  }) {
    if (statusChanged != null) {
      return statusChanged(isConnected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternetStarted value) started,
    required TResult Function(InternetStatusChanged value) statusChanged,
  }) {
    return statusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternetStarted value)? started,
    TResult? Function(InternetStatusChanged value)? statusChanged,
  }) {
    return statusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternetStarted value)? started,
    TResult Function(InternetStatusChanged value)? statusChanged,
    required TResult orElse(),
  }) {
    if (statusChanged != null) {
      return statusChanged(this);
    }
    return orElse();
  }
}

abstract class InternetStatusChanged implements InternetEvent {
  const factory InternetStatusChanged({required final bool isConnected}) =
      _$InternetStatusChangedImpl;

  bool get isConnected;

  /// Create a copy of InternetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InternetStatusChangedImplCopyWith<_$InternetStatusChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
