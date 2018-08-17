pragma solidity ^ 0.4 .22;

// Proof of Existence contract, version 1
contract ProofOfExistence1 {
    // State
    bytes32 public proof;

    // Calculate and store the proof for document
    // *transactional function*
    function notarize(string document) public {
        proof = proofFor(document);
    }

    // helper function to get a document's sha256
    // *read-only function*
    function proofFor(string document) constant returns(bytes32) {
        return sha256(document);
    }
}