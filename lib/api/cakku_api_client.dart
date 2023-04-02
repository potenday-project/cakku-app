import 'dart:convert';

import 'package:cakku_app/api/api_response.dart';
import 'package:cakku_app/api/card_template_item_response.dart';
import 'package:cakku_app/api/invitation_detail_type_response.dart';
import 'package:cakku_app/api/invitation_request.dart';
import 'package:http/http.dart' as http;

import 'card_response.dart';
import 'invitation_response.dart';

class CakkuApiClient {
  final String scheme = 'https';
  final String host = 'cakku.hae-seong.com';

  Future<InvitationResponse> createInvitation(
      InvitationRequest invitationRequest,
  ) {
    return http.post(
      Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/invitations',
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: json.encode(invitationRequest.toJson()),
    ).then((response) {
      final decoded = json.decode(utf8.decode(response.bodyBytes));
      return InvitationResponse.fromJson(ApiResponse.fromJson(decoded).data);
    });
  }

  Future<List<InvitationDetailTypeResponse>> getInvitationDetailTypes({
    int? invitationTypeIndex,
  }) async {
    final response = await http.get(
      Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/invitation-detail-types',
        queryParameters: {
          'invitationTypeIndex': invitationTypeIndex?.toString(),
        },
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );

    final decoded = json.decode(utf8.decode(response.bodyBytes));
    final result = (ApiResponse.fromJson(decoded).data as List)
        .map((e) => InvitationDetailTypeResponse.fromJson(e))
        .toList();
    return result;
  }

  Future<List<CardTemplateItemResponse>> getCardTemplateItems(
      String? invitationDetailTypeId,
  ) async {
    final response = await http.get(
      Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/card-template-items',
        queryParameters: {
          'invitationDetailTypeId': invitationDetailTypeId,
        },
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );

    final decoded = json.decode(utf8.decode(response.bodyBytes));
    return (ApiResponse.fromJson(decoded).data as List)
        .map((e) => CardTemplateItemResponse.fromJson(e))
        .toList();
  }

  Future<CardResponse> getCard(
      String cardId,
  ) {
    return http.get(
      Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/cards/$cardId',
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    ).then((response) {
      final decoded = json.decode(utf8.decode(response.bodyBytes));
      return CardResponse.fromJson(ApiResponse.fromJson(decoded).data);
    });
  }

  String resolveFileUrl(String fileId) {
    return Uri(
      scheme: scheme,
      host: host,
      path: '/api/v1/files/$fileId',
    ).toString();
  }
}
