// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoModel _$GeoModelFromJson(Map<String, dynamic> json) => GeoModel(
  name: json['name'] as String,
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
  country: json['country'] as String,
  state: json['state'] as String?,
);

Map<String, dynamic> _$GeoModelToJson(GeoModel instance) => <String, dynamic>{
  'name': instance.name,
  'lat': instance.lat,
  'lon': instance.lon,
  'country': instance.country,
  'state': instance.state,
};
