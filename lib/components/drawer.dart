import 'package:d_app/flutter_flow/nav/nav.dart';
import 'package:flutter/material.dart';
import 'package:styled_divider/styled_divider.dart';

import '../auth/firebase_auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.mounted}) : super(key: key);
  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 14.0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Color(0xFF768EF5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 270.0,
                          height: 160.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF507BF5),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Text(
                              'Peer-to-peer\nEnergy Trading Auction',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 28.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              StyledDivider(
                height: 25.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
                lineStyle: DividerLineStyle.dotted,
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('user_account');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.account_box_rounded,
                    color: Color(0xFF354AA4),
                    size: 35.0,
                  ),
                  title: Text(
                    'Account',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 21.0,
                        ),
                  ),
                  subtitle: Text(
                    'Manage Your Trading Account',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: FlutterFlowTheme.of(context).accent2,
                    size: 20.0,
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: true,
                ),
              ),
              StyledDivider(
                height: 25.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
                lineStyle: DividerLineStyle.dotted,
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('user_account');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Color(0xFF354AA4),
                    size: 35.0,
                  ),
                  title: Text(
                    'Settings',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 21.0,
                        ),
                  ),
                  subtitle: Text(
                    'Trading System Settings',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: FlutterFlowTheme.of(context).accent2,
                    size: 20.0,
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: true,
                ),
              ),
              StyledDivider(
                height: 25.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
                lineStyle: DividerLineStyle.dotted,
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();
                  context.goNamedAuth('welcome', mounted);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Color(0xFF354AA4),
                    size: 35.0,
                  ),
                  title: Text(
                    'Log Out',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 21.0,
                        ),
                  ),
                  subtitle: Text(
                    'Tap to log out',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: FlutterFlowTheme.of(context).accent2,
                    size: 20.0,
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              StyledDivider(
                height: 25.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
                lineStyle: DividerLineStyle.dotted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
