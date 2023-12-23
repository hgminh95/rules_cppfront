# rules_cppfront

Bazel rules for [cppfront](https://github.com/hsutter/cppfront).

## Getting Started

Add below code snippet into your WORKSPACE file

```
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "rules_cppfront",
    commit = "<this repos commit>",
    remote = "git@github.com:hgminh95/cppfront.git"
)

load("@rules_cppfront//:repositories.bzl", "rules_cppfront_dependencies")
rules_cppfront_dependencies()
```

To add a rule to compile cpp2 to cpp file

```
load("@rules_cppfront//:cppfront.bzl", "cppfront_gen")

cppfront_gen(
    name = "test_cpp2",
    src = "test.cpp2",
)

# And then use it to generate cc_binary rule
cc_binary(
    name = "test",
    srcs = [
        ":test_cpp2",
    ],
    deps = [
        "@cppfront//:cpp2util",
    ],
)
```

## References

```
cppfront_gen
```
