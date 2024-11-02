const std = @import("std");

pub const random = std.Random.init(@as(*@This(), undefined), fill);

fn fill(_: *const @This(), buf: []u8) void {
    for (buf) |*byte| byte.* = jitter();
}

/// Returns credible randomness based on CPU jitter entropy
pub fn jitter() u8 {
    // Expect 1/12 bits of entropy per sample, to give us some overhead
    const samples_per_bit = 12;

    const initial = std.time.Instant.now() catch return 0;

    var state: u32 = 0;
    for (0..samples_per_bit * 8) |_| {
        const sample = std.time.Instant.now() catch return 0;
        const duration = sample.since(initial);
        state ^= @as(u32, @truncate(duration));
        state = std.hash.uint32(state);
    }

    return @truncate(state);
}
