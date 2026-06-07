// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bpd_week_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BpdWeekProgress {

 int get weekNumber; DateTime get unlockDate; bool get isCompleted; DateTime? get completedAt;
/// Create a copy of BpdWeekProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BpdWeekProgressCopyWith<BpdWeekProgress> get copyWith => _$BpdWeekProgressCopyWithImpl<BpdWeekProgress>(this as BpdWeekProgress, _$identity);

  /// Serializes this BpdWeekProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BpdWeekProgress&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.unlockDate, unlockDate) || other.unlockDate == unlockDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNumber,unlockDate,isCompleted,completedAt);

@override
String toString() {
  return 'BpdWeekProgress(weekNumber: $weekNumber, unlockDate: $unlockDate, isCompleted: $isCompleted, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $BpdWeekProgressCopyWith<$Res>  {
  factory $BpdWeekProgressCopyWith(BpdWeekProgress value, $Res Function(BpdWeekProgress) _then) = _$BpdWeekProgressCopyWithImpl;
@useResult
$Res call({
 int weekNumber, DateTime unlockDate, bool isCompleted, DateTime? completedAt
});




}
/// @nodoc
class _$BpdWeekProgressCopyWithImpl<$Res>
    implements $BpdWeekProgressCopyWith<$Res> {
  _$BpdWeekProgressCopyWithImpl(this._self, this._then);

  final BpdWeekProgress _self;
  final $Res Function(BpdWeekProgress) _then;

/// Create a copy of BpdWeekProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekNumber = null,Object? unlockDate = null,Object? isCompleted = null,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,unlockDate: null == unlockDate ? _self.unlockDate : unlockDate // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BpdWeekProgress].
extension BpdWeekProgressPatterns on BpdWeekProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BpdWeekProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BpdWeekProgress() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BpdWeekProgress value)  $default,){
final _that = this;
switch (_that) {
case _BpdWeekProgress():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BpdWeekProgress value)?  $default,){
final _that = this;
switch (_that) {
case _BpdWeekProgress() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int weekNumber,  DateTime unlockDate,  bool isCompleted,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BpdWeekProgress() when $default != null:
return $default(_that.weekNumber,_that.unlockDate,_that.isCompleted,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int weekNumber,  DateTime unlockDate,  bool isCompleted,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _BpdWeekProgress():
return $default(_that.weekNumber,_that.unlockDate,_that.isCompleted,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int weekNumber,  DateTime unlockDate,  bool isCompleted,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _BpdWeekProgress() when $default != null:
return $default(_that.weekNumber,_that.unlockDate,_that.isCompleted,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BpdWeekProgress extends BpdWeekProgress {
  const _BpdWeekProgress({required this.weekNumber, required this.unlockDate, this.isCompleted = false, this.completedAt}): super._();
  factory _BpdWeekProgress.fromJson(Map<String, dynamic> json) => _$BpdWeekProgressFromJson(json);

@override final  int weekNumber;
@override final  DateTime unlockDate;
@override@JsonKey() final  bool isCompleted;
@override final  DateTime? completedAt;

/// Create a copy of BpdWeekProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BpdWeekProgressCopyWith<_BpdWeekProgress> get copyWith => __$BpdWeekProgressCopyWithImpl<_BpdWeekProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BpdWeekProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BpdWeekProgress&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.unlockDate, unlockDate) || other.unlockDate == unlockDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNumber,unlockDate,isCompleted,completedAt);

@override
String toString() {
  return 'BpdWeekProgress(weekNumber: $weekNumber, unlockDate: $unlockDate, isCompleted: $isCompleted, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$BpdWeekProgressCopyWith<$Res> implements $BpdWeekProgressCopyWith<$Res> {
  factory _$BpdWeekProgressCopyWith(_BpdWeekProgress value, $Res Function(_BpdWeekProgress) _then) = __$BpdWeekProgressCopyWithImpl;
@override @useResult
$Res call({
 int weekNumber, DateTime unlockDate, bool isCompleted, DateTime? completedAt
});




}
/// @nodoc
class __$BpdWeekProgressCopyWithImpl<$Res>
    implements _$BpdWeekProgressCopyWith<$Res> {
  __$BpdWeekProgressCopyWithImpl(this._self, this._then);

  final _BpdWeekProgress _self;
  final $Res Function(_BpdWeekProgress) _then;

/// Create a copy of BpdWeekProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekNumber = null,Object? unlockDate = null,Object? isCompleted = null,Object? completedAt = freezed,}) {
  return _then(_BpdWeekProgress(
weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,unlockDate: null == unlockDate ? _self.unlockDate : unlockDate // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$BpdWeekData {

 int get weekNumber; String get titleKey; String get descriptionKey; String? get iconPath;
/// Create a copy of BpdWeekData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BpdWeekDataCopyWith<BpdWeekData> get copyWith => _$BpdWeekDataCopyWithImpl<BpdWeekData>(this as BpdWeekData, _$identity);

  /// Serializes this BpdWeekData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BpdWeekData&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.titleKey, titleKey) || other.titleKey == titleKey)&&(identical(other.descriptionKey, descriptionKey) || other.descriptionKey == descriptionKey)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNumber,titleKey,descriptionKey,iconPath);

@override
String toString() {
  return 'BpdWeekData(weekNumber: $weekNumber, titleKey: $titleKey, descriptionKey: $descriptionKey, iconPath: $iconPath)';
}


}

/// @nodoc
abstract mixin class $BpdWeekDataCopyWith<$Res>  {
  factory $BpdWeekDataCopyWith(BpdWeekData value, $Res Function(BpdWeekData) _then) = _$BpdWeekDataCopyWithImpl;
@useResult
$Res call({
 int weekNumber, String titleKey, String descriptionKey, String? iconPath
});




}
/// @nodoc
class _$BpdWeekDataCopyWithImpl<$Res>
    implements $BpdWeekDataCopyWith<$Res> {
  _$BpdWeekDataCopyWithImpl(this._self, this._then);

  final BpdWeekData _self;
  final $Res Function(BpdWeekData) _then;

/// Create a copy of BpdWeekData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekNumber = null,Object? titleKey = null,Object? descriptionKey = null,Object? iconPath = freezed,}) {
  return _then(_self.copyWith(
weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,titleKey: null == titleKey ? _self.titleKey : titleKey // ignore: cast_nullable_to_non_nullable
as String,descriptionKey: null == descriptionKey ? _self.descriptionKey : descriptionKey // ignore: cast_nullable_to_non_nullable
as String,iconPath: freezed == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BpdWeekData].
extension BpdWeekDataPatterns on BpdWeekData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BpdWeekData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BpdWeekData() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BpdWeekData value)  $default,){
final _that = this;
switch (_that) {
case _BpdWeekData():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BpdWeekData value)?  $default,){
final _that = this;
switch (_that) {
case _BpdWeekData() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int weekNumber,  String titleKey,  String descriptionKey,  String? iconPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BpdWeekData() when $default != null:
return $default(_that.weekNumber,_that.titleKey,_that.descriptionKey,_that.iconPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int weekNumber,  String titleKey,  String descriptionKey,  String? iconPath)  $default,) {final _that = this;
switch (_that) {
case _BpdWeekData():
return $default(_that.weekNumber,_that.titleKey,_that.descriptionKey,_that.iconPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int weekNumber,  String titleKey,  String descriptionKey,  String? iconPath)?  $default,) {final _that = this;
switch (_that) {
case _BpdWeekData() when $default != null:
return $default(_that.weekNumber,_that.titleKey,_that.descriptionKey,_that.iconPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BpdWeekData extends BpdWeekData {
  const _BpdWeekData({required this.weekNumber, required this.titleKey, required this.descriptionKey, this.iconPath}): super._();
  factory _BpdWeekData.fromJson(Map<String, dynamic> json) => _$BpdWeekDataFromJson(json);

@override final  int weekNumber;
@override final  String titleKey;
@override final  String descriptionKey;
@override final  String? iconPath;

/// Create a copy of BpdWeekData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BpdWeekDataCopyWith<_BpdWeekData> get copyWith => __$BpdWeekDataCopyWithImpl<_BpdWeekData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BpdWeekDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BpdWeekData&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.titleKey, titleKey) || other.titleKey == titleKey)&&(identical(other.descriptionKey, descriptionKey) || other.descriptionKey == descriptionKey)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNumber,titleKey,descriptionKey,iconPath);

@override
String toString() {
  return 'BpdWeekData(weekNumber: $weekNumber, titleKey: $titleKey, descriptionKey: $descriptionKey, iconPath: $iconPath)';
}


}

/// @nodoc
abstract mixin class _$BpdWeekDataCopyWith<$Res> implements $BpdWeekDataCopyWith<$Res> {
  factory _$BpdWeekDataCopyWith(_BpdWeekData value, $Res Function(_BpdWeekData) _then) = __$BpdWeekDataCopyWithImpl;
@override @useResult
$Res call({
 int weekNumber, String titleKey, String descriptionKey, String? iconPath
});




}
/// @nodoc
class __$BpdWeekDataCopyWithImpl<$Res>
    implements _$BpdWeekDataCopyWith<$Res> {
  __$BpdWeekDataCopyWithImpl(this._self, this._then);

  final _BpdWeekData _self;
  final $Res Function(_BpdWeekData) _then;

/// Create a copy of BpdWeekData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekNumber = null,Object? titleKey = null,Object? descriptionKey = null,Object? iconPath = freezed,}) {
  return _then(_BpdWeekData(
weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,titleKey: null == titleKey ? _self.titleKey : titleKey // ignore: cast_nullable_to_non_nullable
as String,descriptionKey: null == descriptionKey ? _self.descriptionKey : descriptionKey // ignore: cast_nullable_to_non_nullable
as String,iconPath: freezed == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
