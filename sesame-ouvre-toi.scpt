set appName to "Docker"

startApp(appName)

tell application "System Events" to tell process "Docker"
    ignoring application responses
        click menu bar item 1 of menu bar 2
    end ignoring
end tell

do shell script "killall System\\ Events"

startApp(appName)

tell application "System Events" to tell process "Docker" #
    tell menu bar item 1 of menu bar 2
        click menu item "Dashboard" of menu 1
    end tell
end tell

on startApp(appName)
    set IsRunning to false
    set tries to 20
    repeat until (IsRunning is true or tries is 0)
        set IsRunning to appIsRunning(appName)
        set tries to (tries - 1)
    end repeat
end startApp

on appIsRunning(appName)
    tell application "System Events" to (name of processes) contains appName
end appIsRunning
