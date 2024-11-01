const std = @import("std");
const root = @import("root.zig");

pub fn main() !void {
    const threads = try std.Thread.getCpuCount();
    for (0..threads - 1) |_| {
        _ = try std.Thread.spawn(.{}, perThread, .{});
    }
    perThread();
}

fn perThread() noreturn {
    const writer = std.io.getStdOut().writer();
    var buffer: [std.mem.page_size]u8 = undefined;

    while (true) {
        root.random.bytes(&buffer);
        writer.writeAll(&buffer) catch unreachable;
    }
}
