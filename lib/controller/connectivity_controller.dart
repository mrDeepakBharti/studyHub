import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InternetController extends GetxController {
  // Observable variable for real internet status
  var isConnected = false.obs;

  // Connectivity instance
  final Connectivity _connectivity = Connectivity();

  // StreamSubscription to listen for connectivity changes
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    // Initial check when the controller is initialized
    checkInternetConnection();

    // Start listening for connectivity changes
    connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) async {
      for (var result in results) {
        await _handleConnectivityChange(result);
      }
    });
  }

  // Step 1: Check the initial internet connection
  Future<void> checkInternetConnection() async {
    List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    for (var result in results) {
      await _handleConnectivityChange(result);
    }
  }

  // Step 2: Handle changes in connectivity
  Future<void> _handleConnectivityChange(ConnectivityResult result) async {
    if (result != ConnectivityResult.none) {
      // Step 3: Check if the internet is truly accessible
      bool hasInternet = await _verifyInternetAccess();
      isConnected.value = hasInternet;
    } else {
      isConnected.value = false;
    }
  }

  // Step 3: Perform a real internet check using an HTTP request
  Future<bool> _verifyInternetAccess() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      return response.statusCode == 200; // Internet is accessible
    } catch (_) {
      return false; // No internet access
    }
  }

  @override
  void onClose() {
    connectivitySubscription.cancel(); // Clean up the subscription
    super.onClose();
  }
}
