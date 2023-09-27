import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'details_page_model.dart';
export 'details_page_model.dart';

class DetailsPageWidget extends StatefulWidget {
  const DetailsPageWidget({
    Key? key,
    required this.details,
  }) : super(key: key);

  final DocumentReference? details;

  @override
  _DetailsPageWidgetState createState() => _DetailsPageWidgetState();
}

class _DetailsPageWidgetState extends State<DetailsPageWidget> {
  late DetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<MenuItemsRecord>(
      stream: MenuItemsRecord.getDocument(widget.details!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final detailsPageMenuItemsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                detailsPageMenuItemsRecord.productImage,
                                width: double.infinity,
                                height: 230.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 0.0, 0.0),
                            child: Text(
                              detailsPageMenuItemsRecord.name,
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 0.0, 0.0),
                            child: Text(
                              formatNumber(
                                detailsPageMenuItemsRecord.price,
                                formatType: FormatType.custom,
                                currency: '',
                                format: '',
                                locale: '',
                              ),
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                          Divider(
                            height: 20.0,
                            thickness: 2.0,
                            indent: 16.0,
                            endIndent: 16.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Description',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 0.0),
                            child: Text(
                              detailsPageMenuItemsRecord.description,
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment:
                                        AlignmentDirectional(-0.90, 0.00),
                                    child: Text(
                                      'Type of Milk',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowCheckboxGroup(
                                  options: [
                                    'Organic Whole milk',
                                    'Almond Milk',
                                    'Oat Milk'
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.checkboxGroupValues1 = val),
                                  controller:
                                      _model.checkboxGroupValueController1 ??=
                                          FormFieldController<List<String>>(
                                    [],
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: Colors.white,
                                  checkboxBorderColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  checkboxBorderRadius:
                                      BorderRadius.circular(4.0),
                                  initialized:
                                      _model.checkboxGroupValues1 != null,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment:
                                        AlignmentDirectional(-0.90, 0.00),
                                    child: Text(
                                      'Size',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowCheckboxGroup(
                                  options: ['12oz', '16oz'],
                                  onChanged: (val) => setState(
                                      () => _model.checkboxGroupValues2 = val),
                                  controller:
                                      _model.checkboxGroupValueController2 ??=
                                          FormFieldController<List<String>>(
                                    [],
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: Colors.white,
                                  checkboxBorderColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  checkboxBorderRadius:
                                      BorderRadius.circular(4.0),
                                  initialized:
                                      _model.checkboxGroupValues2 != null,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment:
                                        AlignmentDirectional(-0.90, 0.00),
                                    child: Text(
                                      'Ice / Hot',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowCheckboxGroup(
                                  options: ['Iced', 'Hot'],
                                  onChanged: (val) => setState(
                                      () => _model.checkboxGroupValues3 = val),
                                  controller:
                                      _model.checkboxGroupValueController3 ??=
                                          FormFieldController<List<String>>(
                                    [],
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: Colors.white,
                                  checkboxBorderColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  checkboxBorderRadius:
                                      BorderRadius.circular(4.0),
                                  initialized:
                                      _model.checkboxGroupValues3 != null,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment:
                                        AlignmentDirectional(-0.90, 0.00),
                                    child: Text(
                                      'Quanity',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          FFAppState().addToCart(CartItemStruct(
                            menuitemRef: detailsPageMenuItemsRecord.reference,
                            quantity: detailsPageMenuItemsRecord.quantity,
                          ));
                          FFAppState().cartSum = FFAppState().cartSum +
                              detailsPageMenuItemsRecord.price.toDouble();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Added to list',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0xFF2DDBC4),
                          ),
                        );
                      },
                      text: 'Add To Cart',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
