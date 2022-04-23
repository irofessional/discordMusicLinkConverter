import json
import os
import re

import discord
from requests import request
import requests

# os.getenv(key="DISCORD_TOKEN")
DISCORD_TOKEN = os.getenv(key='DISCORD_TOKEN')
DISOCRD_CATEGORY_ID = int(os.getenv(key='DISOCRD_CATEGORY_ID'))

MUSICLINK_ENDPOIT = "https://api.song.link/v1-alpha.1/links"

SPOTIFY_URL_REGEX = re.compile(
    r'https?://open.spotify.com/(track|album|artist)/[\w]+')
APPLEMUSIC_URL_REGEX = re.compile(
    r'https?://music\.apple\.com/jp/(album|artist)/.+/[\d]+')


class MusicLinkConverter(discord.Bot):
    async def on_message(self, message: discord.Message):
        if message.author.bot:
            return

        if message.channel.category_id == DISOCRD_CATEGORY_ID:
            mtc = re.search(SPOTIFY_URL_REGEX, message.content)
            music_url: str = mtc.group()
            req = requests.get(MUSICLINK_ENDPOIT, params={"url": music_url})
            print(req.json())


intents = discord.Intents.default()
intents.message_content = True
intents.messages = True
client = MusicLinkConverter(intents=intents)

if __name__ == '__main__':
    client.run(DISCORD_TOKEN)
