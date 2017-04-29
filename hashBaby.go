package main

import (
	"fmt"

	"github.com/ethereum/go-ethereum/crypto"
)

//start main OMIT
func prKeccak(what string) {
	fmt.Println(crypto.Keccak256Hash([]byte(what)).Hex())
}

func main() {
	prKeccak("Young man, in mathematics you don't understand things. You just get used to them.")
	prKeccak("Young man. in mathematics you don't understand things. You just get used to them.")
}

//end main OMIT
