#!/bin/bash

# Reference: http://symbolcodes.tlt.psu.edu/bylanguage/japanesechartkatakana.html
declare -A things
things=(
    [ア]='a'  [イ]='i'  [ウ]='u'  [エ]='e'  [オ]='o'
    [カ]='ka' [キ]='ki' [ク]='ku' [ケ]='ke' [コ]='ko'
    [ガ]='ga' [ギ]='gi' [グ]='gu' [ゲ]='ge' [ゴ]='go'
    [サ]='sa' [シ]='si' [ス]='su' [セ]='se' [ソ]='so'
    [ザ]='za' [ジ]='zi' [ズ]='zu' [ゼ]='ze' [ゾ]='zo'
    [タ]='ta' [チ]='ti' [ツ]='tu' [テ]='te' [ト]='to'
    [ダ]='da' [ヂ]='di' [ヅ]='du' [デ]='de' [ド]='do'
    [ナ]='na' [ニ]='ni' [ヌ]='nu' [ネ]='ne' [ノ]='no'
    [ハ]='ha' [ヒ]='hi' [フ]='hu' [ヘ]='he' [ホ]='ho'
    [バ]='ba' [ビ]='bi' [ブ]='bu' [ベ]='be' [ボ]='bo'
    [パ]='pa' [ピ]='pi' [プ]='pu' [ペ]='pe' [ポ]='po'
    [マ]='ma' [ミ]='mi' [ム]='mu' [メ]='me' [モ]='mo'
    [ヤ]='ya'           [ユ]='yu'           [ヨ]='yo'
    [ラ]='ra' [リ]='ri' [ル]='ru' [レ]='re' [ロ]='ro'
    [ワ]='wa' [ヰ]='wi'           [ヱ]='we' [ヲ]='wo'
    [ン]='n     '
    [ヴ]='vu' [ヷ]='va' [ヸ]='vi' [ヹ]='ve' [ヺ]='vo'
)
