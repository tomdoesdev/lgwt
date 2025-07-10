package structs_methods_interfaces

import "math"

type Shape interface {
	Area() float64
}

type Circle struct {
	Radius float64
}

func (c *Circle) Area() float64 {
	return math.Pi * math.Pow(c.Radius, 2)
}

type Rectangle struct {
	Width  float64
	Length float64
}

func (r *Rectangle) Perimeter() float64 {
	return 2 * (r.Width + r.Length)
}

func (r *Rectangle) Area() float64 {
	return r.Width * r.Length
}

type Triangle struct {
	Base   float64
	Height float64
}

func (t *Triangle) Area() float64 {
	return (t.Base * t.Height) * 0.5
}
