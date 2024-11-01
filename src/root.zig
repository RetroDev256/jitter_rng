const std = @import("std");

pub const random = std.Random.init(@as(*@This(), undefined), fill);

fn fill(_: *const @This(), buf: []u8) void {
    for (buf) |*byte| byte.* = jitter();
}

/// Returns credible randomness based on CPU jitter entropy
pub fn jitter() u8 {
    // Expect 1/16 bits of entropy per sample, to give us some overhead
    const samples_per_bit = 16;

    var state: u32 = 0;
    for (0..samples_per_bit * 8) |_| {
        const sample: i128 = std.time.nanoTimestamp();
        const time_raw: u128 = @bitCast(sample);
        state ^= @as(u32, @truncate(time_raw));
        state = std.hash.uint32(state);
    }

    return @truncate(state);
}
