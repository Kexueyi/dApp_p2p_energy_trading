// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
pragma experimental ABIEncoderV2;


contract DoubleAuction {
  string public name = "Energy P2P";

  address owner;

  uint openingTime;
  uint closingTime;
  uint currentTime;
  uint revStaTime;
  uint revEndTime;

  modifier onlyWhileOpen() {
    require(block.timestamp >= openingTime && block.timestamp <= closingTime, "Auction has closed, please wait for the next auction");
    _;
  }

  modifier onlyAdmin() {
    require(msg.sender == owner);
    _;
  }

  struct SellOrder {
    address seller;
    uint price;
    uint energy;
    uint timestamp;
  }

  struct BuyOrder {
    address buyer;
    uint price;
    uint energy;
    uint timestamp;
  }

  struct Temp {
    address seller;
    uint price;
    uint energy;
    uint timestamp;
  }

  Temp[] public temp;
  SellOrder[] public sellOrders;
  BuyOrder[] public buyOrders;

  mapping(uint256 => uint) public sellIndex;
  mapping(uint256 => uint) public buyIndex;

  event EnergySold(
    address indexed seller,
    uint256 indexed price,
    uint64 energy
  );

  event EnergyBought(
    address indexed buyer,
    uint256 price,
    uint64 energy
  );

  event PriceCleared(
    uint price,
    uint quantity
  );

  event clearedOffer(
    address indexed agent,
    uint price,
    uint quantity,
    uint timestamp,
    string status
  );

  event statePhase(uint phase);

  event auctionTime(
    uint start,
    uint end
  );
  event revealTime(
    uint start,
    uint end
  );
  event Array(
    int buy,
    int sell
  );

  event clearedAmount(uint buy, uint sell);
  
  constructor(address timer) public {
    owner = timer;
  }

  function startAuction(uint dur_bid,uint dur_rev) public onlyAdmin {
    openingTime = block.timestamp;
    closingTime = openingTime + dur_bid;
    revStaTime = closingTime;
    revEndTime = revStaTime + dur_rev;
    emit statePhase(0);
    emit auctionTime(openingTime, closingTime);
    emit revealTime(revStaTime,revEndTime);
  }

  function startReveal() public onlyAdmin {
    emit statePhase(1);
  }

  function getBuy() public view returns(BuyOrder[] memory) {
    return buyOrders;
  }
  
  function getSell() public view returns(SellOrder[] memory){
    return sellOrders;
  }

  // Sort the orders into SellOrders or BuyOrders
  function sellBuyEnergy(uint _price, uint _energy, uint _identity) public onlyWhileOpen {
    uint _timestamp = block.timestamp;
    // 1 is Seller, 0 is Buyer
    if (_identity == 1) {
      sellOrders.push(SellOrder({
        seller: msg.sender,
        price: _price,
        energy: _energy,
        timestamp: _timestamp
      }));
      sortSellOrder(0, int(sellOrders.length - 1 ));
    } else {
      buyOrders.push(BuyOrder({
        buyer: msg.sender,
        price: _price,
        energy: _energy,
        timestamp: _timestamp
      }));
      sortBuyOrder(0, int(buyOrders.length - 1 ));
    }
  }

  function sortSellOrder(int start, int end) internal {
    int i = start;
    int j = end;
    uint length = 0;
    uint pivotIndex = uint(start + (end - start) / 2);
    uint pivot = sellOrders[pivotIndex].price;
    while (i <= j) {
      while (sellOrders[uint(i)].price < pivot) i++;
      while (sellOrders[uint(j)].price > pivot) j--;
      if (i <= j) {
        sellOrders.push(SellOrder({
          seller: sellOrders[uint(i)].seller,
          price: sellOrders[uint(i)].price,
          energy: sellOrders[uint(i)].energy,
          timestamp: sellOrders[uint(i)].timestamp
        }));
        length = uint(sellOrders.length - 1);
        sellOrders[uint(i)] = sellOrders[uint(j)];
        sellOrders[uint(j)] = sellOrders[length];
        sellOrders.pop();
        i++;
        j--;
      }
    }
    if (start < j)
      sortSellOrder(start, j);
    if (i < end)
      sortSellOrder(i, end);
  }

  function sortBuyOrder(int start, int end) internal {
    int i = start;
    int j = end;
    uint length = 0;
    uint pivotIndex = uint(start + (end - start) / 2);
    uint pivot = buyOrders[pivotIndex].price;
    while (i <= j) {
      while (buyOrders[uint(i)].price > pivot) i++;
      while (buyOrders[uint(j)].price < pivot) j--;
      if (i <= j) {
        buyOrders.push(BuyOrder({
          buyer: buyOrders[uint(i)].buyer,
          price: buyOrders[uint(i)].price,
          energy: buyOrders[uint(i)].energy,
          timestamp: buyOrders[uint(i)].timestamp
        }));  
        length = uint(buyOrders.length - 1);
        buyOrders[uint(i)] = buyOrders[uint(j)];
        buyOrders[uint(j)] = buyOrders[length];
        buyOrders.pop();
        i++;
        j--;
      }
    }
    if (start < j)
      sortBuyOrder(start, j);
    if (i < end)
      sortBuyOrder(i, end);
  }

  function marketClearing() public onlyAdmin {
    require(block.timestamp > closingTime);
      emit statePhase(2);
      int i = 0;
      int j = 0;
      int feasible_i = 0;
      int feasible_j = 0;
      uint buy_sum = 0;
      uint sell_sum = 0;
      uint cumulated = 0;
      uint price = 0;
      uint quantity = 0;

      if (buyOrders.length> 0 && sellOrders.length > 0 && buyOrders[0].price >= sellOrders[0].price) {
        while (buyOrders[uint(i)].price >= sellOrders[uint(j)].price) {
          if (buy_sum == sell_sum) {
            buy_sum += buyOrders[uint(i)].energy;
            sell_sum += sellOrders[uint(j)].energy;
          } else if (buy_sum > sell_sum) {
            sell_sum += sellOrders[uint(j)].energy;
          } else if (buy_sum < sell_sum) {
            buy_sum += buyOrders[uint(i)].energy;
          }
          feasible_i = i;
          feasible_j = j;
          if (buy_sum > sell_sum) {
            j ++;
          } else if (buy_sum < sell_sum) {
            i ++;
          } else {
            i ++;
            j ++;
          }
          if ((i >= int(buyOrders.length)) || (j >= int(sellOrders.length))) {
            break;
          }
        }

        price = uint((sellOrders[uint(feasible_j)].price + buyOrders[uint(feasible_i)].price) / 2);
        if (buy_sum > sell_sum) {
          quantity = sell_sum;
        } else {
          quantity = buy_sum;
        }
        emit clearedAmount(buy_sum,sell_sum);
        emit PriceCleared(price, quantity);

        for (uint z = 0; z < uint(sellOrders.length); z++){
          if (cumulated < quantity){
            if(cumulated + sellOrders[z].energy <= quantity){
              // fully cleared
              emit clearedOffer(sellOrders[z].seller, price, sellOrders[z].energy, block.timestamp, 'Sold');
            }else{
              //partially cleared
              emit clearedOffer(sellOrders[z].seller, price, quantity-cumulated, block.timestamp, 'Sold');
            }
          }else{
            //fully served by grid
            emit clearedOffer(sellOrders[z].seller, 0, 0, block.timestamp, 'Bid unsuccessful');
          }
          cumulated += sellOrders[z].energy;
        }

        cumulated = 0;
        for (uint y = 0; y < uint(buyOrders.length); y++){
          if (cumulated < quantity){
            if(cumulated + buyOrders[y].energy <= quantity){
              // fully cleared
              emit clearedOffer(buyOrders[y].buyer, price, buyOrders[y].energy, block.timestamp, 'Bought');
            }else{
              //partially cleared
              emit clearedOffer(buyOrders[y].buyer, price, quantity-cumulated, block.timestamp, 'Bought');
            }
          }else{
            //fully served by grid
            emit clearedOffer(buyOrders[y].buyer, 0, 0, block.timestamp, 'Bid unsuccessful');
          }
          cumulated += buyOrders[y].energy;
        }

        delete sellOrders;
        delete buyOrders;

      } else {
	emit clearedAmount(buy_sum,sell_sum);
        emit PriceCleared(price, quantity);
        delete sellOrders;
        delete buyOrders;

      }
  }
}