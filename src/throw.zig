const std = @import("std");

threadlocal var ptr: usize = undefined;
pub inline fn fit(err: anyerror, v: anytype) !void {
    const off = comptime std.mem.alignForwardLog2(0x80 + @sizeOf(@TypeOf(v)), 4);
    const lptr: *@TypeOf(v) = @ptrFromInt(@frameAddress() - off);
    lptr.* = v;
    ptr = @intFromPtr(lptr);

    return err;
}

pub inline fn reason(T: type) T {
    return @as(*T, @ptrFromInt(ptr)).*;
}
