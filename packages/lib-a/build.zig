const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib_b_dep = b.dependency("lib_b", .{
        .target = target,
        .optimize = optimize,
    });

    const mod = b.addModule("lib_a", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    mod.addImport("lib_b", lib_b_dep.module("lib_b"));
}
