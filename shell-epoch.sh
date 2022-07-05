#!/bin/sh

SECONDS_IN_NORMAL_YEAR=31536000
SECONDS_IN_LEAP_YEAR=31622400
SECONDS_IN_DAY=86400
SECONDS_IN_HOUR=3600
SECONDS_IN_MINUTE=60

DAYS_IN_JANUARY=31
DAYS_IN_FEBRUARY_NORMAL=28
DAYS_IN_FEBRUARY_LEAP=29
DAYS_IN_MARCH=31
DAYS_IN_APRIL=30
DAYS_IN_MAY=31
DAYS_IN_JUNE=30
DAYS_IN_JULY=31
DAYS_IN_AUGUST=31
DAYS_IN_SEPTEMBER=30
DAYS_IN_OCTOBER=31
DAYS_IN_NOVEMBER=30
DAYS_IN_DECEMBER=31

calc_leap_year()
{
    if test $(expr $cur_year % 4) -eq 0
    then
        if test $(expr $cur_year % 100) -eq 0
        then
            if test $(expr $cur_year % 400) -eq 0
            then
                is_leap_year=yes
            else
                if_leap_year=no
            fi
        else
            is_leap_year=yes
        fi
    else
        is_leap_year=no
    fi
}

calc_year_left_to_subtract()
{
    calc_leap_year
    if test is_leap_year = no
    then
        if test $e -ge $SECONDS_IN_NORMAL_YEAR
        then
            is_year_left_to_subtract=yes
        else
            is_year_left_to_subtract=no
        fi
    else
        if test $e -ge $SECONDS_IN_LEAP_YEAR
        then
            is_year_left_to_subtract=yes
        else
            is_year_left_to_subtract=no
        fi
    fi
}

subtract_year()
{
    calc_leap_year
    if test $is_leap_year = no
    then
        e=$(expr $e - $SECONDS_IN_NORMAL_YEAR)
    else
        e=$(expr $e - $SECONDS_IN_LEAP_YEAR)
    fi
}

calc_day_left_to_subtract()
{
    if test $e -ge $SECONDS_IN_DAY
    then
        is_day_left_to_subtract=yes
    else
        is_day_left_to_subtract=no
    fi
}

subtract_day()
{
    e=$(expr $e - $SECONDS_IN_DAY)
}

calc_hour_left_to_subtract()
{
    if test $e -ge $SECONDS_IN_HOUR
    then
        is_hour_left_to_subtract=yes
    else
        is_hour_left_to_subtract=no
    fi
}

subtract_hour()
{
    e=$(expr $e - $SECONDS_IN_HOUR)
}

calc_minute_left_to_subtract()
{
    if test $e -ge $SECONDS_IN_MINUTE
    then
        is_minute_left_to_subtract=yes
    else
        is_minute_left_to_subtract=no
    fi
}

subtract_minute()
{
    e=$(expr $e - $SECONDS_IN_MINUTE)
}

calc_month_left_to_subtract()
{
    if test $cur_month -eq 1
    then
        if test $cur_day -ge $DAYS_IN_JANUARY
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    elif test $cur_month -eq 2
    then
        calc_leap_year
        if test is_leap_year = yes
        then
            if test $cur_day -ge $DAYS_IN_FEBRUARY_LEAP
            then
                is_month_left_to_subtract=yes
            else
                is_month_left_to_subtract=no
            fi
        else
            if test $cur_day -ge $DAYS_IN_FEBRUARY_NORMAL
            then
                is_month_left_to_subtract=yes
            else
                is_month_left_to_subtract=no
            fi
        fi
    elif test $cur_month -eq 3
    then
        if test $cur_day -ge $DAYS_IN_MARCH
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    elif test $cur_month -eq 4
    then
        if test $cur_day -ge $DAYS_IN_APRIL
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    elif test $cur_month -eq 5
    then
        if test $cur_day -ge $DAYS_IN_MAY
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    elif test $cur_month -eq 6
    then
        if test $cur_day -ge $DAYS_IN_JUNE
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    elif test $cur_month -eq 7
    then
        if test $cur_day -ge $DAYS_IN_JULY
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    elif test $cur_month -eq 8
    then
        if test $cur_day -ge $DAYS_IN_AUGUST
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    elif test $cur_month -eq 9
    then
        if test $cur_day -ge $DAYS_IN_SEPTEMBER
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    elif test $cur_month -eq 10
    then
        if test $cur_day -ge $DAYS_IN_OCTOBER
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    elif test $cur_month -eq 11
    then
        if test $cur_day -ge $DAYS_IN_NOVEMBER
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    else
        if test $cur_day -ge $DAYS_IN_DECEMBER
        then
            is_month_left_to_subtract=yes
        else
            is_month_left_to_subtract=no
        fi
    fi
}

