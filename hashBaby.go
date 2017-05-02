package main

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
)

//start main OMIT

func GetMD5Hash(text string) {
	hasher := md5.New()
	hasher.Write([]byte(text))
	fmt.Println(hex.EncodeToString(hasher.Sum(nil)))
}

func main() {
	GetMD5Hash("Young man, in mathematics you don't understand things. You just get used to them.")
	GetMD5Hash("Young man. in mathematics you don't understand things. You just get used to them.")
}

//end main OMIT
