pragma solidity ^0.4.22;

contract ProofOfExistence3 {
    mapping (bytes32 => bool) private proofs;

    // Store a proof of existence in the contract state
    function storeProof (bytes32 proof) private {
        proofs[proof] = true;
    }

    // Calculate and store the proof for a document
    function notarize (string document) public {
        bytes32 proof = proofFor(document);
        storeProof(proof);
    }

    // helper function to get a document's sha256
    function proofFor (string document) private pure returns (bytes32) {
        return sha256(document);
    } 

    // Check if a document has been notarised
    function checkDocument (string document) public view returns (bool) {
        bytes32 proof = proofFor(document);
        return hasProof(proof);
    }

    // Return true if proof is stored
    function hasProof (bytes32 proof) private view returns (bool) {
        return proofs[proof];
    }
}
