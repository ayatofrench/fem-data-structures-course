const std = @import("std");
const RndGen = std.rand.DefaultPrng;
const testing = std.testing;

pub fn two_crystal_balls(breaks: []const bool) isize {
    const jmpAmount = @floatToInt(usize, @floor(@sqrt(@intToFloat(f32, breaks.len))));


    var i = jmpAmount;

    while(i < breaks.len): (i += jmpAmount) {
        if (breaks[i]) {
            break;
        }
    }

    i -= jmpAmount;

    var j: usize = 0;

    while(j < jmpAmount and i < breaks.len): ({j += 1; i += 1;}) {
        if(breaks[i]) {
            return @intCast(isize, i);
        }
    }
    
    return -1;
}

test "two crystal balls" {
    var rnd = RndGen.init(0);
    var idx = @floatToInt(usize, @floor(rnd.random().float(f32) * 10000.0));
    var data = [_]bool{false} ** 10000;
    
    var i = idx;

    while(i < 10000): (i += 1) {
        data[i] = true;
    }

    try testing.expect(two_crystal_balls(&data) == idx);
    try testing.expect(two_crystal_balls(&[_]bool{false} ** 821) == -1); 
}
