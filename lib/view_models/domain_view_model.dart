import 'package:consultaapi/models/domain_model.dart';
import 'package:consultaapi/services/domain_service.dart';
import 'package:flutter/material.dart';

class DomainViewModel extends ChangeNotifier {
  final DomainService _service = DomainService();

  DomainModel? _domainData;
  bool _isLoading = false;
  String? _errorMessage;

  DomainModel? get domainData => _domainData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> searchDomain(String domain) async {
    if (domain.isEmpty) return;

    _isLoading = true;
    _errorMessage = null;
    _domainData = null;
    notifyListeners();

    try {
      _domainData = await _service.fetchDomainInfo(domain);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}