subtract_month()
{
    if test $cur_month -eq 1
    then
        cur_day=$(expr $cur_day - $DAYS_IN_JANUARY)
    elif test $cur_month -eq 2
    then
        calc_leap_year
        if test $is_leap_year = yes
        then
            cur_day=$(expr $cur_day - $DAYS_IN_FEBRUARY_LEAP)
        else
            cur_day=$(expr $cur_day - $DAYS_IN_FEBRUARY_NORMAL)
        fi
    elif test $cur_month -eq 3
    then
        cur_day=$(expr $cur_day - $DAYS_IN_MARCH)
    elif test $cur_month -eq 4
    then
        cur_day=$(expr $cur_day - $DAYS_IN_APRIL)
    elif test $cur_month -eq 5
    then
        cur_day=$(expr $cur_day - $DAYS_IN_MAY)
    elif test $cur_month -eq 6
    then
        cur_day=$(expr $cur_day - $DAYS_IN_JUNE)
    elif test $cur_month -eq 7
    then
        cur_day=$(expr $cur_day - $DAYS_IN_JULY)
    elif test $cur_month -eq 8
    then
        cur_day=$(expr $cur_day - $DAYS_IN_AUGUST)
    elif test $cur_month -eq 9
    then
        cur_day=$(expr $cur_day - $DAYS_IN_SEPTEMBER)
    elif test $cur_month -eq 10
    then
        cur_day=$(expr $cur_day - $DAYS_IN_OCTOBER)
    elif test $cur_month -eq 11
    then
        cur_day=$(expr $cur_day - $DAYS_IN_NOVEMBER)
    else
        cur_day=$(expr $cur_day - $DAYS_IN_DECEMBER)
    fi
}

calc_month()
{
    cur_month=1
    calc_month_left_to_subtract
    while test $is_month_left_to_subtract = yes
    do
        subtract_month

        cur_month=$(expr $cur_month + 1)
        calc_month_left_to_subtract
    done
}

e=$1
cur_year=1970

calc_year_left_to_subtract
while test $is_year_left_to_subtract = yes
do
    subtract_year

    cur_year=$(expr $cur_year + 1)
    calc_year_left_to_subtract
done

cur_day=1
calc_day_left_to_subtract
while test $is_day_left_to_subtract = yes
do
    subtract_day

    cur_day=$(expr $cur_day + 1)
    calc_day_left_to_subtract
done

cur_hour=0
calc_hour_left_to_subtract
while test $is_hour_left_to_subtract = yes
do
    subtract_hour

    cur_hour=$(expr $cur_hour + 1)
    calc_hour_left_to_subtract
done

cur_minute=1
calc_minute_left_to_subtract
while test $is_minute_left_to_subtract = yes
do
    subtract_minute

    cur_minute=$(expr $cur_minute + 1)
    calc_minute_left_to_subtract
done

cur_second=$e

calc_month

utc_dt=$(printf '%04d-%02d-%02dT%02d:%02d:%02dZ\n' $cur_year $cur_month $cur_day $cur_hour $cur_minute $cur_second)

if test ! -z $2
then
    if test $2 = "utc"
    then
        echo $utc_dt
    elif test $2 = "local"
    then
        date -d $utc_dt -Iseconds
    else
        echo $utc_dt
    fi
else
    echo $utc_dt
fi
