# Throw a fit

A zig library to add some metadata to an error. 


## Install
>[!warning]
>This is a joke of a library, use it at your own risk!

```sh
zig fetch --save  git+https://github.com/sbancuz/throw
```

```zig
// build.zig
const throw = b.dependency("throw", .{
	.target = target,
	.optimize = optimize,
});
exe.root_module.addImport("throw", throw.module("throw"));
```

## Example

```zig
const throw = @import("throw");
const std = @import("std");

const metadata = struct {
	bar: usize = 20,
};

fn foo() !void {
	try throw.fit(error.Sad, metadata{ .bar = 24 });
}

pub fn main() void {
	foo() catch {
		const r = throw.reason(metadata);
		std.debug.print("ERROR! {}\n", .{r});
		// >> ERROR! 24\n
	};
}

```
