package main

import (
	"fmt"

	"github.com/ethereum/go-ethereum/crypto"
)

func main() {
	str := "Young man, in mathematics you don't understand things. You just get used to them."
	hash := crypto.Keccak256Hash([]byte(str))
	fmt.Println(hash.Hex())
	str = "Young man. in mathematics you don't understand things. You just get used to them."
	hash = crypto.Keccak256Hash([]byte(str))

	fmt.Println(hash.Hex())
}
