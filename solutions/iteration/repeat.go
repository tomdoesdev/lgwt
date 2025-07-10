package iteration

import "strings"

func RepeatStr(str string, count int) string {
	var repeated strings.Builder

	for i := 0; i < count; i++ {
		repeated.WriteString(str)
	}

	return repeated.String()
}
