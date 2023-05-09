
FROM eclipse-temurin:17
VOLUME /bot

# Not meant to be changed outside of here
ENV BOT_VERSION "0.3.9"

# Whether the config should be updated with environment variables on every start
ENV OVERWRITE_CONFIG "yes"

# Configuration
# Discord User ID
ENV OWNER_ID "0"
# Bot Token
ENV BOT_TOKEN ""
# The prefix for bot commands
# If set to "@mention", then mentioning the bot will act as the prefix
ENV BOT_PREFIX "@mention"
# What to show as the bot's activity
# Using "DEFAULT" will show "Playing Type @Bot help"
ENV BOT_GAME "DEFAULT"
# The default status of the bot. "ONLINE", "IDLE", "DND", or "INVISIBLE"
ENV BOT_STATUS "ONLINE"
# Whether the bot should list the title of the song its currently playing
# in its "Playing" status. This only works if the bot is in one server.
# "true" or "false"
ENV BOT_SONG_IN_STATUS "false"
# Another prefix the bot will listen to
ENV BOT_ALT_PREFIX "NONE"
# The emoji the bot will react with on a successful command
ENV BOT_REACT_SUCCESS "🎶"
# The emoji the bot will react with when a warning comes up for a command
ENV BOT_REACT_WARNING "💡"
# The emoji the bot will react with on a failed command
ENV BOT_REACT_ERROR "🚫"
# The emoji the bot will react with while loading
ENV BOT_REACT_LOADING "⌚"
# The emoji the bot will react with when searching for music
ENV BOT_REACT_SEARCHING "🔎"
# The command to list all possible commands
ENV BOT_HELP "help"
# Whether to show the Youtube thumbnail in the "nowplaying" command
# Setting this to true will not refresh the nowplaying box
ENV BOT_NPIMAGES "false"
# Whether the bot will stay in the channel after it has finished playing the queue
ENV BOT_STAY_IN_CHANNEL "false"
# Sets the max duration of any songs in seconds.
# Setting to 0 or negative will not enforce a max duration.
ENV BOT_MAX_TIME "0"
# How many seconds the bot will stay alone in a voice chat before it leaves
ENV BOT_ALONE_TIME_UNTIL_STOP "0"
# The path to the Playlists folder. 
# This is relative to /bot in the container.
# Absolute paths can also be used.
ENV BOT_PLAYLISTS_FOLDER "Playlists"
# Whether the bot DMs the owner (defined by OWNER_ID) if there is an update available
ENV BOT_UPDATE_ALERTS "true"
# The lyric provider to use.
# This could be "A-Z Lyrics", "Genius", "MusicMatch", or "LyricsFreak"
ENV BOT_LYRICS_DEFAULT "A-Z Lyrics"

RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

ADD https://github.com/jagrosh/MusicBot/releases/download/${BOT_VERSION}/JMusicBot-${BOT_VERSION}.jar /bot/JMusicBot.jar

COPY start.sh /bot/start.sh
COPY config.txt.template /bot/config.txt.template

CMD /bin/bash /bot/start.sh

