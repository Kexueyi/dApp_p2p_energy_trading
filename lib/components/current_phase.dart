import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class CurrentPhaseWidget extends StatelessWidget {
  const CurrentPhaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      height: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x34090F13),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Current Phase',
            //   style: FlutterFlowTheme.of(context).titleMedium.override(
            //         fontFamily: 'Poppins',
            //         fontSize: 16.0,
            //       ),
            // ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              // child: AuctionTimeWidget(),
            ),
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            //   child: Text(
            //     'Time Remain',
            //     style: FlutterFlowTheme.of(context).titleMedium.override(
            //           fontFamily: 'Poppins',
            //           fontSize: 16.0,
            //         ),
            //   ),
            // ),
            // Text(
            //   '60 seconds',
            //   style: FlutterFlowTheme.of(context).bodySmall.override(
            //         fontFamily: 'Poppins',
            //         color: FlutterFlowTheme.of(context).primary,
            //         fontSize: 20.0,
            //       ),
            // ),
          ],
        ),
      ),
    );
  }
}
