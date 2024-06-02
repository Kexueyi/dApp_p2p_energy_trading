// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[{"internalType":"address","name":"timer","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"int256","name":"buy","type":"int256"},{"indexed":false,"internalType":"int256","name":"sell","type":"int256"}],"name":"Array","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"buyer","type":"address"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"},{"indexed":false,"internalType":"uint64","name":"energy","type":"uint64"}],"name":"EnergyBought","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"seller","type":"address"},{"indexed":true,"internalType":"uint256","name":"price","type":"uint256"},{"indexed":false,"internalType":"uint64","name":"energy","type":"uint64"}],"name":"EnergySold","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"quantity","type":"uint256"}],"name":"PriceCleared","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"start","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"end","type":"uint256"}],"name":"auctionTime","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"buy","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"sell","type":"uint256"}],"name":"clearedAmount","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"agent","type":"address"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"quantity","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"timestamp","type":"uint256"},{"indexed":false,"internalType":"string","name":"status","type":"string"}],"name":"clearedOffer","type":"event"},{"inputs":[],"name":"marketClearing","outputs":[],"stateMutability":"nonpayable","type":"function"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"start","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"end","type":"uint256"}],"name":"revealTime","type":"event"},{"inputs":[{"internalType":"uint256","name":"_price","type":"uint256"},{"internalType":"uint256","name":"_energy","type":"uint256"},{"internalType":"uint256","name":"_identity","type":"uint256"}],"name":"sellBuyEnergy","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"dur_bid","type":"uint256"},{"internalType":"uint256","name":"dur_rev","type":"uint256"}],"name":"startAuction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"startReveal","outputs":[],"stateMutability":"nonpayable","type":"function"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"phase","type":"uint256"}],"name":"statePhase","type":"event"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"buyIndex","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"buyOrders","outputs":[{"internalType":"address","name":"buyer","type":"address"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"uint256","name":"energy","type":"uint256"},{"internalType":"uint256","name":"timestamp","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getBuy","outputs":[{"components":[{"internalType":"address","name":"buyer","type":"address"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"uint256","name":"energy","type":"uint256"},{"internalType":"uint256","name":"timestamp","type":"uint256"}],"internalType":"struct DoubleAuction.BuyOrder[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getSell","outputs":[{"components":[{"internalType":"address","name":"seller","type":"address"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"uint256","name":"energy","type":"uint256"},{"internalType":"uint256","name":"timestamp","type":"uint256"}],"internalType":"struct DoubleAuction.SellOrder[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"sellIndex","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"sellOrders","outputs":[{"internalType":"address","name":"seller","type":"address"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"uint256","name":"energy","type":"uint256"},{"internalType":"uint256","name":"timestamp","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"temp","outputs":[{"internalType":"address","name":"seller","type":"address"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"uint256","name":"energy","type":"uint256"},{"internalType":"uint256","name":"timestamp","type":"uint256"}],"stateMutability":"view","type":"function"}]',
  'DoubleAuction',
);

class DoubleAuction extends _i1.GeneratedContract {
  DoubleAuction(String rpcUrl, String contractAbi, {
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> marketClearing({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '256a9ea1'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> sellBuyEnergy(
    BigInt _price,
    BigInt _energy,
    BigInt _identity, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, 'e3186ae7'));
    final params = [
      _price,
      _energy,
      _identity,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> startAuction(
    BigInt dur_bid,
    BigInt dur_rev, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '4fee13fc'));
    final params = [
      dur_bid,
      dur_rev,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> startReveal({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, 'ad72202b'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> buyIndex(
    BigInt $param5, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, 'ae5213ce'));
    final params = [$param5];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BuyOrders> buyOrders(
    BigInt $param6, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '35cea288'));
    final params = [$param6];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return BuyOrders(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getBuy({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '30e664f6'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getSell({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, '1af526b0'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> name({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, '06fdde03'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as String);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> sellIndex(
    BigInt $param7, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, '61f61812'));
    final params = [$param7];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<SellOrders> sellOrders(
    BigInt $param8, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, '4a8393f3'));
    final params = [$param8];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return SellOrders(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<Temp> temp(
    BigInt $param9, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, '6c3755ad'));
    final params = [$param9];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return Temp(response);
  }

  /// Returns a live stream of all Array events emitted by this contract.
  Stream<Array> arrayEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('Array');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return Array(decoded);
    });
  }

  /// Returns a live stream of all EnergyBought events emitted by this contract.
  Stream<EnergyBought> energyBoughtEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('EnergyBought');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return EnergyBought(decoded);
    });
  }

  /// Returns a live stream of all EnergySold events emitted by this contract.
  Stream<EnergySold> energySoldEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('EnergySold');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return EnergySold(decoded);
    });
  }

  /// Returns a live stream of all PriceCleared events emitted by this contract.
  Stream<PriceCleared> priceClearedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('PriceCleared');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return PriceCleared(decoded);
    });
  }

  /// Returns a live stream of all auctionTime events emitted by this contract.
  Stream<auctionTime> auctionTimeEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('auctionTime');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return auctionTime(decoded);
    });
  }

  /// Returns a live stream of all clearedAmount events emitted by this contract.
  Stream<clearedAmount> clearedAmountEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('clearedAmount');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return clearedAmount(decoded);
    });
  }

  /// Returns a live stream of all clearedOffer events emitted by this contract.
  Stream<clearedOffer> clearedOfferEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('clearedOffer');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return clearedOffer(decoded);
    });
  }

  /// Returns a live stream of all revealTime events emitted by this contract.
  Stream<revealTime> revealTimeEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('revealTime');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return revealTime(decoded);
    });
  }

  /// Returns a live stream of all statePhase events emitted by this contract.
  Stream<statePhase> statePhaseEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('statePhase');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return statePhase(decoded);
    });
  }
}

