<?php
function manaReplace($input)
{
    // => in an array replaces the left side with the right so {0} with the img src for 0.webp
    $manaPath = array(
        '{0}' => '<img class="manaIcon" alt="0" src="assets/images/0.webp">',
        '{1}' => '<img class="manaIcon" alt="1" src="assets/images/1.webp" >',
        '{2}' => '<img class="manaIcon" alt="2" src="assets/images/2.webp" >',
        '{3}' => '<img class="manaIcon" alt="3" src="assets/images/3.webp" >',
        '{4}' => '<img class="manaIcon" alt="4 "src="assets/images/4.webp">',
        '{5}' => '<img class="manaIcon" alt="5" src="assets/images/5.webp" >',
        '{6}' => '<img class="manaIcon" alt="6" src="assets/images/6.webp" >',
        '{7}' => '<img class="manaIcon" alt="7" src="assets/images/7.webp" >',
        '{8}' => '<img class="manaIcon" alt="8" src="assets/images/8.webp" >',
        '{9}' => '<img class="manaIcon" alt="9" src="assets/images/9.webp">',
        '{10}' => '<img class="manaIcon" alt="10" src="assets/images/10.webp">',
        '{11}' => '<img class="manaIcon" alt="11" src="assets/images/11.webp">',
        '{12}' => '<img class="manaIcon" alt="12"  src="assets/images/12.webp">',
        '{13}' => '<img class="manaIcon" alt="13" src="assets/images/13.webp">',
        '{14}' => '<img class="manaIcon" alt="14" src="assets/images/14.webp">',
        '{15}' => '<img class="manaIcon" alt="15" src="assets/images/15.webp">',
        '{16}' => '<img class="manaIcon" alt="16"  src="assets/images/16.webp">',
        '{17}' => '<img class="manaIcon" alt="17" src="assets/images/17.webp">',
        '{18}' => '<img class="manaIcon" alt="18" src="assets/images/18.webp">',
        '{19}' => '<img class="manaIcon" alt="19" src="assets/images/19.webp">',
        '{20}' => '<img class="manaIcon" alt="20" src="assets/images/20.webp">',
        '{B}' => '<img class="manaIcon" alt="Blue" src="assets/images/B.webp">',
        '{BG}' => '<img class="manaIcon" alt="Blue/Green" src="assets/images/BG.webp">',
        '{BGP}' => '<img class="manaIcon" alt="Phyrexian Blue/Green" src="assets/images/BGP.webp">',
        '{BP}' => '<img class="manaIcon" alt="Phyrexian Blue" src="assets/images/BP.webp">',
        '{BR}' => '<img class="manaIcon" alt="Blue/Red" src="assets/images/BR.webp">',
        '{BRP}' => '<img class="manaIcon" alt="Phyrexian Blue/Red" src="assets/images/BRP.webp">',
        '{C}' => '<img class="manaIcon" alt="Colorless" src="assets/images/C.webp">',
        '{CB}' => '<img class="manaIcon" alt="Colorless/Black" src="assets/images/CB.webp">',
        '{CG}' => '<img class="manaIcon" alt="Colorless/Green" src="assets/images/CG.webp">',
        '{CR}' => '<img class="manaIcon" alt="Colorless/Red"  src="assets/images/CR.webp">',
        '{CU}' => '<img class="manaIcon" alt="Colorless/Blue"  src="assets/images/CU.webp">',
        '{CW}' => '<img class="manaIcon" alt="Colorless/White" src="assets/images/CW.webp">',
        '{G}' => '<img class="manaIcon" alt="Green" src="assets/images/G.webp">',
        '{GP}' => '<img class="manaIcon" alt="Phyrexian Green" src="assets/images/GP.webp">',
        '{GU}' => '<img class="manaIcon" alt="Green/Blue" src="assets/images/GU.webp">',
        '{GUP}' => '<img src="assets/images/GUP.webp">',
        '{GW}' => '<img class="manaIcon" alt="Green/White" src="assets/images/GW.webp">',
        '{GWP}' => '<img class="manaIcon" alt="Phyrexian Green/White" src="assets/images/GWP.webp">',
        '{InvertedS}' => '<img class="manaIcon" alt="Inverted Snowflake" src="assets/images/InvertedS.webp">',
        '{R}' => '<img class="manaIcon" alt="Red" src="assets/images/R.webp">',
        '{RG}' => '<img class="manaIcon" alt="Red/Green" src="assets/images/RG.webp">',
        '{RGP}' => '<img class="manaIcon" alt="Phyrexian Red/Green" src="assets/images/RGP.webp">',
        '{RP}' => '<img class="manaIcon" alt="Phyrexian Red" src="assets/images/RP.webp">',
        '{RW}' => '<img class="manaIcon" alt="Red/White" src="assets/images/RW.webp">',
        '{RWP}' => '<img class ="manaIcon" alt ="phyrexian Red/White" src="assets/images/RWP.webp">',
        '{S}' => '<img class ="manaIcon" alt ="Snow" src="assets/images/S.webp">',
        '{U}' => '<img class ="manaIcon" alt ="Blue" src="assets/images/U.webp">',
        '{UB}' => '<img class ="manaIcon" alt ="Blue/black" src="assets/images/UB.webp" >',
        '{UBP}' => '<img class ="manaIcon" alt ="phyrexian Blue/black" src="assets/images/UBP.webp">',
        '{UP}' => '<img class ="manaIcon" alt ="White/Black" src="assets/images/UP.webp" >',
        '{UR}' => '<img class ="manaIcon" alt ="Blue/Red" src="assets/images/UR.webp" >',
        '{URP}' => '<img class ="manaIcon" alt = phyrexian Blue/Red" src="assets/images/URP.webp">',
        '{W}' => '<img class ="manaIcon" alt ="White" src="assets/images/W.webp" >',
        '{WB}' => '<img class ="manaIcon" alt ="White/Black" src="assets/images/WB.webp" >',
        '{WBP}' => '<img class ="manaIcon" alt ="phyrexian white/black" src="assets/images/WBP.webp">',
        '{WP}' => '<img class ="manaIcon" alt ="phyrexian white/green" src="assets/images/WP.webp">',
        '{WU}' => '<img class ="manaIcon" alt = phyrexian white/blue" src="assets/images/WU.webp">',
        '{WUP}' => '<img class ="manaIcon" alt ="Untap" src="assets/images/WUP.webp" >',
        '{T}' => '<img class ="manaIcon" alt ="Tap" src="assets/images/T.webp">',
        '{Q}' => '<img class ="manaIcon" alt ="Untap" src="assets/images/T.webp">',
        '{X}' => '<img class ="manaIcon" alt ="Generic X mana" src="assets/images/X.webp">'

    );
/*
Took forever to find an example of this code and then another forever to understand how it works.

array_keys gets the index value for each entry in $manaPath. 

then array_map is a callback function that applies the function in the string to every entry in the array.
so array_keys returns [0] => '<img src="assets/images/0.webp">' and then array_map applies preg_quote to each of those.  

preg_quote just adds / to the front of every regex character like { and }.  implode joins the array elements and returns a string.
preg_replace_callback searches the string for the regex patterns and then uses an anonymous function to check for matches and replace
those matches with the <img src> tags.

The short version is : Someone on stack exchange https://stackoverflow.com/questions/10002899/replace-string-with-image very helpfully explained how to do this and provided https://www.php.net/pcre for documentation.

*/
$patterns = array_map('preg_quote', array_keys($manaPath));
$patterns = '/(' . implode('|', $patterns) . ')/';

$manaSymbolOut = preg_replace_callback($patterns, function($match) use ($manaPath) {
    return $manaPath[$match[0]];
}, $input);

return $manaSymbolOut;
}
?>