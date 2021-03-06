solution "libnetpp"
    configurations { "Debug" , "Release" }
    
    project "netpp"
        kind "StaticLib"
        uuid "d7409f46-a711-4f20-8ef5-bc5f28b20be8"
        basedir "."
        files { "net/**.cpp", "net/**.hpp" }
        language "C++"
        includedirs { "." }
        flags { "Symbols" }

        configuration "Debug"
            targetdir "bin/debug"
            defines { "DEBUG" }
            flags { "Symbols" }
 
        configuration "Release"
            targetdir "bin/release"
            defines { "NDEBUG" }
            flags { "Optimize" }         


    project "tests"
        kind "ConsoleApp"
        language "C++"
        uuid "338c5481-613c-4770-8db9-d0e654901ced"
        basedir "."
        files { "test/**.cpp" }
        includedirs { "." }

        configuration "linux"
            buildoptions { "-W", "-Wall", "-Wno-long-long", "-std=c++98", "-pedantic"}
            links { "boost_system", "ssl", "crypto"}

        configuration "windows"
            defines { "WIN32", "BOOST_ALL_NO_LIB", "BOOST_ASIO_ENABLE_CANCELIO", "NOMINMAX", "_CRT_SECURE_NO_WARNINGS", "_SCL_SECURE_NO_WARNINGS", "_WIN32_WINNT=0x500" }
        
        configuration { "Debug", "windows"}
            links { "libboost_system-vc90-mt-gd-1_39", "ssleay32MDd", "libeay32MDd" }
        configuration { "Release", "windows"}
            links { "libboost_system-vc90-mt-1_39", "ssleay32MD", "libeay32MD" }

        configuration "Debug"
            targetdir "bin/debug"
            defines { "DEBUG" }
            flags { "Symbols" }
 
        configuration "Release"
            targetdir "bin/release"
            defines { "NDEBUG" }
            flags { "Optimize" }         


    project "debug_server"
        kind "ConsoleApp"
        language "C++"
	uuid "56BAE705-0C5B-564E-B49B-88AF59F4E968"       
        basedir "."
        files { "debug_server/**.cpp" }
        includedirs { "." }

        configuration "linux"
            buildoptions { "-W", "-Wall", "-Wno-long-long", "-std=c++98", "-pedantic"}
            links { "boost_system", "ssl", "crypto" }

        configuration "windows"
            defines { "WIN32", "BOOST_ALL_NO_LIB", "BOOST_ASIO_ENABLE_CANCELIO", "NOMINMAX", "_CRT_SECURE_NO_WARNINGS", "_SCL_SECURE_NO_WARNINGS", "_WIN32_WINNT=0x500" }
        
        configuration { "Debug", "windows"}
            links { "libboost_system-vc90-mt-gd-1_39", "ssleay32MDd", "libeay32MDd" }
        configuration { "Release", "windows"}
            links { "libboost_system-vc90-mt-1_39", "ssleay32MD", "libeay32MD" }

        configuration "Debug"
            targetdir "bin/debug"
            defines { "DEBUG" }
            flags { "Symbols" }
 
        configuration "Release"
            targetdir "bin/release"
            defines { "NDEBUG" }
            flags { "Optimize" }         



