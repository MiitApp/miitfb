import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/story_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileOtherModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in NewChatButton widget.
  ChatsRecord? chat;
  // State field(s) for Timer_FollowButtonActions widget.
  int timerFollowButtonActionsMilliseconds = 200;
  String timerFollowButtonActionsValue =
      StopWatchTimer.getDisplayTime(200, milliSecond: false);
  StopWatchTimer timerFollowButtonActionsController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // Stores action output result for [Backend Call - Create Document] action in Timer_FollowButtonActions widget.
  NotificationsRecord? notification;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    timerFollowButtonActionsController.dispose();
  }

  /// Additional helper methods are added here.

}
