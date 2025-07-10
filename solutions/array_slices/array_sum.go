package array_slices

func SumArray(numbers []int) int {
	var sum int

	for _, num := range numbers {
		sum += num
	}

	return sum
}

func SumAll(values ...[]int) []int {
	sums := make([]int, len(values))

	for i, v := range values {
		sums[i] = SumArray(v)
	}

	return sums
}
