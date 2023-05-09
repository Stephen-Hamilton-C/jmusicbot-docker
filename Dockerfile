
FROM eclipse-temurin:17
VOLUME /bot

# Not meant to be changed outside of here
ENV BOT_VERSION "0.3.9"

# Whether the config should be updated with environment variables on every start
ENV OVERWRITE_CONFIG "yes"

# Configuration
ENV OWNER_ID "0"
ENV BOT_TOKEN ""
ENV BOT_PREFIX "@mention"
ENV BOT_GAME "DEFAULT"
ENV BOT_STATUS "ONLINE"
ENV BOT_SONG_IN_STATUS "false"
ENV BOT_ALT_PREFIX "NONE"
ENV BOT_REACT_SUCCESS "🎶"
ENV BOT_REACT_WARNING "💡"
ENV BOT_REACT_ERROR "🚫"
ENV BOT_REACT_LOADING "⌚"
ENV BOT_REACT_SEARCHING "🔎"
ENV BOT_HELP "help"
ENV BOT_NPIMAGES "false"
ENV BOT_STAY_IN_CHANNEL "false"
ENV BOT_MAX_TIME "0"
ENV BOT_ALONE_TIME_UNTIL_STOP "0"
ENV BOT_PLAYLISTS_FOLDER "Playlists"
ENV BOT_UPDATE_ALERTS "true"
ENV BOT_LYRICS_DEFAULT "A-Z Lyrics"

RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

ADD https://github.com/jagrosh/MusicBot/releases/download/${BOT_VERSION}/JMusicBot-${BOT_VERSION}.jar /bot/JMusicBot.jar

COPY start.sh /bot/start.sh
COPY config.txt.template /bot/config.txt.template

CMD /bin/bash /bot/start.sh

