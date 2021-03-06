#!/bin/bash

# Reference: http://symbolcodes.tlt.psu.edu/bylanguage/japanesecharthiragana.html
declare -A things
things=(
    [あ]='a'  [い]='i'   [う]='u'  [え]='e'  [お]='o'
    [か]='ka' [き]='ki'  [く]='ku' [け]='ke' [こ]='ko'
    [が]='ga' [ぎ]='gi'  [ぐ]='gu' [げ]='ge' [ご]='go'
    [さ]='sa' [し]='si'  [す]='su' [せ]='se' [そ]='so'
    [ざ]='za' [じ]='zi'  [ず]='zu' [ぜ]='ze' [ぞ]='zo'
    [た]='ta' [ち]='chi' [つ]='tu' [て]='te' [と]='to'
    [だ]='da' [ぢ]='di'  [づ]='du' [で]='de' [ど]='do'
    [な]='na' [に]='ni'  [ぬ]='nu' [ね]='ne' [の]='no'
    [は]='ha' [ひ]='hi'  [ふ]='hu' [へ]='he' [ほ]='ho'
    [ば]='ba' [び]='bi'  [ぶ]='bu' [べ]='be' [ぼ]='bo'
    [ぱ]='pa' [ぴ]='pi'  [ぷ]='pu' [ぺ]='pe' [ぽ]='po'
    [ま]='ma' [み]='mi'  [む]='mu' [め]='me' [も]='mo'
    [や]='ya'            [ゆ]='yu'           [よ]='yo'
    [ら]='ra' [り]='ri'  [る]='ru' [れ]='re' [ろ]='ro'
    [わ]='wa' [ゐ]='wi'           [ゑ]='we' [を]='wo'
    [ん]='n'
    [ゔ]='vu'
)
