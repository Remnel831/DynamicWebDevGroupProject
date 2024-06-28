<?php
/*
This file sets up the mana icon and card color scripts that replaces mana tags with the symbols from the real cards and sets the card background
to match the color of the card.  It can get rolled into one of the models I just had it separate for testing.- Jacob
*/
function manaReplace($input)
{
    // => in an array replaces the left side with the right so {0} with the img src for 0.webp
    $manaPath = array(
        '{0}' => '<img class="manaIcon" width="15px" alt="0" src="assets/images/0.webp">',
        '{1}' => '<img class="manaIcon" width="15px" alt="1" src="assets/images/1.webp" >',
        '{2}' => '<img class="manaIcon" width="15px" alt="2" src="assets/images/2.webp" >',
        '{3}' => '<img class="manaIcon" width="15px" alt="3" src="assets/images/3.webp" >',
        '{4}' => '<img class="manaIcon" width="15px" alt="4 "src="assets/images/4.webp">',
        '{5}' => '<img class="manaIcon" width="15px" alt="5" src="assets/images/5.webp" >',
        '{6}' => '<img class="manaIcon" width="15px" alt="6" src="assets/images/6.webp" >',
        '{7}' => '<img class="manaIcon" width="15px" alt="7" src="assets/images/7.webp" >',
        '{8}' => '<img class="manaIcon" width="15px" alt="8" src="assets/images/8.webp" >',
        '{9}' => '<img class="manaIcon" width="15px" alt="9" src="assets/images/9.webp">',
        '{10}' => '<img class="manaIcon" width="15px" alt="10" src="assets/images/10.webp">',
        '{11}' => '<img class="manaIcon" width="15px" alt="11" src="assets/images/11.webp">',
        '{12}' => '<img class="manaIcon" width="15px" alt="12"  src="assets/images/12.webp">',
        '{13}' => '<img class="manaIcon" width="15px" alt="13" src="assets/images/13.webp">',
        '{14}' => '<img class="manaIcon" width="15px" alt="14" src="assets/images/14.webp">',
        '{15}' => '<img class="manaIcon" width="15px" alt="15" src="assets/images/15.webp">',
        '{16}' => '<img class="manaIcon" width="15px" alt="16"  src="assets/images/16.webp">',
        '{17}' => '<img class="manaIcon" width="15px" alt="17" src="assets/images/17.webp">',
        '{18}' => '<img class="manaIcon" width="15px" alt="18" src="assets/images/18.webp">',
        '{19}' => '<img class="manaIcon" width="15px" alt="19" src="assets/images/19.webp">',
        '{20}' => '<img class="manaIcon" width="15px" alt="20" src="assets/images/20.webp">',
        '{B}' => '<img class="manaIcon" width="15px" alt="Black" src="assets/images/B.webp">',
        '{BG}' => '<img class="manaIcon" width="15px" alt="Black/Green" src="assets/images/BG.webp">',
        '{BGP}' => '<img class="manaIcon" width="15px" alt="Phyrexian Black/Green" src="assets/images/BGP.webp">',
        '{BP}' => '<img class="manaIcon" width="15px" alt="Phyrexian Black" src="assets/images/BP.webp">',
        '{BR}' => '<img class="manaIcon" width="15px" alt="Black/Red" src="assets/images/BR.webp">',
        '{BRP}' => '<img class="manaIcon" width="15px" alt="Phyrexian Black/Red" src="assets/images/BRP.webp">',
        '{C}' => '<img class="manaIcon" width="15px" alt="Colorless" src="assets/images/C.webp">',
        '{CB}' => '<img class="manaIcon" width="15px" alt="Colorless/Black" src="assets/images/CB.webp">',
        '{CG}' => '<img class="manaIcon" width="15px" alt="Colorless/Green" src="assets/images/CG.webp">',
        '{CR}' => '<img class="manaIcon" width="15px" alt="Colorless/Red"  src="assets/images/CR.webp">',
        '{CU}' => '<img class="manaIcon" width="15px" alt="Colorless/Blue"  src="assets/images/CU.webp">',
        '{CW}' => '<img class="manaIcon" width="15px" alt="Colorless/White" src="assets/images/CW.webp">',
        '{G}' => '<img class="manaIcon" width="15px" alt="Green" src="assets/images/G.webp">',
        '{GP}' => '<img class="manaIcon" width="15px" alt="Phyrexian Green" src="assets/images/GP.webp">',
        '{GU}' => '<img class="manaIcon" width="15px" alt="Green/Blue" src="assets/images/GU.webp">',
        '{GUP}' => '<img class="manaIcon" width="15px" alt="Phyrexian Green/Blue" src="assets/images/GUP.webp">',
        '{GW}' => '<img class="manaIcon" width="15px" alt="Green/White" src="assets/images/GW.webp">',
        '{GWP}' => '<img class="manaIcon" width="15px" alt="Phyrexian Green/White" src="assets/images/GWP.webp">',
        '{InvertedS}' => '<img class="manaIcon" width="15px" alt="Inverted Snowflake" src="assets/images/InvertedS.webp">',
        '{R}' => '<img class="manaIcon" width="15px" alt="Red" src="assets/images/R.webp">',
        '{RG}' => '<img class="manaIcon" width="15px" alt="Red/Green" src="assets/images/RG.webp">',
        '{RGP}' => '<img class="manaIcon" width="15px" alt="Phyrexian Red/Green" src="assets/images/RGP.webp">',
        '{RP}' => '<img class="manaIcon" width="15px" alt="Phyrexian Red" src="assets/images/RP.webp">',
        '{RW}' => '<img class="manaIcon" width="15px" alt="Red/White" src="assets/images/RW.webp">',
        '{RWP}' => '<img class ="manaIcon" width="15px" alt ="Phyrexian Red/White" src="assets/images/RWP.webp">',
        '{S}' => '<img class ="manaIcon" width="15px" alt ="Snow" src="assets/images/S.webp">',
        '{U}' => '<img class ="manaIcon" width="15px" alt ="Blue" src="assets/images/U.webp">',
        '{UB}' => '<img class ="manaIcon" alt ="Blue/Black" src="assets/images/UB.webp" >',
        '{UBP}' => '<img class ="manaIcon" width="15px" alt ="Phyrexian Blue/black" src="assets/images/UBP.webp">',
        '{UP}' => '<img class ="manaIcon" width="15px" alt ="White/Black" src="assets/images/UP.webp" >',
        '{UR}' => '<img class ="manaIcon" width="15px" alt ="Blue/Red" src="assets/images/UR.webp" >',
        '{URP}' => '<img class ="manaIcon" width="15px" alt = Phyrexian Blue/Red" src="assets/images/URP.webp">',
        '{W}' => '<img class ="manaIcon" width="15px" alt ="White" src="assets/images/W.webp" >',
        '{WB}' => '<img class ="manaIcon" width="15px" alt ="White/Black" src="assets/images/WB.webp" >',
        '{WBP}' => '<img class ="manaIcon" width="15px" alt ="Phyrexian white/black" src="assets/images/WBP.webp">',
        '{WP}' => '<img class ="manaIcon" width="15px" alt ="Phyrexian White" src="assets/images/WP.webp">',
        '{WU}' => '<img class ="manaIcon" width="15px" alt = White/Blue" src="assets/images/WU.webp">',
        '{WUP}' => '<img class ="manaIcon" width="15px" alt ="Phyrexian White/Blue" src="assets/images/WUP.webp">',
        '{T}' => '<img class ="manaIcon" width="15px" alt ="Tap" src="assets/images/T.webp">',
        '{Q}' => '<img class ="manaIcon" width="15px" alt ="Untap" src="assets/images/T.webp">',
        '{X}' => '<img class ="manaIcon" width="15px" alt ="Generic X mana" src="assets/images/X.webp">'

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


//this ones pretty straightforward.  Just changes the imgurl string based on the color thats passed to it from the table.  
function CardColor($color)
{
    $imgurl = '';
    switch ($color)
    {
        case "White":
        {
            $imgurl = 'assets/images/WhiteBG.png';
            break;

        }
        case "Black":
        {
            $imgurl = 'assets/images/BlackBG.png';
            break;
        }
        case "Red":
        {
            $imgurl = 'assets/images/RedBG.png';
            break;

        }
        case "Gray":
        {
            $imgurl = 'assets/images/GrayBG.png';
            break;

        }
        case "Green":
            {
                $imgurl = 'assets/images/GreenBG.png';
                break;
    
            }
        case "Blue":
        {
            $imgurl = 'assets/images/BlueBG.png';
            break;

        }
        case "Black/Red":
        {
            $imgurl = 'assets/images/BlackRedBG.png';
            break;

        }
        case "Black/Green":
        {
                $imgurl = 'assets/images/BlackGreenBG.png';
                break;
    
        }
        case "Green/White":
        {
            $imgurl = 'assets/images/GreenWhiteBG.png';
            break;

        }
        case "Red/Green":
        {
            $imgurl = 'assets/images/RedGreenBG.png';
            break;

        }
        case "Blue/Black":
        {
            $imgurl = 'assets/images/BlueBlackBG.png';
            break;

        }
        case "Blue/Red":
        {
            $imgurl = 'assets/images/BlueRedBG.png';
            break;

        }
        case "White/Black":
        {
            $imgurl = 'assets/images/WhiteBlackBG.png';
            break;

        }
        case "White/Blue":
        {
            $imgurl = 'assets/images/WhiteBlueBG.png';
            break;
        }
    }
    return $imgurl;
}

?>