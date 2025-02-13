const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const dep_opts = .{ .target = target, .optimize = optimize };
    _ = dep_opts;

    _ = b.addModule("throw", .{
        .source_file = .{ .path = "src/throw.zig" },
        .dependencies = &.{},
    });
}
