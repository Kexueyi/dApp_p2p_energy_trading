import 'package:flutter/material.dart';
import 'package:d_app/timer.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class AuctionStatus extends StatefulWidget {
  final AuctionManager auctionManager;

  AuctionStatus({required this.auctionManager});

  @override
  _AuctionStatusState createState() => _AuctionStatusState();
}

class _AuctionStatusState extends State<AuctionStatus> {
  String _currentPhase = '';
  String _timeLeft = '';

  @override
  void initState() {
    super.initState();
    widget.auctionManager.onUpdateStatus = _updatePhase;
    widget.auctionManager.onUpdateTimer = _updateTimeLeft;
  }

  void _updatePhase(AuctionStage stage) {
    setState(() {
      _currentPhase = stage.toString().split('.').last;
    });
  }

  void _updateTimeLeft(Duration duration) {
    setState(() {
      _timeLeft = '${duration.inMinutes}:${duration.inSeconds % 60}';
    });
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
              child: Text(
                'Current Phase:',
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 10.0),
              child: Text(
                ' $_currentPhase',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                    ),
              ),
            ),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
              child: Text(
                'Time Left:',
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 5.0),
              child: Text(
                '$_timeLeft',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
