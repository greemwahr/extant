pragma solidity ^0.4.15;

// Proof of Existence contract, version 2
contract ProofOfExistence2 {
    // State
    bytes32[] private proofs;

    // Store a proof of existence in the contract state
    // *transactional function*
    function storeProof (bytes32 proof) public {
        proofs.push(proof);
    }

    // Calculate and store the proof for a document
    // *transactional function*
    function notarize (string document) public {
        bytes32 proof = proofFor(document);
        storeProof(proof);
    }

    // Helper function to get a document's sha256
    // *read-only function*
    function proofFor(string document) public view returns (bytes32) {
        return sha256(document);
    }

    // Check if a document has been notarized
    // *read-only function*
    function checkDocument(string document) public view returns (bool) {
        bytes32 proof = proofFor(document);
        return hasProof(proof);
    }

    // Returns true if proof is stored
    // *read-only function*
    function hasProof(bytes32 proof) public view returns (bool) {
        for (uint256 i = 0; i < proofs.length; i++) {
            if (proofs[i] == proof) {
                return true;
            }
        }
        return false;
    }
}