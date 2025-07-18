PUBLIC_HEADERS  = "include/**.h"
IMPLEMENTATION  = "src/**.cpp"

workspace "pagerank"
    configurations { "Debug", "Release" }
    platforms { "Win32", "Win64" }

project "pagerank"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    targetdir "build/%{cfg.buildcfg}"

    files {
        "include/**.h",
        "src/**.cpp",
        "src/**.h"
    }

    vpaths {
        ["Public Headers"] = { PUBLIC_HEADERS },
        ["Source Files"]   = { IMPLEMENTATION }
    }

    includedirs {
        "include",
        "dependencies/graphski/include",               
        "dependencies/SFML-3.0.0/include",
        "dependencies/nlohmann"
    }

    libdirs {
        "dependencies/graphski",                       -- For graphski.lib
        "dependencies/SFML-3.0.0/lib"
    }

    links {
        "freetyped.lib",
        "opengl32.lib",
        "gdi32.lib",
        "winmm.lib"
    }

    defines { "SFML_STATIC" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "On"
        links {
            "graphski-d.lib",
            "sfml-system-s-d.lib",
            "sfml-graphics-s-d.lib",
            "sfml-window-s-d.lib",
        }

    filter "configurations:Release"
        runtime "Release"
        symbols "Off"
        optimize "On"
        links {
            "graphski.lib",
            "sfml-system-s.lib",
            "sfml-graphics-s.lib",
            "sfml-window-s.lib",
        }
