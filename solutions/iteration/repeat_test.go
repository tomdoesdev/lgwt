package iteration

import (
	"fmt"
	"strings"
	"testing"
)

func TestRepeatStr(t *testing.T) {
	str := "*"
	got := RepeatStr(str, 5)
	want := strings.Repeat(str, 5)

	if got != want {
		t.Errorf("got %s want %s", got, want)
	}
}

func BenchmarkRepeatStr(b *testing.B) {
	for b.Loop() {
		RepeatStr("*", 5)
	}
}
func ExampleRepeatStr() {
	result := RepeatStr("*", 5)
	fmt.Println(result)
	// Output: *****
}
