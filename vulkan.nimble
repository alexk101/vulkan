# Package

version     = "1.2.1"
author      = "Leonardo Mariscal"
description = "Vulkan bindings for Nim"
license     = "MIT"
srcDir      = "src"
skipDirs    = @["tests"]

# Dependencies

requires "nim >= 1.0.0"

task gen, "Generate bindings from source":
  exec("nim c -d:ssl -d:release -r tools/generator.nim")

task test, "Create basic triangle with Vulkan and GLFW":
  # Please https://github.com/nim-lang/nimble/issues/482
  requires "https://github.com/nimgl/glfw"
  exec("nim c -r tests/test.nim")
