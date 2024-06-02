import 'dart:math';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';


class RegisterModel extends FlutterFlowModel {
  // State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for confirm_password widget.
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  // State field(s) for emailAddressLogin widget.
  TextEditingController? emailAddressLoginController;
  String? Function(BuildContext, String?)? emailAddressLoginControllerValidator;
  // State field(s) for passwordLogin widget.
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;

  // Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPasswordVisibility = false;
    passwordLoginVisibility = false;
  }

  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    confirmPasswordController?.dispose();
    emailAddressLoginController?.dispose();
    passwordLoginController?.dispose();
  }

  // Additional helper methods are added here.

  Future createAndStoreEthereumAccount(String userId) async {
    // Generate Ethereum account
    final privateKeyBytes =
        Uint8List.fromList(List.generate(32, (index) => _randomByte()));
    final credentials = EthPrivateKey.fromHex(bytesToHex(privateKeyBytes));
    final userAddress = credentials.address;

    // Save to Firestore
    final firestore = FirebaseFirestore.instance;

    await firestore.collection('users').doc(userId).set({
      'address': userAddress.hex,
      'private_key': bytesToHex(credentials.privateKey),
    });

    print('Ethereum account created and saved to Firestore for user $userId');
    return userAddress;
  }
}

Future<Map<String, String>?> getEthereumAccount(String userId) async {
  final firestore = FirebaseFirestore.instance;
  final doc = await firestore.collection('users').doc(userId).get();

  if (doc.exists) {
    return {
      'address': doc['address'],
      // 'private_key': doc['private_key'],
    };
  } else {
    print('Error: Ethereum account not found for user $userId');
    return null;
  }
}

String bytesToHex(Uint8List bytes) {
  return '0x' +
      bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join('');
}

int _randomByte() {
  final secureRandom = Random.secure();
  return secureRandom.nextInt(256);
}
