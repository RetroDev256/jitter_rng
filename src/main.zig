const std = @import("std");
const root = @import("root.zig");

pub fn main() noreturn {
    const writer = std.io.getStdOut().writer();
    var buffer: [std.mem.page_size]u8 = undefined;

    while (true) {
        root.random.bytes(&buffer);
        writer.writeAll(&buffer) catch unreachable;
    }
}
