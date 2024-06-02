import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class PriceQuantityWidget extends StatelessWidget {
  const PriceQuantityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      height: 280.0,
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
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Text(
                'Price/Quantity',
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
            ),
            Text(
              'Buy Bids',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'price',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  'amount',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  '10:49',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                'Sell Bids',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'price',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  'amount',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  '10:49',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
