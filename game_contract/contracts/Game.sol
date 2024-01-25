pragma solidity ^0.8.0;

contract Game {
    address private _issuerAddress;
    uint256 private _lineOfCredit;
    uint256 private _position;
    uint256 private _ratio;

    constructor() {
        _issuerAddress = msg.sender;
    }

    function setIssuer(address issuerAddress) public returns (bool success) {
        require(msg.sender == _issuerAddress, "Only issuer can set new issuer");
        _issuerAddress = issuerAddress;
        return true;
    }

    function issuer() external view returns (address) {
        return _issuerAddress;
    }

    function setRatio(uint256 ratioNumber) public returns (bool success) {
        require(msg.sender == _issuerAddress, "Only issuer can set new ratio");
        _ratio = ratioNumber;
        return true;
    }

    function ratio() external view returns (uint256) {
        return _ratio;
    }

    function setLineOfCredit(
        uint256 lineOfCreditAmount
    ) public returns (bool success) {
        require(msg.sender == _issuerAddress, "Only issuer can set line of credit");
        _lineOfCredit = lineOfCreditAmount;
        return true;
    }

    function lineOfCredit() external view returns (uint256) {
        return _lineOfCredit;
    }

    function movePlayer(uint256 postionMove) public returns (bool success) {
        require(msg.sender == _issuerAddress, "Only issuer can move player");
        _position = _position + postionMove;
        return true;
    }

    function position() external view returns (uint256) {
        return _position;
    }
}
