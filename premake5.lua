include "dependencies/conandeps.premake5.lua"

workspace "ConanTutorial"
   configurations { "Debug", "Release" }
   architecture "x64"

    project "HelloWorld"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"

    targetdir   "build/%{cfg.buildcfg}/bin"
    objdir      "build/%{cfg.buildcfg}/obj"

    location "./src"
    files { "%{prj.location}/**.h", "%{prj.location}/**.cpp" }

    filter "toolset:msc*" --Apply settings for microsoft compilers
       buildoptions {"/utf-8"} --include utf-8 support

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
    filter{}

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
    filter{}

    -- conan_setup("release_x86_64") -- Release
    conan_setup() -- Debug

    -- linkoptions{"/IGNORE:4099"} -- mute linker warning