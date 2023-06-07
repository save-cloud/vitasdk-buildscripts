function(get_host_triplet triplet)
    string(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" host_arch)
    if(host_arch STREQUAL "x86")
        set(host_arch "i686")
    elseif(host_arch STREQUAL "amd64")
        set(host_arch "x86_64")
    elseif(host_arch STREQUAL "arm64")
        set(host_arch "aarch64")
    endif()

    if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
        string(TOLOWER ${CMAKE_SYSTEM_NAME} host_os)
        set(host_release "gnu")
    elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
        set(host_os "w64")
        set(host_release "mingw32")
    elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
        set(host_os "apple")
        set(host_release "darwin")
    elseif(${CMAKE_SYSTEM_NAME} STREQUAL "FreeBSD")
        string(REGEX REPLACE "-.*" "" host_version "${CMAKE_SYSTEM_VERSION}")
        set(host_os "portbld")
        set(host_release "freebsd${host_version}")
    else()
        message(FATAL "Unsupported system: ${CMAKE_SYSTEM_NAME}")
    endif()

    set(${triplet} "${host_arch}-${host_os}-${host_release}" PARENT_SCOPE)
endfunction()

function(get_build_triplet triplet)
    string(TOLOWER "${CMAKE_HOST_SYSTEM_PROCESSOR}" host_arch)
    if(host_arch STREQUAL "x86")
        set(host_arch "i686")
    elseif(host_arch STREQUAL "amd64")
        set(host_arch "x86_64")
    elseif(host_arch STREQUAL "arm64")
        set(host_arch "aarch64")
    endif()

    if(${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Linux")
        string(TOLOWER ${CMAKE_HOST_SYSTEM_NAME} build_os)
        set(build_release "gnu")
    elseif(${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Windows")
        set(build_os "w64")
        set(build_release "mingw32")
    elseif(${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Darwin")
        set(build_os "apple")
        set(build_release "darwin")
    elseif(${CMAKE_HOST_SYSTEM_NAME} STREQUAL "FreeBSD")
        string(REGEX REPLACE "-.*" "" build_version "${CMAKE_HOST_SYSTEM_VERSION}")
        set(build_os "portbld")
        set(build_release "freebsd${build_version}")
    else()
        message(FATAL "Unsupported system: ${CMAKE_HOST_SYSTEM_NAME}")
    endif()

    set(${triplet} "${host_arch}-${build_os}-${build_release}" PARENT_SCOPE)
endfunction()
