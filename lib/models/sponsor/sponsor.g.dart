// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sponsor _$$_SponsorFromJson(Map<String, dynamic> json) => _$_Sponsor(
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      link: json['link'] as String,
      sponsorType: json['sponsor_type'] as String,
      logo: json['logo'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$_SponsorToJson(_$_Sponsor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tagline': instance.tagline,
      'link': instance.link,
      'sponsor_type': instance.sponsorType,
      'logo': instance.logo,
      'created_at': instance.createdAt,
    };
