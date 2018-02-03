#!/bin/bash
# Reference: https://github.com/taeram/zen-wallpaper

# Default font size, this value is later changed according to the image size
# however it will be used for the default black background
DEFAULT_WIDTH=1280
WIDTH=$DEFAULT_WIDTH
array_feh_bg=( feh --bg-fill )
# Make sure to have your fonts installed here
FONT_PATH='/usr/share/fonts/sazanami/sazanami-gothic.ttf'
#FONT_PATH='/usr/share/fonts/TTF/sazanami-mincho.ttf'

echoerr() { echo "$@" 1>&2; }
usage(){
    cat <<EOF
Usage: $0 [-hkjpe] [-b IMAGEPATH][-f] [-F TTFFONT] [-s#][-S#]

-h use the hiragana character set
-k use the katakana character set
-j use the kanji values
-p japanese phrases
-e eng phrases
-g use goterms

-F use the ttf font provided

-b use the provided image as background instead of the default
-f read background image from ~/.fehbg

-S Set font size ratio of main font
-s Set font size ratio of secondary font
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
check_in_path 'xrandr'

MONITOR_WIDTH=$(
    xrandr |
    grep -F '*+' |
    tail -1 |
    awk '{print $1;}' |
    cut -f1 -d'x'
)

# load arrays with flashcards definitions
for i in ./arrays/*; do source $i; done

while getopts ':hkjigpeb:fS:s:F:' opt; do
    case $opt in
        h)
            rand_char=$( printf '%s\n' "${!hiragana[@]}" | shuf -n1)
            rand_desc=${hiragana[$rand_char]}
            ;;
        k)
            rand_char=$( printf '%s\n' "${!katakana[@]}" | shuf -n1)
            rand_desc=${katakana[$rand_char]}
            ;;
        j)
            rand_char=$( printf '%s\n' "${!kanji[@]}" | shuf -n1)
            rand_desc=${kanji[$rand_char]}
            ;;
        g)
            rand_char=$( printf '%s\n' "${!go_terms[@]}" | shuf -n1)
            rand_desc=${go_terms[$rand_char]}
            ;;
        p)
            rand_char=$( printf '%s\n' "${!j_phrases[@]}" | shuf -n1)
            rand_desc=${j_phrases[$rand_char]}
            ;;
        e)
            rand_char=$( printf '%s\n' "${!eng_phrases[@]}" | shuf -n1 )
            rand_desc=${eng_phrases[$rand_char]}
            ;;
        F)
            [[ -f $OPTARG && $OPTARG =~ .*ttf ]] && FONT_PATH=$OPTARG
            ;;
        b)  
            [[ -f $OPTARG ]] && IMAGE_SOURCE=$OPTARG
            ;;
        f)
            [[ -f $HOME/.fehbg ]] && {
                # Take the feh options
                array_feh_bg=( $( tail -n1 "$HOME"/.fehbg ) )
                last_element_index=$((${#array_feh_bg[@]} - 1))
                current_wallpaper="${array_feh_bg[${last_element_index}]}"
                current_wallpaper="${current_wallpaper//\'/}"
                [[ -f $current_wallpaper ]] && {
                    # unset the last element of the feh array
                    unset array_feh_bg[$last_element_index]
                    IMAGE_SOURCE=${current_wallpaper}
                }
            }
            ;;
        s)
            sSIZE=$OPTARG
            ;;
        S)
            SSIZE=$OPTARG
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
    IMAGE_WIDTH=$(
       identify "${IMAGE_SOURCE}" |
       cut -f3 -d' ' |
       cut -f1 -d'x' 
    )
    [[ $IMAGE_WIDTH -ge $MONITOR_WIDTH ]] && WIDTH=$IMAGE_WIDTH || WIDTH=$MONITOR_WIDTH
}

BPOINTSIZE=$((WIDTH/${SSIZE:-15}))
SPOINTSIZE=$((WIDTH/${sSIZE:-60}))

BACKGROUND=${IMAGE_SOURCE:-'-size 1280x800 xc:black'}

echo $BPOINTSIZE
echo $SPOINTSIZE
echo "$FONT_PATH"

convert "${BACKGROUND}" \
    -interline-spacing 5 -interword-spacing 17 -kerning 0 \
    -font "${FONT_PATH}" \
    -pointsize $BPOINTSIZE \
    -draw 'gravity center fill black text 3,3 "'"${rand_char}"'"' \
    -draw 'gravity center fill white text 0,0 "'"${rand_char}"'"' \
    -pointsize $SPOINTSIZE \
    -draw 'gravity center fill black text 2,'$(((BPOINTSIZE/2)+(BPOINTSIZE/3)+2))' "'"${rand_desc}"'"' \
    -draw 'gravity center fill white text 0,'$(((BPOINTSIZE/2)+(BPOINTSIZE/3)))' "'"${rand_desc}"'"' \
    /tmp/wp.flash.png

DISPLAY=:0.0 "${array_feh_bg[@]}" --no-fehbg /tmp/wp.flash.png
