package greetings
import (
	"fmt"
	"errors"
)

func Hello(name string) (string,error) {
	if name == ""{
		reutrn "",errors.New("empty name")
	}

	message := fmt.Sprintf("Hi, %v. Welcome!",name)
	return message


}
