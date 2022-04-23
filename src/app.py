import os
import re

import discord
import requests

# os.getenv(key="DISCORD_TOKEN")
DISCORD_TOKEN = os.getenv(key='DISCORD_TOKEN')
DISOCRD_CATEGORY_ID = int(os.getenv(key='DISOCRD_CATEGORY_ID'))

MUSICLINK_ENDPOIT = "https://api.song.link/v1-alpha.1/links"

SPOTIFY_URL_REGEX = re.compile(
    r'https?://open.spotify.com/(track|album|artist)/[\w]+')
APPLEMUSIC_URL_REGEX = re.compile(
    r'https?://music\.apple\.com/jp/(album|artist)/[\w\-\%]+/[\d]+')


class MusicLinkConverter(discord.Bot):
    async def on_message(self, message: discord.Message):
        if message.author.bot:
            return

        if message.channel.category_id == DISOCRD_CATEGORY_ID:
            mtc = re.search(APPLEMUSIC_URL_REGEX, message.content)
            if mtc is None:
                return

            music_url: str = mtc.group()
            req = requests.get(MUSICLINK_ENDPOIT, params={
                               "url": music_url, "userCountry": "JP"})
            try:
                req.raise_for_status()
            except Exception:
                return
            music_data: dict = req.json()
            spotify_url: str
            applemusic_url: str

            try:
                spotify_url = music_data['linksByPlatform']['spotify']['url']
            except KeyError:
                pass
            try:
                applemusic_url = applemusic_url = music_data["linksByPlatform"]["appleMusic"]["url"]
            except KeyError:
                pass

            view = discord.ui.View()

            if spotify_url is None and applemusic_url is None:
                return

            if spotify_url is not None:
                spotify_btn = discord.ui.Button(
                    style=discord.ButtonStyle.link, label="Spotify", url=spotify_url)
                view.add_item(spotify_btn)

            if applemusic_url is not None:
                applemusic_btn = discord.ui.Button(
                    style=discord.ButtonStyle.url, label="Apple Music", url=applemusic_url)
                view.add_item(applemusic_btn)

            await message.reply(view=view)


intents = discord.Intents.default()
intents.message_content = True
intents.messages = True
client = MusicLinkConverter(intents=intents)

if __name__ == '__main__':
    client.run(DISCORD_TOKEN)
