project "GLFW"
    kind "StaticLib"
    language "C"

    targetdir ("build/bin/" .. buildDir .. "/%{prj.name}")
    objdir ("build/bin-int/" .. buildDir .. "/%{prj.name}")

    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "on"

        files
        {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

        defines
        {
            "_GLFW_WIN32"
        }

    filter "system:macOS"
        systemversion "latest"
        staticruntime "on"

        files
        {
            "src/cocoa_window.m",
            "src/cocoa_time.c", 
            "src/cocoa_joystick.m",
            "src/cocoa_monitor.m",
            "src/cocoa_init.m",
            "src/nsgl_context.m"
        }

        defines
        {
            "_GLFW_COCOA"
        }

    filter "system:linux"
        systemversion "latest"
        staticruntime "on"

        files
        {
            "src/x11_window.c",
            "src/x11_monitor.c",
            "src/linux_joystick.c",
            "src/x11_init.c",
            "src/xkb_unicode.c",
            "src/glx_context.c"
        }

        defines
        {
            "_GLFW_X11"
        }

    filter { }