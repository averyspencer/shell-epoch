# shell-epoch
Convert unix epoch time to either UTC or local time in pure bourne shell

Want to use Windows' cmd.exe for some reason? Take a look at my other repository, [batch-epoch](https://github.com/averyspencer/batch-epoch)

Results are output in ISO 8601 date/time format

## TODO
* Outputting local times uses nonstandard functionality, bsdutils do not work with it; fix.

# usage examples
    $ # Should be July 14th, 2022 at 2:06:44 PM
    $ ./shell-epoch.sh 1657764404
    2022-07-14T02:06:44Z
    $ ./shell-epoch.sh 1657764404 local
    2022-07-13T22:06:44-04:00
    $ # Current time will vary
    $ ./shell-epoch.sh $(date +%s)
    2022-07-14T03:23:05Z
 
