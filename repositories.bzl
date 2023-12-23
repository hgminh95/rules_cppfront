load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")


def rules_cppfront_dependencies():
    """An utility method to load all dependencies of `rules_cppfront`.

    Loads the remote repositories used by default in Bazel.
    """
    maybe(
        git_repository,
        name = "cppfront",
        build_file = "//:cppfront.BUILD",
        commit = "210b2a0855de26ba9b02492aa010792b85e6026e",
        remote = "git@github.com:hsutter/cppfront.git"
    )
