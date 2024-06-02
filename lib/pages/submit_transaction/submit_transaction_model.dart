import 'package:flutter/material.dart';
import 'package:d_app/double_auction.g.dart';
import 'package:d_app/configuration.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class SubmitTransactionModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController? priceController;
  TextEditingController? quantityController;
  int identity = 0;

   Future<void> sellBuyEnergy() async {
    // Set up the function parameters from the TextEditingController
    final BigInt price = BigInt.parse(priceController!.text);
    final BigInt energy = BigInt.parse(quantityController!.text);
    final BigInt identity = BigInt.from(this.identity);

    // Create an instance of the DoubleAuction class
    final Web3Client client = Web3Client(rpcUrl, Client());
    final DoubleAuction doubleAuction = DoubleAuction(
      rpcUrl,
      doubleAuctionAbi,
      address: contractAddress,
      client: client,
    );

    // Call the sellBuyEnergy function
    final transactionId = await doubleAuction.sellBuyEnergy(
      price,
      energy,
      identity,
      credentials: EthPrivateKey.fromHex(privateKey),
    );

    print('Transaction ID: $transactionId');
  }

  void dispose() {
    priceController?.dispose();
    quantityController?.dispose();
  }
}

