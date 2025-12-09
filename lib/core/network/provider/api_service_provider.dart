import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sky_cast/env/env.dart';

import '../api_service.dart';

part 'api_service_provider.g.dart';

@riverpod
ApiService apiService(Ref ref) {
  return ApiService(Env.weatherApiUrl);
}
