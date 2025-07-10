# Testing in Go

```go
package lgwt

/**
Tests must be in a file named <foo>_test.go
ie mycode_test.go
**/

/* Testing is built in to the standard library and can be imported
as follows.
*/
import (
	"strings"
	"testing"
)

/**
Tests are functions that follow the naming convention
Test<Foo> and accept a pointer to a testing.T
**/
func TestMyTest(t *testing.T) {
	/** At the moment I have only covered basic tests but there
	  are property based tests that I will cover later.
    
    Tests are just go code, no weird framework specific knowledge
    required unlike with jest etc
	**/
    
	want := "*****"
	got := strings.Repeat("*",5)
    
    if got != want {
        t.Errorf("got %s want %s",got, want)
    }
}
```

# Docs as Code

```go
package supertests

import (
	"fmt"
	"strings"
)

/**
    You can document your code using examples, documentation as code is cool!
    The Examples will run along side your tests, and if they do not 'pass'
    (ie, the documentation gets out of sync) your tests will fail.

    examples are functions that follow the naming convention of Example<Foo>() { .. }
    Examples always need an 'Output', if the output does not match the example fails.

**/

func ExampleTest() {
	got := strings.Repeat("*", 5)
	fmt.Println(got)
    
    // Output: *****
}
```

Examples can then be used with godoc or pkgsite to generate documentation.
```shell
# godoc
go install golang.org/x/tools/cmd/godoc@latest
# pkgsite
go install golang.org/x/pkgsite/cmd/pkgsite@latest
```
# Benchmarks
TODO: Learn more!

Benchmarking is also built into go.

```go
package example

import (
	"strings"
	"testing"
)

/**
Benchmarking can be done alongside tests.
benchmark functions follow the naming convention of Benchmark<Foo>

Note how benchmark functions accept a pointer to testing.B, not T.
**/

func BenchmarkFoo(b *testing.B) {
	for b.Loop() {
		strings.Repeat("*", 5)
	}
}
```

benchmarks are not run by default. To run benchmarks, pass the -bench=. flag to go test
NOTE: the -bench flag accepts a REGEX and not a file path

# Test Coverage
Go has test coverage built in, just run
```shell
go test -cover
```