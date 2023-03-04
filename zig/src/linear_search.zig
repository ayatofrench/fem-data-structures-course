const std = @import("std");
const testing = std.testing;

pub fn linear_search(haystack: []const i32, needle: i32) bool {
    for (haystack) |value| {
        if (value == needle) {
            return true;
        }
    }

    return false;
}

test "linear search" {
    const foo = [_]i32{1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420};
  
    try testing.expect(linear_search(&foo, 69) == true);
    try testing.expect(linear_search(&foo, 1336) == false); 
    try testing.expect(linear_search(&foo, 69420) == true);   
    try testing.expect(linear_search(&foo, 69421) == false);
    try testing.expect(linear_search(&foo, 1) == true);
    try testing.expect(linear_search(&foo, 0) == false);
}
