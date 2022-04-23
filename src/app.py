import os
import re

import discord
import requests

from get_music_data import get_music_data, MusicNotFoundError
from create_view import create_view

# os.getenv(key="DISCORD_TOKEN")
DISCORD_TOKEN = os.getenv(key='DISCORD_TOKEN')
DISOCRD_CATEGORY_ID = int(os.getenv(key='DISOCRD_CATEGORY_ID'))

MUSICLINK_ENDPOIT = "https://api.song.link/v1-alpha.1/links"

MUSIC_URL_REGEX = re.compile(
    r'(https?://music\.apple\.com/jp/(album|artist)/[\w\-\%]+/[\d]+)|(https?://open\.spotify\.com/(track|album|artist)/[\w]+)')


class MusicLinkConverter(discord.Bot):
    async def on_message(self, message: discord.Message):
        if message.author.bot:
            return

        if message.channel.category_id == DISOCRD_CATEGORY_ID:
            try:
                mtc = re.search(MUSIC_URL_REGEX, message.content)
                music_url: str = mtc.group()
                music_data: list = get_music_data(music_url)

                view = create_view(music_data=music_data)

                await message.reply(view=view)

            except (AttributeError, MusicNotFoundError, requests.RequestException):
                return

            except KeyError:
                pass


intents = discord.Intents.default()
intents.message_content = True
intents.messages = True
client = MusicLinkConverter(intents=intents)

if __name__ == '__main__':
    client.run(DISCORD_TOKEN)