class BuyOrders {
  BuyOrders(List<dynamic> response)
      : buyer = (response[0] as _i1.EthereumAddress),
        price = (response[1] as BigInt),
        energy = (response[2] as BigInt),
        timestamp = (response[3] as BigInt);

  final _i1.EthereumAddress buyer;

  final BigInt price;

  final BigInt energy;

  final BigInt timestamp;
}

class SellOrders {
  SellOrders(List<dynamic> response)
      : seller = (response[0] as _i1.EthereumAddress),
        price = (response[1] as BigInt),
        energy = (response[2] as BigInt),
        timestamp = (response[3] as BigInt);

  final _i1.EthereumAddress seller;

  final BigInt price;

  final BigInt energy;

  final BigInt timestamp;
}

class Temp {
  Temp(List<dynamic> response)
      : seller = (response[0] as _i1.EthereumAddress),
        price = (response[1] as BigInt),
        energy = (response[2] as BigInt),
        timestamp = (response[3] as BigInt);

  final _i1.EthereumAddress seller;

  final BigInt price;

  final BigInt energy;

  final BigInt timestamp;
}

class Array {
  Array(List<dynamic> response)
      : buy = (response[0] as BigInt),
        sell = (response[1] as BigInt);

  final BigInt buy;

  final BigInt sell;
}

class EnergyBought {
  EnergyBought(List<dynamic> response)
      : buyer = (response[0] as _i1.EthereumAddress),
        price = (response[1] as BigInt),
        energy = (response[2] as BigInt);

  final _i1.EthereumAddress buyer;

  final BigInt price;

  final BigInt energy;
}

class EnergySold {
  EnergySold(List<dynamic> response)
      : seller = (response[0] as _i1.EthereumAddress),
        price = (response[1] as BigInt),
        energy = (response[2] as BigInt);

  final _i1.EthereumAddress seller;

  final BigInt price;

  final BigInt energy;
}

class PriceCleared {
  PriceCleared(List<dynamic> response)
      : price = (response[0] as BigInt),
        quantity = (response[1] as BigInt);

  final BigInt price;

  final BigInt quantity;
}

class auctionTime {
  auctionTime(List<dynamic> response)
      : start = (response[0] as BigInt),
        end = (response[1] as BigInt);

  final BigInt start;

  final BigInt end;
}

class clearedAmount {
  clearedAmount(List<dynamic> response)
      : buy = (response[0] as BigInt),
        sell = (response[1] as BigInt);

  final BigInt buy;

  final BigInt sell;
}

class clearedOffer {
  clearedOffer(List<dynamic> response)
      : agent = (response[0] as _i1.EthereumAddress),
        price = (response[1] as BigInt),
        quantity = (response[2] as BigInt),
        timestamp = (response[3] as BigInt),
        status = (response[4] as String);

  final _i1.EthereumAddress agent;

  final BigInt price;

  final BigInt quantity;

  final BigInt timestamp;

  final String status;
}

class revealTime {
  revealTime(List<dynamic> response)
      : start = (response[0] as BigInt),
        end = (response[1] as BigInt);

  final BigInt start;

  final BigInt end;
}

class statePhase {
  statePhase(List<dynamic> response) : phase = (response[0] as BigInt);

  final BigInt phase;
}
