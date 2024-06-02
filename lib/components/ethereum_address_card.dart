import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memoize/memoize.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class EthereumAddressDisplay extends StatefulWidget {
  @override
  _EthereumAddressDisplayState createState() => _EthereumAddressDisplayState();
}

class _EthereumAddressDisplayState extends State<EthereumAddressDisplay>
    with WidgetsBindingObserver {
  String formatAddress(String address) {
    return address.substring(0, 10) +
        '...' +
        address.substring(address.length - 10);
  }

  final getUserData = memo1((String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots();
  });

  @override
  Widget build(BuildContext context) {
    print('Building EthereumAddressDisplay widget');
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<DocumentSnapshot>(
      stream: getUserData(currentUserId),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.hasData) {
          final currentUserDoc = snapshot.data!;

          if (currentUserDoc.exists) {
            final address = formatAddress(currentUserDoc['address']);
            return Text(
              address,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
            );
          } else {
            return Text('Ethereum address not found');
          }
        } else {
          return Text('No data');
        }
      },
    );
  }
}
