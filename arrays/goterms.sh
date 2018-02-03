#!/bin/bash
declare -A things
things=(
    ['Aji']='A weakness that is left behind in the opponent s position.
Has been translated as flavor,  aftertaste,  and \"funny business\".
Typically it can be exploited in more than one way.'
    ['Atari']='A move that reduces a stone or chain of stones to one liberty.
The stones with one liberty are said to be \"in atari\".
Stones in atari can be captured on the opponents next turn unless they are defended.'
    ['Capturing race']='A race to fill in the liberties of two groups,
neither of which can live independently.
Also called semeai.'
    ['Chain']='A group of stones that are directly adjacent along the lines of the board.
The stones in a chain share liberties and live or die as a unit.
Also string.'
    ['Connection']='A play that joins two stones or chains into a single chain by connecting them along the lines of the board.
or that makes it possible for them to be so joined even if the opponent were to play first.
or that makes it unprofitable for the opponent to actively separate them.'
    ['Cut']='A move which separates two or more of a player s stones by occupying a point adjacent to them.'
    ['Dame']='1) Any empty point adjacent to a stone.
 2) a neutral point between established Black and White positions which does not count as territory for either player.'
    ['Damezumari']='Inability to play at a tactically desirable point due to lack of liberties.'
    ['Death']='A group is dead when its owner cannot, playing first with correct play,
make it live with two eyes or in seki or make a ko for life,
given accurate play by the opponent.'
    ['Dragon']='A dragon is a long connected shape spanning large areas of the board.'
    ['Endgame']='The final stage of the game.'
    ['Eye']='An empty space surrounded by one player s stones such that none of them can be brought into atari separately.'
    ['False Eye']='An empty space surrounded by one player s units such that at least one of them can be brought into atari separately.'
    ['Fuseki']='A Japanese go term meaning arraying forces for battle.
it refers to the initial phase of the game,
especially before there are any weak groups.'
    ['Geta']='See Net.'
    ['Gote']='1) A move or sequence of moves that does not have to be answered.
2) a move or sequence of moves that is not answered.'
    ['Group']='One or more stones considered as a unit.'
    ['Hane']='A single stone that \"reaches around\" the outside of an opposing unit diagonally,
adjacent but unconnected to an existing unit.'
    ['Handicap']='Stones that Black (the weaker player) places on the board before White s first move to ensure a more balanced contest.'
    ['Honte']='A solid move.'
    ['Influence']='The effect stones exert at a distance.'
    ['Invasion']='Play made inside an enemy framework with the intention of living or escaping.'
    ['Joseki']='Established sequences of play considered equitable for both players,
especially early moves near a corner.'
    ['Kikashi']='A Japanese go term adopted into English (forcing move) for a sente move that produces a certain effect and can then be abandoned without regret.'
    ['Killing']='Ensuring that a group will ultimately perish and be removed from the board.'
    ['Ko']='A position in which single stones could be captured back and
forth indefinitely were there not a rule forbidding such repetition.'
    ['Ko Threat']='A threatening move played either to provoke an immediate response from the opponent,
allowing the player to recapture the ko on his next move,
or to make a gain if the opponent ignores it.'
    ['Komi']='Points added to a player s score,
normally given to White in compensation for Black s advantage in playing first.'
    ['Ladder']='A technique for capturing stones where at each step,
the attacker reduces the defender s liberties from two to one: especially an attack of this type that proceeds diagonally across the board.'
    ['Liberty']='1) A dame.
2) a move required to capture a stone or group.'
    ['Life']='State where a group has two eyes,
lives in seki or is secure enough to survive any attack.'
    ['Miai']='Two moves that have equivalent effects,
such that if either player plays one,
his opponent will play the other.'
    ['Moyo']='A territorial framework,
an extensive area loosely bounded by one player s stones,
where the other has yet to establish any defensible positions,
and which consequently could become the former s territory.'
    ['Net']='A technique that ensures the capture of one or more stones by blocking their access to open board areas.'
    ['Omoyo']='A large scale Moyo (territorial framework).'
    ['Peep']='A threat to cut (nozoki in Japanese) played directly or diagonally adjacent to a cutting point.'
    ['Point']='The intersection of two lines on the go board.'
    ['Ponnuki']='Capture of a single stone above the first line by four opposing stones,
leaving a diamond shape.'
    ['Sabaki']='Development of a flexible and defensible position in an area of opposing forces,
especially by means of contact plays and sacrifice tactics.'
    ['Sansan']='3-3 point on the goban.'
    ['Seki']='A Japanese go term adopted into English,  meaning 
an impasse in which stones are alive without two eyes 
because the opponent cannot or should not capture them.
Also known as mutual life.'
    ['Semeai']='A Capturing Race.'
    ['Semedori']='A situation in which dead stones must eventually be captured.'
    ['Sente']='1) The initiative.
2) a play that must be answered.
3) a play that is answered.'
    ['Shape']='relative positions of stones of one color in close proximity.'
    ['Shicho']='A Ladder.'
    ['Tengen']='The center point of the goban.'
    ['Tenuki']='A Japanese go term adopted into English that denotes playing elsewhere,
especially breaking off from a sequence that remains to be resolved.'
    ['Territory']='1) A region of the board that belongs to one player because it is surrounded 
by stones belonging to a living group,
and in which the opponent cannot make a living group.
2) a region which almost belongs to one player.'
    ['Tesuji']='An astute,  often counter-intuitive tactical play that 
optimally exploits a defect in the opposing shapes.'
    ['Tsumego']='A life and death problem.'
    ['Vital Point']='A key point (for either player) in the local,
or perhaps less commonly global,
context that will normally either establish a good shape or force the opponent into bad shape.'
    ['Yose']='A Japanese go term adopted into English,
meaning moves that approach fairly stable territory,
typically enlarging one s own territory while reducing the opponent s.'
)
