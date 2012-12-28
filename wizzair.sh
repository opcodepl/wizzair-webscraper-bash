#!/bin/bash

if [ $# -ne 3 ]
then
    echo Usage: $0 start-airport-code end-airport-code currency
    echo ex. $0 KTW FRL PLN
    exit
fi

from1=$1
to1=$2
currency=PLN
sid=""
departday1=`php -r "date_default_timezone_set('Europe/Warsaw'); echo date('d');"`
departmonth1=`php -r "date_default_timezone_set('Europe/Warsaw'); echo date('Ym');"`
depart1flexby=""
datenext="1"
datenextold="2"

choice=$3

rm loty$1$2

for (( ; ; ))
do
    curl -b cookies.txt http://wizzair.com/skylights/cgi-bin/skylights.cgi?step=1 -e http://wizzair.com/skylights/cgi-bin/skylights.cgi?step=1 -d "event=search&module=SB&page=SEARCH&language=PL&mode=&sid=$sid&ref=&log_in=1&travel=1&from1=$from1&to1=$to1&departDay1=$departday1&departMonth1=$departmonth1&depart1FlexBy=$depart1flexby&departDay2=&departMonth2=&depart2FlexBy=&ADULT=1&defaultADULT=-1&CHILD=0&defaultCHILD=-1&INFANT=0&defaultINFANT=-1&toCity1=FRL&toCity2=%3F%3F%3F&departDate1=&departDate2=&numberMarkets=1&selectedUtil=&email=&pw=" -L -A "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:10.0.2) Gecko/20100101 Firefox/10.0.2" -o wynik.html

    case "$choice" in
	'EUR' )
	    loty=`grep -E 'm1f.*date|EUR' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/EUR/EUR\n/g' |sed -e 's/^[ \t]*//' |sed -e s/\'/\"/g`
	    ;;
        'GBP' )
	    loty=`grep -E 'm1f.*date|GBP' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/GBP/GBP\n/g' |sed -e 's/^[ \t]*//' |sed -e s/\'/\"/g`
	    ;;
        'HUF' )
	    loty=`grep -E 'm1f.*date|HUF' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|alert.gif|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/HUF/HUF\n/g' |sed -e 's/^[ \t]*//'`
	    ;;
        'NOK' )
	    loty=`grep -E 'm1f.*date|NOK' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|alert.gif|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/NOK/NOK\n/g' |sed -e 's/^[ \t]*//'`
	    ;;
        'RON' )
	    loty=`grep -E 'm1f.*date|RON' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|alert.gif|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/RON/RON\n/g' |sed -e 's/^[ \t]*//'`
	    ;;
        'SEK' )
	    loty=`grep -E 'm1f.*date|SEK' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|alert.gif|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/SEK/SEK\n/g' |sed -e 's/^[ \t]*//'`
	    ;;
        'LTL' )
	    loty=`grep -E 'm1f.*date|LTL' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|alert.gif|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/LTL/LTL\n/g' |sed -e 's/^[ \t]*//'`
	    ;;
        'BGN' )
	    loty=`grep -E 'm1f.*date|BGN' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|alert.gif|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/BGN/BGN\n/g' |sed -e 's/^[ \t]*//'`
	    ;;
        'USD' )
	    loty=`grep -E 'm1f.*date|USD' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|alert.gif|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/USD/USD\n/g' |sed -e 's/^[ \t]*//'`
	    ;;
        'RSD' )
	    loty=`grep -E 'm1f.*date|RSD' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|alert.gif|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/RSD/RSD\n/g' |sed -e 's/^[ \t]*//'`
	    ;;
        'LVL' )
	    loty=`grep -E 'm1f.*date|LVL' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|alert.gif|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/LVL/LVL\n/g' |sed -e 's/^[ \t]*//'`
	    ;;
        * )
	    loty=`grep -E 'm1f.*date|PLN' wynik.html | grep -Ev 'PHF|newCell|currency|option|suffix|fareText|Summary|fareRule|alert.gif|zwyk' |sed -e 's/^[ \t]*//' |sed 's/(Wizz Xclusive Club:  //' |sed 's/)//' |tr '\n' '\t' |sed 's/PLN/PLN\n/g' |sed -e 's/^[ \t]*//'`
	    ;;
    esac

    php -r "echo trim(strip_tags('$loty'));" >> loty$from1$to1

    echo "" >> loty$from1$to1

    sid=` cat wynik.html |grep sid |grep value |uniq |cut -d"'" -f6`
    datenext=`cat wynik.html |grep nextWeekButton1Value |cut -d\" -f6`

    #checks if next date is the same as current (end of the flight season)
    if [ $datenext -eq $datenextold ]
    then
    	exit
    fi

    datenextold=$datenext

    departday1=${datenext:6}
    departmonth1=${datenext:0:6}

    #end date to check
    if [ $datenext -gt 20130801 ]
    then
	exit
    fi

    sleep 1
done
