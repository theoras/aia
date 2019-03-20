#!/bin/bash

contains_element() { #{{{
    #check if an element exist in a string
    for e in "${@:2}"; do [[ $e == $1 ]] && break; done;
  } #}}}

  invalid_option() { #{{{
    print_line
    echo "Invalid option. Try another one."
    pause_function
  } #}}}

#SELECT KEYMAP {{{
select_keymap(){
  print_title "KEYMAP - https://wiki.archlinux.org/index.php/KEYMAP"
  keymap_list=("ANSI-dvorak" "amiga-de" "amiga-us" "applkey" "atari-de" "atari-se" "atari-uk-falcon" "atari-us" "azerty" "backspace" "bashkir" "be-latin1" "bg-cp1251" "bg-cp855" "bg_bds-cp1251" "bg_bds-utf8" "bg_pho-cp1251" "bg_pho-utf8" "br-abnt" "br-abnt2" "br-latin1-abnt2" "br-latin1-us" "by" "by-cp1251" "bywin-cp1251" "cf" "colemak" "croat" "ctrl" "cz" "cz-cp1250" "cz-lat2" "cz-lat2-prog" "cz-qwertz" "cz-us-qwertz" "de" "de-latin1" "de-latin1-nodeadkeys" "de-mobii" "de_CH-latin1" "de_alt_UTF-8" "defkeymap" "defkeymap_V1.0" "dk" "dk-latin1" "dvorak" "dvorak-ca-fr" "dvorak-es" "dvorak-fr" "dvorak-l" "dvorak-la" "dvorak-programmer" "dvorak-r" "dvorak-ru" "dvorak-sv-a1" "dvorak-sv-a5" "dvorak-uk" "emacs" "emacs2" "es" "es-cp850" "es-olpc" "et" "et-nodeadkeys" "euro" "7.46kr" "14.92kr" "fi" "fr" "fr-bepo" "fr-bepo-latin9" "fr-latin1" "fr-latin9" "fr-pc" "fr_CH" "fr_CH-latin1" "gr" "gr-pc" "hu" "hu101" "il" "il-heb" "il-phonetic" "is-latin1" "is-latin1-us" "it" "it-ibm" "it2" "jp106" "kazakh" "keypad" "ky_alt_sh-UTF-8" "kyrgyz" "la-latin1" "lt" "lt.baltic" "lt.l4" "lv" "lv-tilde" "mac-be" "mac-de-latin1" "mac-de-latin1-nodeadkeys" "mac-de_CH" "mac-dk-latin1" "mac-dvorak" "mac-es" "mac-euro" "mac-14.92kr" "mac-fi-latin1" "mac-fr" "mac-fr_CH-latin1" "mac-it" "mac-pl" "mac-pt-latin1" "mac-se" "mac-template" "mac-uk" "mac-us" "mk" "mk-cp1251" "mk-utf" "mk0" "nl" "nl2" "no" "no-dvorak" "no-latin1" "pc110" "pl" "pl1" "pl2" "pl3" "pl4" "pt-latin1" "pt-latin9" "pt-olpc" "ro" "ro_std" "ro_win" "ru" "ru-cp1251" "ru-ms" "ru-yawerty" "ru1" "ru2" "ru3" "ru4" "ru_win" "ruwin_alt-CP1251" "ruwin_alt-KOI8-R" "ruwin_alt-UTF-8" "ruwin_alt_sh-UTF-8" "ruwin_cplk-CP1251" "ruwin_cplk-KOI8-R" "ruwin_cplk-UTF-8" "ruwin_ct_sh-CP1251" "ruwin_ct_sh-KOI8-R" "ruwin_ct_sh-UTF-8" "ruwin_ctrl-CP1251" "ruwin_ctrl-KOI8-R" "ruwin_ctrl-UTF-8" "se-fi-ir209" "se-fi-lat6" "se-ir209" "se-lat6" "sg" "sg-latin1" "sg-latin1-lk450" "sk-prog-qwerty" "sk-prog-qwertz" "sk-qwerty" "sk-qwertz" "slovene" "sr-cy" "sun-pl" "sun-pl-altgraph" "sundvorak" "sunkeymap" "sunt4-es" "sunt4-fi-latin1" "sunt4-no-latin1" "sunt5-cz-us" "sunt5-de-latin1" "sunt5-es" "sunt5-fi-latin1" "sunt5-fr-latin1" "sunt5-ru" "sunt5-uk" "sunt5-us-cz" "sunt6-uk" "sv-latin1" "tj_alt-UTF8" "tr_f-latin5" "tr_q-latin5" "tralt" "trf" "trf-fgGIod" "trq" "ttwin_alt-UTF-8" "ttwin_cplk-UTF-8" "ttwin_ct_sh-UTF-8" "ttwin_ctrl-UTF-8" "ua" "ua-cp1251" "ua-utf" "ua-utf-ws" "ua-ws" "uk" "unicode" "us" "us-acentos" "wangbe" "wangbe2" "windowkeys");
  PS3="$prompt1"
  print_info "The KEYMAP variable is specified in the /etc/rc.conf file. It defines what keymap the keyboard is in the virtual consoles. Keytable files are provided by the kbd package."
  echo "keymap list in /usr/share/kbd/keymaps"
    select KEYMAP in "${keymap_list[@]}"; do
        if contains_element "$KEYMAP" "${keymap_list[@]}"; then
            loadkeys "$KEYMAP";
            break
        else
            invalid_option
        fi
    done
}

select_keymap
