// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//This contract convert checks ETH/USD rates and Vice Versa

//import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"; 

interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(
    uint80 _roundId
  ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

  function latestRoundData()
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

contract RateConverter{

    //uint256 public price;

    uint256 public ethAmount;

    uint256 public dollarAmount;

    uint256 public dollar;
    

    function ethToUSD(uint256 _ethAmount) public   returns(uint256) {
        

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();

        //require(price > 0, "Invalid price");
        ethAmount = (_ethAmount * uint256(price))/1e8;
        return ethAmount;

    }

    function usdToEth(uint256 _dollarAmount) public  returns(uint256) {

                AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
                (,int256 price,,,) = priceFeed.latestRoundData();
                
                dollarAmount = (_dollarAmount * 1e18) / uint256(price) * 1e8;
                
                //dollar = uint256(price);
                return dollarAmount; //price in wei



    }
}
