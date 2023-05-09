# jmusicbot-docker
Dockerized version of [JMusicBot](https://github.com/jagrosh/MusicBot).

I love running my server applications as Docker containers,
and this self-hosted Discord Youtube Music bot is no different.
This simple Docker image makes it even easier to get JMusicBot up and running.

## Quickstart
1. Follow JMusicBot's excellent guide on [getting a bot token](https://jmusicbot.com/getting-a-bot-token/)
and [finding your user ID](https://jmusicbot.com/finding-your-user-id/)
2. Create a `docker-compose.yml` file using [the template below](#docker-compose)
3. Put your bot token in the environment variable for `BOT_TOKEN`
4. Put your user ID in the environment variable for `OWNER_ID`
5. Run `docker-compose up -d`

## docker-compose
Here is a template docker-compose.yml to get you started:
```yml
version: '3.7'

services:
  jmusicbot:
  image: stephenhamiltonc/jmusicbot:latest
  container_name: jmusicbot
  restart: unless-stopped
  tty: true
  
  environment:
    OWNER_ID: "Put your Discord User ID here"
    BOT_TOKEN: "Put your Discord Bot token here"
    
    # Bot Configuration from config.txt:
    # The prefix for bot commands
    # If set to "@mention", then mentioning the bot will act as the prefix
    BOT_PREFIX: "@mention"
    # What to show as the bot's activity
    # Using "DEFAULT" will show "Playing Type @Bot help"
    BOT_GAME: "DEFAULT"
    # The default status of the bot. "ONLINE", "IDLE", "DND", or "INVISIBLE"
    BOT_STATUS: "ONLINE"
    # Whether the bot should list the title of the song its currently playing
    # in its "Playing" status. This only works if the bot is in one server.
    # "true" or "false"
    BOT_SONG_IN_STATUS: "false"
    # Another prefix the bot will listen to
    # "NONE" if no other prefix should be used
    BOT_ALT_PREFIX: "NONE"
    # The emoji the bot will react with on a successful command
    BOT_REACT_SUCCESS: "🎶"
    # The emoji the bot will react with when a warning comes up for a command
    BOT_REACT_WARNING: "💡"
    # The emoji the bot will react with on a failed command
    BOT_REACT_ERROR: "🚫"
    # The emoji the bot will react with while loading
    BOT_REACT_LOADING: "⌚"
    # The emoji the bot will react with when searching for music
    BOT_REACT_SEARCHING: "🔎"
    # The command to list all possible commands
    BOT_HELP: "help"
    # Whether to show the Youtube thumbnail in the "nowplaying" command
    # Setting this to true will not refresh the nowplaying box
    BOT_NPIMAGES: "false"
    # Whether the bot will stay in the channel after it has finished playing the queue
    BOT_STAY_IN_CHANNEL: "false"
    # Sets the max duration of any songs in seconds.
    # Setting to 0 or negative will not enforce a max duration.
    BOT_MAX_TIME: "0"
    # How many seconds the bot will stay alone in a voice chat before it leaves
    BOT_ALONE_TIME_UNTIL_STOP: "0"
    # The path to the Playlists folder. 
    # This is relative to /bot in the container.
    # Absolute paths can also be used.
    BOT_PLAYLISTS_FOLDER: "Playlists"
    # Whether the bot DMs the owner (defined by OWNER_ID) if there is an update available
    BOT_UPDATE_ALERTS: "true"
    # The lyric provider to use.
    # This could be "A-Z Lyrics", "Genius", "MusicMatch", or "LyricsFreak"
    BOT_LYRICS_DEFAULT: "A-Z Lyrics"
```
The only required environment variables are `OWNER_ID` and `BOT_TOKEN`.
If the rest are left out, they will be at their default values, which are used in this example.

An additional environment variable is `OVERWRITE_CONFIG`, which can be `"yes"` or `"no"`.
If it is set to `"yes"`, then the `config.txt` for the bot will be updated with the config environment variables at next start.
Otherwise, changing the config environment variables will have no effect.
This should be left to `"yes"` on first run so that the config can be initialized.

## Additional Links
- [JMusicBot](https://github.com/jagrosh/MusicBot)
- [Docker Hub](https://hub.docker.com/r/stephenhamiltonc/jmusicbot)
<!-- - [Github](https://github.com/Stephen-Hamilton-C/jmusicbot-docker) -->
