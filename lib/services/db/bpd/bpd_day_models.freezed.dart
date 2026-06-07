// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bpd_day_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BpdDayProgress {

 int get weekNumber; int get dayNumber; DateTime get unlockDate; bool get isCompleted; DateTime? get completedAt; DateTime? get startedAt;
/// Create a copy of BpdDayProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BpdDayProgressCopyWith<BpdDayProgress> get copyWith => _$BpdDayProgressCopyWithImpl<BpdDayProgress>(this as BpdDayProgress, _$identity);

  /// Serializes this BpdDayProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BpdDayProgress&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.unlockDate, unlockDate) || other.unlockDate == unlockDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNumber,dayNumber,unlockDate,isCompleted,completedAt,startedAt);

@override
String toString() {
  return 'BpdDayProgress(weekNumber: $weekNumber, dayNumber: $dayNumber, unlockDate: $unlockDate, isCompleted: $isCompleted, completedAt: $completedAt, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class $BpdDayProgressCopyWith<$Res>  {
  factory $BpdDayProgressCopyWith(BpdDayProgress value, $Res Function(BpdDayProgress) _then) = _$BpdDayProgressCopyWithImpl;
@useResult
$Res call({
 int weekNumber, int dayNumber, DateTime unlockDate, bool isCompleted, DateTime? completedAt, DateTime? startedAt
});




}
/// @nodoc
class _$BpdDayProgressCopyWithImpl<$Res>
    implements $BpdDayProgressCopyWith<$Res> {
  _$BpdDayProgressCopyWithImpl(this._self, this._then);

  final BpdDayProgress _self;
  final $Res Function(BpdDayProgress) _then;

/// Create a copy of BpdDayProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekNumber = null,Object? dayNumber = null,Object? unlockDate = null,Object? isCompleted = null,Object? completedAt = freezed,Object? startedAt = freezed,}) {
  return _then(_self.copyWith(
weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,unlockDate: null == unlockDate ? _self.unlockDate : unlockDate // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BpdDayProgress].
extension BpdDayProgressPatterns on BpdDayProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BpdDayProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BpdDayProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BpdDayProgress value)  $default,){
final _that = this;
switch (_that) {
case _BpdDayProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BpdDayProgress value)?  $default,){
final _that = this;
switch (_that) {
case _BpdDayProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int weekNumber,  int dayNumber,  DateTime unlockDate,  bool isCompleted,  DateTime? completedAt,  DateTime? startedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BpdDayProgress() when $default != null:
return $default(_that.weekNumber,_that.dayNumber,_that.unlockDate,_that.isCompleted,_that.completedAt,_that.startedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int weekNumber,  int dayNumber,  DateTime unlockDate,  bool isCompleted,  DateTime? completedAt,  DateTime? startedAt)  $default,) {final _that = this;
switch (_that) {
case _BpdDayProgress():
return $default(_that.weekNumber,_that.dayNumber,_that.unlockDate,_that.isCompleted,_that.completedAt,_that.startedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int weekNumber,  int dayNumber,  DateTime unlockDate,  bool isCompleted,  DateTime? completedAt,  DateTime? startedAt)?  $default,) {final _that = this;
switch (_that) {
case _BpdDayProgress() when $default != null:
return $default(_that.weekNumber,_that.dayNumber,_that.unlockDate,_that.isCompleted,_that.completedAt,_that.startedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BpdDayProgress extends BpdDayProgress {
  const _BpdDayProgress({required this.weekNumber, required this.dayNumber, required this.unlockDate, this.isCompleted = false, this.completedAt, this.startedAt}): super._();
  factory _BpdDayProgress.fromJson(Map<String, dynamic> json) => _$BpdDayProgressFromJson(json);

@override final  int weekNumber;
@override final  int dayNumber;
@override final  DateTime unlockDate;
@override@JsonKey() final  bool isCompleted;
@override final  DateTime? completedAt;
@override final  DateTime? startedAt;

/// Create a copy of BpdDayProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BpdDayProgressCopyWith<_BpdDayProgress> get copyWith => __$BpdDayProgressCopyWithImpl<_BpdDayProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BpdDayProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BpdDayProgress&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.unlockDate, unlockDate) || other.unlockDate == unlockDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNumber,dayNumber,unlockDate,isCompleted,completedAt,startedAt);

@override
String toString() {
  return 'BpdDayProgress(weekNumber: $weekNumber, dayNumber: $dayNumber, unlockDate: $unlockDate, isCompleted: $isCompleted, completedAt: $completedAt, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class _$BpdDayProgressCopyWith<$Res> implements $BpdDayProgressCopyWith<$Res> {
  factory _$BpdDayProgressCopyWith(_BpdDayProgress value, $Res Function(_BpdDayProgress) _then) = __$BpdDayProgressCopyWithImpl;
@override @useResult
$Res call({
 int weekNumber, int dayNumber, DateTime unlockDate, bool isCompleted, DateTime? completedAt, DateTime? startedAt
});




}
/// @nodoc
class __$BpdDayProgressCopyWithImpl<$Res>
    implements _$BpdDayProgressCopyWith<$Res> {
  __$BpdDayProgressCopyWithImpl(this._self, this._then);

  final _BpdDayProgress _self;
  final $Res Function(_BpdDayProgress) _then;

/// Create a copy of BpdDayProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekNumber = null,Object? dayNumber = null,Object? unlockDate = null,Object? isCompleted = null,Object? completedAt = freezed,Object? startedAt = freezed,}) {
  return _then(_BpdDayProgress(
weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,unlockDate: null == unlockDate ? _self.unlockDate : unlockDate // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$BpdDayData {

 int get weekNumber; int get dayNumber; String get titleKey; String get descriptionKey; String? get iconPath; String? get contentType;
/// Create a copy of BpdDayData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BpdDayDataCopyWith<BpdDayData> get copyWith => _$BpdDayDataCopyWithImpl<BpdDayData>(this as BpdDayData, _$identity);

  /// Serializes this BpdDayData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BpdDayData&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.titleKey, titleKey) || other.titleKey == titleKey)&&(identical(other.descriptionKey, descriptionKey) || other.descriptionKey == descriptionKey)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNumber,dayNumber,titleKey,descriptionKey,iconPath,contentType);

@override
String toString() {
  return 'BpdDayData(weekNumber: $weekNumber, dayNumber: $dayNumber, titleKey: $titleKey, descriptionKey: $descriptionKey, iconPath: $iconPath, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class $BpdDayDataCopyWith<$Res>  {
  factory $BpdDayDataCopyWith(BpdDayData value, $Res Function(BpdDayData) _then) = _$BpdDayDataCopyWithImpl;
@useResult
$Res call({
 int weekNumber, int dayNumber, String titleKey, String descriptionKey, String? iconPath, String? contentType
});




}
/// @nodoc
class _$BpdDayDataCopyWithImpl<$Res>
    implements $BpdDayDataCopyWith<$Res> {
  _$BpdDayDataCopyWithImpl(this._self, this._then);

  final BpdDayData _self;
  final $Res Function(BpdDayData) _then;

/// Create a copy of BpdDayData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekNumber = null,Object? dayNumber = null,Object? titleKey = null,Object? descriptionKey = null,Object? iconPath = freezed,Object? contentType = freezed,}) {
  return _then(_self.copyWith(
weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,titleKey: null == titleKey ? _self.titleKey : titleKey // ignore: cast_nullable_to_non_nullable
as String,descriptionKey: null == descriptionKey ? _self.descriptionKey : descriptionKey // ignore: cast_nullable_to_non_nullable
as String,iconPath: freezed == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BpdDayData].
extension BpdDayDataPatterns on BpdDayData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BpdDayData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BpdDayData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BpdDayData value)  $default,){
final _that = this;
switch (_that) {
case _BpdDayData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BpdDayData value)?  $default,){
final _that = this;
switch (_that) {
case _BpdDayData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int weekNumber,  int dayNumber,  String titleKey,  String descriptionKey,  String? iconPath,  String? contentType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BpdDayData() when $default != null:
return $default(_that.weekNumber,_that.dayNumber,_that.titleKey,_that.descriptionKey,_that.iconPath,_that.contentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int weekNumber,  int dayNumber,  String titleKey,  String descriptionKey,  String? iconPath,  String? contentType)  $default,) {final _that = this;
switch (_that) {
case _BpdDayData():
return $default(_that.weekNumber,_that.dayNumber,_that.titleKey,_that.descriptionKey,_that.iconPath,_that.contentType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int weekNumber,  int dayNumber,  String titleKey,  String descriptionKey,  String? iconPath,  String? contentType)?  $default,) {final _that = this;
switch (_that) {
case _BpdDayData() when $default != null:
return $default(_that.weekNumber,_that.dayNumber,_that.titleKey,_that.descriptionKey,_that.iconPath,_that.contentType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BpdDayData extends BpdDayData {
  const _BpdDayData({required this.weekNumber, required this.dayNumber, required this.titleKey, required this.descriptionKey, this.iconPath, this.contentType}): super._();
  factory _BpdDayData.fromJson(Map<String, dynamic> json) => _$BpdDayDataFromJson(json);

@override final  int weekNumber;
@override final  int dayNumber;
@override final  String titleKey;
@override final  String descriptionKey;
@override final  String? iconPath;
@override final  String? contentType;

/// Create a copy of BpdDayData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BpdDayDataCopyWith<_BpdDayData> get copyWith => __$BpdDayDataCopyWithImpl<_BpdDayData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BpdDayDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BpdDayData&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.titleKey, titleKey) || other.titleKey == titleKey)&&(identical(other.descriptionKey, descriptionKey) || other.descriptionKey == descriptionKey)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNumber,dayNumber,titleKey,descriptionKey,iconPath,contentType);

@override
String toString() {
  return 'BpdDayData(weekNumber: $weekNumber, dayNumber: $dayNumber, titleKey: $titleKey, descriptionKey: $descriptionKey, iconPath: $iconPath, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$BpdDayDataCopyWith<$Res> implements $BpdDayDataCopyWith<$Res> {
  factory _$BpdDayDataCopyWith(_BpdDayData value, $Res Function(_BpdDayData) _then) = __$BpdDayDataCopyWithImpl;
@override @useResult
$Res call({
 int weekNumber, int dayNumber, String titleKey, String descriptionKey, String? iconPath, String? contentType
});




}
/// @nodoc
class __$BpdDayDataCopyWithImpl<$Res>
    implements _$BpdDayDataCopyWith<$Res> {
  __$BpdDayDataCopyWithImpl(this._self, this._then);

  final _BpdDayData _self;
  final $Res Function(_BpdDayData) _then;

/// Create a copy of BpdDayData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekNumber = null,Object? dayNumber = null,Object? titleKey = null,Object? descriptionKey = null,Object? iconPath = freezed,Object? contentType = freezed,}) {
  return _then(_BpdDayData(
weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,titleKey: null == titleKey ? _self.titleKey : titleKey // ignore: cast_nullable_to_non_nullable
as String,descriptionKey: null == descriptionKey ? _self.descriptionKey : descriptionKey // ignore: cast_nullable_to_non_nullable
as String,iconPath: freezed == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
