# shell-epoch
Convert unix epoch time to either UTC or local time in pure bourne shell

Results are output in ISO 8601 date/time format

# usage examples

    $ ./shell-epoch.sh $(date +%s)
    2022-07-05T13:01:03Z
    $ ./shell-epoch.sh $(date +%s) local
    2022-07-05T09:01:18-04:00
    $ ./shell-epoch.sh $(date +%s) utc
    2022-07-05T13:01:33Z
    $ ./shell-epoch.sh $(date +%s) DEADBEEF
    2022-07-05T13:01:42Z
