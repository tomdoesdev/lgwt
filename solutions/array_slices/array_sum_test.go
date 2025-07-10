package array_slices

import (
	"slices"
	"testing"
)

func TestSumArray(t *testing.T) {
	t.Run("sum 5 numbers", func(t *testing.T) {
		/**
		nums := [5]int{} is an array.
		nums := []int{} is a slice
		*/
		nums := []int{1, 1, 1, 1, 1}

		got := SumArray(nums)
		want := 5

		if got != want {
			t.Errorf("got %d, want %d", got, want)
		}
	})
}

func TestSumAll(t *testing.T) {
	t.Run("sums one slice", func(t *testing.T) {

		want := []int{2}
		got := SumAll([]int{1, 1})

		if !slices.Equal(got, want) {
			t.Errorf("got %v, want %v", got, want)
		}
	})

	t.Run("sums one slice containing 1 number", func(t *testing.T) {

		want := []int{1}
		got := SumAll([]int{1})

		if !slices.Equal(got, want) {
			t.Errorf("got %v, want %v", got, want)
		}
	})

	t.Run("sums multiple slices", func(t *testing.T) {

		want := []int{3, 3}
		got := SumAll([]int{1, 2}, []int{0, 1, 2})

		if !slices.Equal(got, want) {
			t.Errorf("got %v, want %v", got, want)
		}
	})
}
