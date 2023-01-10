package input
import (
	"fmt"
	"flag"
)

// Reference https://www.digitalocean.com/community/tutorials/how-to-use-the-flag-package-in-go
func input(key, plaintext) {
	inputKey := flag.String("key", key, "16 or 32-byte AES input Key" )
	inputPlainText := flag.String("plaintext", plaintext, "Plaintext Message to Encrypt/Decrypt")
	flag.Parse()
	fmt.Println()
}