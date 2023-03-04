const std = @import("std");
const testing = std.testing;

pub fn binary_search(haystack: []const i32, needle: i32) bool {
    var lo: usize = 0;
    var hi: usize = haystack.len;

    while (lo < hi) {
        var mid: usize = lo + @divFloor(hi - lo, 2);
        var target: i32 = haystack[mid];

        if (target == needle) {
            return true;
        } else if (target > needle) {
            hi = mid;
        } else {
            lo = mid + 1;
        }
    }

    return false;
}

test "linear search" {
    const foo = [_]i32{1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420};
  
    try testing.expect(binary_search(&foo, 69) == true);
    try testing.expect(binary_search(&foo, 1336) == false); 
    try testing.expect(binary_search(&foo, 69420) == true);   
    try testing.expect(binary_search(&foo, 69421) == false);
    try testing.expect(binary_search(&foo, 1) == true);
    try testing.expect(binary_search(&foo, 0) == false);
}
