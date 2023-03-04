package binary_search

import "math"

func BinarySearch(haystack []int, needle int) bool {
  var lo int;
  var hi int = len(haystack);

  for ok := true; ok; ok = lo < hi {
    mid := int(math.Floor(float64(lo + (hi - lo) / 2))) 
    
    target := haystack[mid] 

    if target == needle {
      return true;
    } else if target > needle {
      hi = mid;
    } else {
      lo = mid + 1;
    }
  }

  return false;
}
