-- build flags
-- mode.debug mode.release mode.releasedbg mode.minsizerel 
-- mode.profile mode.coverage mode.valgrind 
add_rules("mode.debug", "mode.release")

-- project information.
set_project("UTemplate")
set_version("0.6.4")
set_license("MIT")

-- set cpp language standard
set_languages("c11", "cxx20")

-- import unittest library catch2 for UTemplate project.
add_requires("conan::catch2/2.13.8", { alias = "catch2" })


add_includedirs("include")
add_headerfiles("include/**.hpp")

target("UTemplate")
    set_kind("phony")
    add_includedirs("include")
    add_headerfiles("include/**.hpp")

target("TStr_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/01_TStr/main.cpp")

target("TypeList_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/02_List/01_TypeList/main.cpp")

target("TemplateList_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/02_List/02_TemplateList/main.cpp")

target("Sort_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/02_List/03_Sort/main.cpp")

target("SI_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/03_SI/main.cpp")


target("TypeID_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/06_TypeID/main.cpp")

target("FuncTraits_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/07_Func/00_FuncTraits/main.cpp")

target("FuncExpand_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/07_Func/01_FuncExpand/main.cpp")

target("Name_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/10_Name/main.cpp")

target("NameTraits_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/11_NameTratis/main.cpp")

target("Type_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/12_Type/main.cpp")

target("StdName_case")
    set_kind("binary")
    add_deps("UTemplate")
    add_files("src/test/13_StdName/main.cpp")

-- task("run_all_tests")
--     on_after_build(function() 

--     )

target("UnitTest_case")
    set_kind("phony")
    add_deps("UTemplate")
    add_deps(
        "TStr_case",
        "TypeList_case",
        "TemplateList_case",
        "Sort_case",
        "SI_case",
        "TypeID_case",
        "FuncTraits_case",
        "FuncExpand_case",
        "Name_case",
        "NameTraits_case",
        "Type_case",
        "StdName_case"
        )