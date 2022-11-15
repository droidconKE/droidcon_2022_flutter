import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_resource.freezed.dart';

@freezed
class RemoteResource<T> with _$RemoteResource {
  factory RemoteResource.initial() = _Initial;

  factory RemoteResource.loading() = _Loading;

  factory RemoteResource.success(T resource) = _Success;

  factory RemoteResource.failed(String message) = _Error;
}
