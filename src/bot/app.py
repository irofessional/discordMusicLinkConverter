import os
import re

import discord
import requests

from get_songlink_data import get_songlink_data, MusicNotFoundError
from create_view import create_view
from parse_text import parse_text, MusicUrlNotContain


DISCORD_TOKEN = os.getenv(key='DISCORD_TOKEN')
DISOCRD_CATEGORY_ID = int(os.getenv(key='DISOCRD_CATEGORY_ID'))


class MusicLinkConverter(discord.Bot):
    async def on_message(self, message: discord.Message):
        if message.author.bot:
            return

        if message.channel.category_id == DISOCRD_CATEGORY_ID:
            try:
                music_url = parse_text(message.content)
                music_data: list = get_songlink_data(music_url)

                view = create_view(music_data=music_data)

                await message.reply(view=view)

            except (AttributeError, MusicNotFoundError, requests.RequestException, MusicUrlNotContain):
                return

            except KeyError:
                pass


intents = discord.Intents.default()
intents.message_content = True
intents.messages = True
client = MusicLinkConverter(intents=intents)

if __name__ == '__main__':
    client.run(DISCORD_TOKEN)
