import discord


def create_view(music_data: list) -> discord.ui.View:
    view: discord.ui.View = discord.ui.View(timeout=None)
    for i in music_data:
        button = discord.ui.Button(
            style=discord.ButtonStyle.url, label=i["service"], url=i["url"])
        view.add_item(button)

    return view
