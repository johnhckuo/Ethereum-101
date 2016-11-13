pragma solidity ^0.4.2;

// before deploying, this import must be replaced by actual code instead of URL
import "dev.oraclize.it/api.sol";

contract Customer is usingOraclize{

  uint public viewsCount;

  function YoutubeViews() {
      update(0);
  }

  function __callback(bytes32 myid, string result) {
      if (msg.sender != oraclize_cbAddress()) throw;
      viewsCount = parseInt(result, 0);
      // do something with viewsCount
      // (like tipping the author once viewsCount > X?)
      update(60*10); // update viewsCount every 10 minutes
  }

  function update(uint delay) {
      oraclize_query(delay, 'URL', 'html(https://www.youtube.com/watch?v=9bZkp7q19f0).xpath(//*[contains(@class, "watch-view-count")]/text())');
  }

}
