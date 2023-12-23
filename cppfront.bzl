load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def _cppfront_gen_impl(ctx):
    output_file = ctx.actions.declare_file("{}.cpp".format(ctx.attr.name))

    args = ctx.actions.args()
    args.add(ctx.file.src)
    args.add("-o", "{}/{}.cpp".format(output_file.dirname, ctx.attr.name))
    args.add_all(ctx.attr.args)

    ctx.actions.run(
        inputs = [ctx.file.src],
        outputs = [output_file],
        executable = ctx.executable._generator,
        tools = [ctx.executable._generator],
        arguments = [args],
    )

    return [
        DefaultInfo(files = depset([output_file])),
    ]


cppfront_gen = rule(
    implementation = _cppfront_gen_impl,
    output_to_genfiles = True,
    attrs = {
        "src": attr.label(allow_single_file=True, mandatory=True),
        "args": attr.string_list(),
        "_generator": attr.label(
            executable=True,
            cfg="host",
            default="@cppfront//:cppfront",
        ),
    },
)
