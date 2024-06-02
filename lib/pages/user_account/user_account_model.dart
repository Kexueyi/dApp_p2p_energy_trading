import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class UserAccountModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for userName widget.
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  // State field(s) for userEmail widget.
  TextEditingController? userEmailController;
  String? Function(BuildContext, String?)? userEmailControllerValidator;
  // State field(s) for userETHAddr widget.
  TextEditingController? userETHAddrController;
  String? Function(BuildContext, String?)? userETHAddrControllerValidator;
  // State field(s) for shortBio widget.
  TextEditingController? shortBioController;
  String? Function(BuildContext, String?)? shortBioControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    userNameController?.dispose();
    userEmailController?.dispose();
    userETHAddrController?.dispose();
    shortBioController?.dispose();
  }

  /// Additional helper methods are added here.

}
