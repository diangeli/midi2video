# midi2video
convert midi file to piano video with highlighted keys  

![a piano keyboard with colored keys](example.mid.gif "demo midi2video")

in case you create videos with piano learning/howto this one might be useful for you. Simply record your playing to a midi-file and use this little script to create footage that you can use in your video editor.

# requirements
- python3
- mydy `pip install mydy`
- cairosvg `pip install cairosvg`
- ffmpeg
- fluidsynth + soundfont-fluid *(**optional** when audio should be generated as well)*

# configuration options
create a file named `m2v.local.conf` and override any defaults...  
```ini
[video]
; resolution [pixel]
width = 800
height = 100

frameRate = 25

; fadeIn & fadeOut decreases performance as there are less reusable frames
; fadeIn effect is a slightly darker color at note hit
noteFadeIn = 0
; fadeOut might be useful for very short notes that are difficult to see
noteFadeOut = 0

; add audio requires fluidsynth and a soundfont-file (e.g. soundfont-fluid)
addAudio = 0
soundFont = /usr/share/soundfonts/FluidR3_GM.sf2


[piano]
; use any of the noteNumbers [0-127] as startNote/endNote
; "auto" will use the lowest/highest note of the midi file as first/last key
; black key boundries gets extended to next white key
;-----------------------------------------------------------
;                      note numbers
; octave |  C   C#  D   D#  E   F   F#  G   G#  A   A#  B
;-----------------------------------------------------------
;   -2   |  0   1   2   3   4   5   6   7   8   9   10  11
;   -1   |  12  13  14  15  16  17  18  19  20  21  22  23
;    0   |  24  25  26  27  28  29  30  31  32  33  34  35
;    1   |  36  37  38  39  40  41  42  43  44  45  46  47
;    2   |  48  49  50  51  52  53  54  55  56  57  58  59
;    3   |  60  61  62  63  64  65  66  67  68  69  70  71
;    4   |  72  73  74  75  76  77  78  79  80  81  82  83
;    5   |  84  85  86  87  88  89  90  91  92  93  94  95
;    6   |  96  97  98  99  100 101 102 103 104 105 106 107
;    7   |  108 109 110 111 112 113 114 115 116 117 118 119
;    8   |  120 121 122 123 124 125 126 127
startNote = auto
endNote = auto


colorWhiteKeys = #FFFFFF
colorBlackKeys = #131313
colorHighlight = #DE4439
outlineColorWhiteKeys = #131313
outlineColorBlackKeys = #131313
outlineColorHighlight = #6e160f


; TODO specify bin paths to make this script windows compatible
;[general]
;bin.ffmpeg = ffmpeg
;bin.fluidsynth = fluidsynth
;logLevel = info
```
# usage
`$ ./midi2video.py -i example.mid`  
will create a file `example.mid.mp4`