import '/backend/backend.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for post component.
  late PostModel postModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    postModel = createModel(context, () => PostModel());
  }

  void dispose() {
    postModel.dispose();
  }

  /// Additional helper methods are added here.

}
