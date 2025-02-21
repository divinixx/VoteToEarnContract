pragma solidity ^0.8.0;

contract Voting {
    // Mapping to track whether an address has voted.
    mapping(address => bool) public hasVoted;
    
    // Mapping to track the token balance for each participant.
    mapping(address => uint256) public tokenBalance;
    
    // Total number of votes cast.
    uint256 public totalVotes;
    
    // Constant reward amount for each vote.
    uint256 public constant REWARD_TOKENS = 1;

    // Event to emit when a vote is cast.
    event VoteCast(address indexed voter, uint256 totalVotes);

    // Function to cast a vote.
    function vote() public {
        // Ensure the caller has not already voted.
        require(!hasVoted[msg.sender], "You have already voted.");
        
        // Mark the caller as having voted.
        hasVoted[msg.sender] = true;
        
        // Increment the total vote count.
        totalVotes += 1;
        
        // Reward the voter with tokens.
        tokenBalance[msg.sender] += REWARD_TOKENS;

        // Emit an event for better tracking.
        emit VoteCast(msg.sender, totalVotes);
    }
}
