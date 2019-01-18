#!/usr/bin/env bash

# This file is part of The RetroArena (TheRA)
#
# The RetroArena (TheRA) is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/Retro-Arena/RetroArena-Setup/master/LICENSE.md
#

rp_module_id="lr-4do"
rp_module_desc="3DO emu - 4DO/libfreedo port for libretro"
rp_module_help="ROM Extension: .iso\n\nCopy your 3do roms to $romdir/3do\n\nCopy the required BIOS file panazf10.bin to $biosdir"
rp_module_licence="LGPL https://raw.githubusercontent.com/libretro/4do-libretro/master/libfreedo/_3do_sys.c"
rp_module_section="lr"

function sources_lr-4do() {
    gitPullOrClone "$md_build" https://github.com/libretro/4do-libretro.git
}

function build_lr-4do() {
    make clean
    make
    md_ret_require="$md_build/4do_libretro.so"
}

function install_lr-4do() {
    md_ret_files=(
        '4do_libretro.so'
    )
}

function install_bin_lr-4do() {
    downloadAndExtract "$__gitbins_url/4do.tar.gz" "$md_inst" 1
}

function configure_lr-4do() {
    mkRomDir "3do"
    ensureSystemretroconfig "3do"

    addEmulator 1 "$md_id" "3do" "$md_inst/4do_libretro.so"
    addSystem "3do"
}
