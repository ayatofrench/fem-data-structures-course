package binary_search

import (
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestBinarySearch(t *testing.T) {
  foo := []int{1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420}
  
  assert.Equal(t, BinarySearch(foo, 69), true)
  assert.Equal(t, BinarySearch(foo, 1336), false)
  assert.Equal(t, BinarySearch(foo, 69420), true);
  assert.Equal(t, BinarySearch(foo, 69421), false);
  assert.Equal(t, BinarySearch(foo, 1), true);
  assert.Equal(t, BinarySearch(foo, 0), false);
}
