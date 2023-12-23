cc_library(
    name = "cpp2util",
    hdrs = [
        "include/cpp2util.h",
    ],
    includes = ["include"],
    visibility = [
        "//visibility:public",
    ],
)

cc_library(
    name = "build_info",
    textual_hdrs = [
        "source/build.info"
    ],
)

cc_binary(
    name = "cppfront",
    srcs = glob([
        "source/*.h",
        "source/*.cpp",
    ]),
    visibility = [
        "//visibility:public",
    ],
    deps = [
        ":cpp2util",
        ":build_info",
    ],
    copts = [
        "-std=c++2a",
    ],
)
