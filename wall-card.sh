#!/bin/bash
# Reference: https://github.com/taeram/zen-wallpaper

# Default font size, this value is later changed according to the image size
# however it will be used for the default black background
BPOINTSIZE=400
SPOINTSIZE=40

# Make sure to have your fonts installed here
FONT_PATH='/usr/share/fonts/TTF/sazanami-gothic.ttf'
FONT_PATH='/usr/share/fonts/TTF/sazanami-mincho.ttf'

echoerr() { echo "$@" 1>&2; }
usage(){
    cat <<EOF
Usage: $0 [-hkj] [-b]
-h use the hiragana character set
-k use the katakana character set
-j use the kanji values
-b use the provided image as background instead of the default
EOF
}

# EXIT if not argument was given
[[ $# -eq 0 ]] && { echoerr 'Error: argument missing.'; usage; exit 1; }

check_in_path(){
    local cmd=$1
    hash "$cmd" &>/dev/null || {
        echoerr "uError: command \"$cmd\" not found in \$PATH, please add it or install it..."
        exit 1
    }
}

# checking dependencies
check_in_path 'feh'
check_in_path 'convert'
check_in_path 'identify'

# load arrays with flashcards definitions
for i in ./arrays/*; do source $i; done

while getopts ':hkjigb:f' opt; do
    case $opt in
        h)
            rand_char=$(echo ${!hiragana[@]} | tr ' ' '\n' | shuf -n1)
            rand_desc=${hiragana[$rand_char]}
            ;;
        k)
            rand_char=$(echo ${!katakana[@]} | tr ' ' '\n' | shuf -n1)
            rand_desc=${katakana[$rand_char]}
            ;;
        j)
            rand_char=$(echo ${!kanji[@]} | tr ' ' '\n' | shuf -n1)
            rand_desc=${kanji[$rand_char]}
            ;;
        g)
            rand_char=$(echo ${!go_terms[@]} | tr ' ' '\n' | shuf -n1)
            rand_desc=${go_terms[$rand_char]}
            ;;
        b)  
            [[ -f $OPTARG ]] && {
                IMAGE_SOURCE=$OPTARG
            }
            ;;
        f)
            [[ -f $HOME/.fehbg ]] && {
                current_wallpaper=$(cat $HOME/.fehbg | cut -f2 -d"'")
                [[ -f $current_wallpaper ]] && {
                    IMAGE_SOURCE="${current_wallpaper}"
                }
            }
            ;;
        \?)
            echoerr 'Error: Not implemented!'
            usage
            exit 1
            ;;
        :)
            echoerr 'Error: -'"${OPTARG}"' needs an argument.'
            usage
            exit 1
            ;;
    esac
done

# check if some of the mandatory options was used (flashcard)
[[ -z $rand_char || -z $rand_desc ]] && {
    usage
    exit 1
}

# if any image was provided calculate the font size from there
[[ ! -z $IMAGE_SOURCE ]] && {
    WIDTH=$(identify $IMAGE_SOURCE | cut -f3 -d ' ' | cut -f2 -d'x')
    BPOINTSIZE=$((WIDTH/7))  # some arbitrary value
    SPOINTSIZE=$((WIDTH/35)) # some arbitrary value
}

BACKGROUND=${IMAGE_SOURCE:-'-size 1280x800 xc:black'}

echo $BPOINTSIZE
echo $SPOINTSIZE

convert ${BACKGROUND} \
    -interline-spacing 5 -interword-spacing 17 -kerning 0 \
    -font $FONT_PATH \
    -pointsize $BPOINTSIZE \
    -draw 'gravity center fill black text 3,3 "'$rand_char'"' \
    -draw 'gravity center fill white text 0,0 "'$rand_char'"' \
    -pointsize $SPOINTSIZE \
    -draw 'gravity center fill black text 2,'$(((BPOINTSIZE/2)+(BPOINTSIZE/3)+2))' "'"${rand_desc}"'"' \
    -draw 'gravity center fill white text 0,'$(((BPOINTSIZE/2)+(BPOINTSIZE/3)))' "'"${rand_desc}"'"' \
    /tmp/wp.flash.png

DISPLAY=:0.0 feh --no-fehbg --bg-fill /tmp/wp.flash.png
