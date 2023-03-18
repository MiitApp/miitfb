import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/post_widget.dart';
import '/components/story_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            expandedHeight: 60.0,
            pinned: false,
            floating: true,
            snap: true,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            HapticFeedback.lightImpact();

                            context.pushNamed(
                              'Search',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Icon(
                            FFIcons.ksearch,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 23.0, 0.0),
                            child: InkWell(
                              onTap: () async {
                                FFAppState().update(() {
                                  FFAppState().uploadPhoto = '';
                                  FFAppState().taggedUsers = [];
                                });
                                FFAppState().update(() {
                                  FFAppState().location = '';
                                  FFAppState().calltoactiontext = '';
                                });
                                FFAppState().update(() {
                                  FFAppState().calltoactionurl = '';
                                  FFAppState().calltoactionenabled = false;
                                });
                                final selectedMedia = await selectMedia(
                                  mediaSource: MediaSource.photoGallery,
                                  multiImage: false,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(
                                      () => _model.isMediaUploading2 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    _model.isMediaUploading2 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile2 =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl2 =
                                          downloadUrls.first;
                                    });
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                    return;
                                  }
                                }

                                if (_model.uploadedFileUrl2 != null &&
                                    _model.uploadedFileUrl2 != '') {
                                  FFAppState().update(() {
                                    FFAppState().uploadPhoto =
                                        _model.uploadedFileUrl2;
                                  });

                                  context.pushNamed(
                                    'NewPost',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.leftToRight,
                                      ),
                                    },
                                  );
                                }
                              },
                              child: Icon(
                                FFIcons.kadd,
                                color: Colors.black,
                                size: 28.0,
                              ),
                            ),
                          ),
                          Stack(
                            alignment: AlignmentDirectional(-0.125, -1.125),
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 23.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    context.pushNamed('Notifications');
                                  },
                                  child: Icon(
                                    Icons.mark_chat_unread_outlined,
                                    color: Colors.black,
                                    size: 28.0,
                                  ),
                                ),
                              ),
                              if ((currentUserDocument?.unreadNotifications
                                              ?.toList() ??
                                          [])
                                      .length >
                                  0)
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 10.0,
                                    height: 10.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          FlutterFlowTheme.of(context)
                                              .secondaryColor
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(1.0, -1.0),
                                        end: AlignmentDirectional(-1.0, 1.0),
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          )
        ],
        body: Builder(
          builder: (context) {
            return SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            context.goNamed(
                              'Feed',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<List<StoriesRecord>>(
                                              stream: queryStoriesRecord(
                                                queryBuilder: (storiesRecord) =>
                                                    storiesRecord
                                                        .where('expire_time',
                                                            isGreaterThanOrEqualTo:
                                                                getCurrentTimestamp)
                                                        .where('user',
                                                            isEqualTo:
                                                                currentUserReference)
                                                        .orderBy('expire_time',
                                                            descending: true),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<StoriesRecord>
                                                    stackStoriesRecordList =
                                                    snapshot.data!;
                                                final stackStoriesRecord =
                                                    stackStoriesRecordList
                                                            .isNotEmpty
                                                        ? stackStoriesRecordList
                                                            .first
                                                        : null;
                                                return Stack(
                                                  children: [
                                                    if (!(stackStoriesRecord !=
                                                        null))
                                                      InkWell(
                                                        onTap: () async {
                                                          final selectedMedia =
                                                              await selectMediaWithSourceBottomSheet(
                                                            context: context,
                                                            imageQuality: 80,
                                                            allowPhoto: true,
                                                            pickerFontFamily:
                                                                'Inter',
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            setState(() => _model
                                                                    .isMediaUploading1 =
                                                                true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];
                                                            var downloadUrls =
                                                                <String>[];
                                                            try {
                                                              showUploadMessage(
                                                                context,
                                                                'Uploading file...',
                                                                showLoading:
                                                                    true,
                                                              );
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
                                                                          .wait(
                                                                selectedMedia
                                                                    .map(
                                                                  (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                ),
                                                              ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                            } finally {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .hideCurrentSnackBar();
                                                              _model.isMediaUploading1 =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                              setState(() {
                                                                _model.uploadedLocalFile1 =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                                _model.uploadedFileUrl1 =
                                                                    downloadUrls
                                                                        .first;
                                                              });
                                                              showUploadMessage(
                                                                  context,
                                                                  'Success!');
                                                            } else {
                                                              setState(() {});
                                                              showUploadMessage(
                                                                  context,
                                                                  'Failed to upload media');
                                                              return;
                                                            }
                                                          }

                                                          if (_model.uploadedFileUrl2 !=
                                                                  null &&
                                                              _model.uploadedFileUrl2 !=
                                                                  '') {
                                                            final storiesCreateData =
                                                                {
                                                              ...createStoriesRecordData(
                                                                user:
                                                                    currentUserReference,
                                                                storyPhoto: _model
                                                                    .uploadedFileUrl2,
                                                                timeCreated:
                                                                    getCurrentTimestamp,
                                                                expireTime: functions
                                                                    .tomorrowTime(
                                                                        getCurrentTimestamp),
                                                              ),
                                                              'views':
                                                                  FFAppState()
                                                                      .emptyList,
                                                            };
                                                            await StoriesRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    storiesCreateData);
                                                          }
                                                        },
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.2, 1.2),
                                                          children: [
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        currentUserPhoto,
                                                                        'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                      ),
                                                                    ).image,
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  width: 3.0,
                                                                ),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .add_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 16.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (stackStoriesRecord !=
                                                        null)
                                                      Container(
                                                        width: 65.0,
                                                        height: 65.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiaryColor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryColor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate
                                                            ],
                                                            stops: [
                                                              0.0,
                                                              0.5,
                                                              1.0
                                                            ],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            end:
                                                                AlignmentDirectional(
                                                                    -1.0, 1.0),
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              onTap: () async {
                                                                showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          StoryWidget(
                                                                        story:
                                                                            stackStoriesRecord,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));

                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            5000));
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        currentUserPhoto,
                                                                        'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                      ),
                                                                    ).image,
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 13.0, 0.0, 0.0),
                                              child: Text(
                                                'Your story',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Noto Sans',
                                                      color: Color(0x80000000),
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child:
                                            StreamBuilder<List<StoriesRecord>>(
                                          stream: queryStoriesRecord(
                                            queryBuilder: (storiesRecord) =>
                                                storiesRecord
                                                    .where('expire_time',
                                                        isGreaterThanOrEqualTo:
                                                            getCurrentTimestamp)
                                                    .orderBy('expire_time'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<StoriesRecord>
                                                userStoriesStoriesRecordList =
                                                snapshot.data!;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  userStoriesStoriesRecordList
                                                      .length,
                                                  (userStoriesIndex) {
                                                final userStoriesStoriesRecord =
                                                    userStoriesStoriesRecordList[
                                                        userStoriesIndex];
                                                return Visibility(
                                                  visible:
                                                      userStoriesStoriesRecord
                                                              .user !=
                                                          currentUserReference,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                15.0, 0.0),
                                                    child: FutureBuilder<
                                                        UsersRecord>(
                                                      future: UsersRecord
                                                          .getDocumentOnce(
                                                              userStoriesStoriesRecord
                                                                  .user!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 12.0,
                                                              height: 12.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final columnUsersRecord =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          onTap: () async {
                                                            showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      StoryWidget(
                                                                    story:
                                                                        userStoriesStoriesRecord,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            if (!userStoriesStoriesRecord
                                                                .views!
                                                                .toList()
                                                                .contains(
                                                                    currentUserReference)) {
                                                              final storiesUpdateData =
                                                                  {
                                                                'views': FieldValue
                                                                    .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                              };
                                                              await userStoriesStoriesRecord
                                                                  .reference
                                                                  .update(
                                                                      storiesUpdateData);
                                                            }
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        5000));
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 65.0,
                                                                height: 65.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      0.5,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        -1.0,
                                                                        1.0),
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: 65.0,
                                                                  height: 65.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: userStoriesStoriesRecord
                                                                            .views!
                                                                            .toList()
                                                                            .contains(
                                                                                currentUserReference)
                                                                        ? Color(
                                                                            0xFFDADADA)
                                                                        : Color(
                                                                            0x00999999),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          60.0,
                                                                      height:
                                                                          60.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              columnUsersRecord.photoUrl,
                                                                              'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                            ),
                                                                          ).image,
                                                                        ),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.white,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    columnUsersRecord
                                                                        .username,
                                                                    'user',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.5,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                ),
                                FutureBuilder<List<PostsRecord>>(
                                  future: queryPostsRecordOnce(
                                    queryBuilder: (postsRecord) => postsRecord
                                        .where('deleted', isEqualTo: false)
                                        .orderBy('time_posted',
                                            descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 12.0,
                                          height: 12.0,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PostsRecord>
                                        questionFeedPostsRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          questionFeedPostsRecordList.length,
                                      itemBuilder:
                                          (context, questionFeedIndex) {
                                        final questionFeedPostsRecord =
                                            questionFeedPostsRecordList[
                                                questionFeedIndex];
                                        return PostWidget(
                                          key: Key(
                                              'Keyb7n_${questionFeedIndex}_of_${questionFeedPostsRecordList.length}'),
                                          post: questionFeedPostsRecord,
                                        );
                                      },
                                    );
                                  },
                                ),
                                PagedListView<DocumentSnapshot<Object?>?,
                                    PostsRecord>(
                                  pagingController: () {
                                    final Query<Object?> Function(
                                            Query<Object?>) queryBuilder =
                                        (postsRecord) => postsRecord
                                            .where('deleted', isEqualTo: false)
                                            .orderBy('time_posted',
                                                descending: true);
                                    if (_model.pagingController != null) {
                                      final query =
                                          queryBuilder(PostsRecord.collection);
                                      if (query != _model.pagingQuery) {
                                        // The query has changed
                                        _model.pagingQuery = query;
                                        _model.streamSubscriptions
                                            .forEach((s) => s?.cancel());
                                        _model.streamSubscriptions.clear();
                                        _model.pagingController!.refresh();
                                      }
                                      return _model.pagingController!;
                                    }

                                    _model.pagingController =
                                        PagingController(firstPageKey: null);
                                    _model.pagingQuery =
                                        queryBuilder(PostsRecord.collection);
                                    _model.pagingController!
                                        .addPageRequestListener(
                                            (nextPageMarker) {
                                      queryPostsRecordPage(
                                        queryBuilder: (postsRecord) =>
                                            postsRecord
                                                .where('deleted',
                                                    isEqualTo: false)
                                                .orderBy('time_posted',
                                                    descending: true),
                                        nextPageMarker: nextPageMarker,
                                        pageSize: 5,
                                        isStream: true,
                                      ).then((page) {
                                        _model.pagingController!.appendPage(
                                          page.data,
                                          page.nextPageMarker,
                                        );
                                        final streamSubscription =
                                            page.dataStream?.listen((data) {
                                          data.forEach((item) {
                                            final itemIndexes = _model
                                                .pagingController!.itemList!
                                                .asMap()
                                                .map((k, v) => MapEntry(
                                                    v.reference.id, k));
                                            final index =
                                                itemIndexes[item.reference.id];
                                            final items = _model
                                                .pagingController!.itemList!;
                                            if (index != null) {
                                              items.replaceRange(
                                                  index, index + 1, [item]);
                                              _model.pagingController!
                                                  .itemList = {
                                                for (var item in items)
                                                  item.reference: item
                                              }.values.toList();
                                            }
                                          });
                                          setState(() {});
                                        });
                                        _model.streamSubscriptions
                                            .add(streamSubscription);
                                      });
                                    });
                                    return _model.pagingController!;
                                  }(),
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<PostsRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 12.0,
                                        height: 12.0,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                    itemBuilder: (context, _, postFeedIndex) {
                                      final postFeedPostsRecord = _model
                                          .pagingController!
                                          .itemList![postFeedIndex];
                                      return PostWidget(
                                        key: Key(
                                            'Keynps_${postFeedIndex}_of_${_model.pagingController!.itemList!.length}'),
                                        post: postFeedPostsRecord,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
