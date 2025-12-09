import 'package:json_annotation/json_annotation.dart';
import 'package:sky_cast/core/network/base_response.dart';

part 'geo_model.g.dart';

@JsonSerializable()
class GeoModel extends BaseResponse {
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String? state;

  GeoModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    this.state,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoModelToJson(this);
}
