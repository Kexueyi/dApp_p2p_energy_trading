import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

class DoubleAuctionSingleton {
  static final DoubleAuctionSingleton _instance = DoubleAuctionSingleton._internal();

  factory DoubleAuctionSingleton() {
    return _instance;
  }

  DoubleAuctionSingleton._internal();

  DeployedContract? _doubleAuctionContract;
  Web3Client? _client;

  Future<void> initialize(Web3Client client, String contractAddress) async {
    _client = client;

    // Load the ABI (Application Binary Interface) of the contract
    String abiString = await rootBundle.loadString('assets/DoubleAuction.json');
    final contractAbi = ContractAbi.fromJson(abiString,'DoubleAuction');

    // Create an instance of the contract
    _doubleAuctionContract = DeployedContract(contractAbi, EthereumAddress.fromHex(contractAddress));
  }

  DeployedContract get doubleAuctionContract {
    if (_doubleAuctionContract == null) {
      throw Exception('Double auction contract not initialized. Call initialize() first.');
    }
    return _doubleAuctionContract!;
  }

  Web3Client get client {
    if (_client == null) {
      throw Exception('Web3 client not initialized. Call initialize() first.');
    }
    return _client!;
  }
}
