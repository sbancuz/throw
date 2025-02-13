# Throw a fit

A zig library to add some metadata to an error. 

>[!warning]
>This is a joke of a library, use it at your own risk!
>Available only on x86_64

```zig
const throw = @import("throw");
const std = @import("std");

const metadata = struct {
	bar: usize = 20,
};

fn foo() !void {
	try throw.fit(error.Sad, metadata{});
}

pub fn main() void {
	foo() catch {
		const r = reason(metadata);
		std.debug.print("ERROR! {}\n", .{r});
	};
}

```
