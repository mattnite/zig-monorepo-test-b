const lib_b = @import("lib_b");

pub fn hello() []const u8 {
    return "Hello from lib-a, using: " ++ lib_b.greet();
}
