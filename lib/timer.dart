import 'dart:async';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

import 'package:d_app/configuration.dart';

enum AuctionStage { startBidding, startRevealing, startClearing }

class AuctionManager {
  void Function(AuctionStage)? _onUpdateStatus;
  void Function(Duration)? _onUpdateTimer;

  set onUpdateStatus(void Function(AuctionStage) callback) {
    _onUpdateStatus = callback;
  }

  set onUpdateTimer(void Function(Duration) callback) {
    _onUpdateTimer = callback;
  }

  late AuctionStage _stage;
  late Timer _timer;
  late Web3Client _client;
  late DeployedContract _contract;
  late Credentials _credentials;

  AuctionManager() {
    _client = Web3Client(rpcUrl, http.Client());
    _contract = doubleAuctionContract;
    _initialize();
  }

Future<void> _initialize() async {
  // Use the owner's private key instead of the default one
  _credentials = EthPrivateKey.fromHex(ownerPrivateKey);

  // Get the address associated with the private key
  EthereumAddress derivedAddress = _credentials.address;
  print('Derived Address: $derivedAddress');
  print('Expected Owner Address: $ownerAddress');
}


  void start() {
    _stage = AuctionStage.startBidding;
    _onUpdateStatus?.call(_stage);
    _timer = Timer.periodic(Duration(seconds: 1), _tick);
  }

  void _tick(Timer timer) {
    // Update the timer display
    _onUpdateTimer?.call(Duration(seconds: timer.tick));

    if (timer.tick % 10 == 0) {
      // Change the stage every 10 seconds for demonstration purposes
      _stage =
          AuctionStage.values[(_stage.index + 1) % AuctionStage.values.length];
      _onUpdateStatus?.call(_stage);

      switch (_stage) {
        case AuctionStage.startBidding:
          _startAuction();
          break;
        case AuctionStage.startRevealing:
          _startReveal();
          break;
        case AuctionStage.startClearing:
          _marketClearing();
          break;
      }
    }
  }

  void stop() {
    _timer.cancel();
  }

  Future<void> _startAuction() async {
    // Add the smart contract function call for starting the auction here
    BigInt dur_bid = BigInt.from(60);
    BigInt dur_rev = BigInt.from(20);
    var startAuctionFunction = _contract.function('startAuction');
    await _client.sendTransaction(
      _credentials,
      Transaction.callContract(
          contract: _contract,
          function: startAuctionFunction,
          parameters: [dur_bid, dur_rev]),
    );
  }

  Future<void> _startReveal() async {
    // Add the smart contract function call for starting the reveal phase here
    var startRevealFunction = _contract.function('startReveal');
    await _client.sendTransaction(
      _credentials,
      Transaction.callContract(
          contract: _contract, function: startRevealFunction, parameters: []),
    );
  }

  Future<void> _marketClearing() async {
    // Add the smart contract function call for market clearing here
    var marketClearingFunction = _contract.function('marketClearing');
    await _client.sendTransaction(
      _credentials,
      Transaction.callContract(
          contract: _contract,
          function: marketClearingFunction,
          parameters: []),
    );
  }
}
