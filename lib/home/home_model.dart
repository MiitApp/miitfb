import '/auth/firebase_auth/auth_util.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/new_event_widget.dart';
import '/components/new_users_widget.dart';
import '/components/question_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for QuestionCard component.
  late QuestionCardModel questionCardModel;
  // Model for NewUsers component.
  late NewUsersModel newUsersModel;
  // Model for NewEvent component.
  late NewEventModel newEventModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    questionCardModel = createModel(context, () => QuestionCardModel());
    newUsersModel = createModel(context, () => NewUsersModel());
    newEventModel = createModel(context, () => NewEventModel());
  }

  void dispose() {
    questionCardModel.dispose();
    newUsersModel.dispose();
    newEventModel.dispose();
  }

  /// Additional helper methods are added here.

}
