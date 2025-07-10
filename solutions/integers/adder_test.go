package integers

import (
	"fmt"
	"testing"
)

func TestAdder(t *testing.T) {
	sum := Sum(2, 2)
	expected := 4

	if sum != expected {
		t.Errorf("expected '%d' but got '%d'", expected, sum)
	}
}

func ExampleSum() {
	sum := Sum(1, 1)
	fmt.Println(sum)
	//Output: 2
}
