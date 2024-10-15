// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;


contract Twitter {

    uint16 constant MAX_TWEET_LENGTH = 280;

    struct Tweet {
        uint id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[] ) public tweets;

    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is too long bro!");

        uint256 tweetId = tweets[msg.sender].length;
        Tweet memory newTweet = Tweet({
            id: tweetId,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes:0
        });

        tweets[msg.sender].push(newTweet);
    } 

    function likeTweet(uint id, address author) external {
        require(id == tweets[author][id].id, "TWEET DOES NOT EXISTS.");
        tweets[author][id].likes += 1;
    }

    function unlikeTweet(uint id, address author) external {
        require(id == tweets[author][id].id, "TWEET DOES NOT EXISTS.");
        require(0 < tweets[author][id].likes, "Tweet must have at least one like to be unliked");
        tweets[author][id].likes -= 1;
    }

    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }
    
    function getAllTweets() public view returns (Tweet[] memory) {
        return tweets[msg.sender];
    }
}
