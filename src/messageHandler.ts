import { Message, ActionRowBuilder, TextChannel } from "discord.js";
import { createDiscordComponents } from "./createDiscordView";
import { getSongLinkData } from "./getSongLink";
import { SearchQuery, SearchResult, } from "./types/search";
import { userMessagePaser } from "./userMessagePaser";

export const messageHandler = async (message: Message) => {
    if (!process.env.DISCORD_ID) {
        throw new Error("Target channel, category or guild id is not set.")
    }

    if (message.author.bot) {
        return
    }

    if (!(message.channel instanceof TextChannel)) {
        return
    }

    const compareDiscordId = [message.channelId, message.guildId, message.channel.parentId]

    if (!compareDiscordId.includes(process.env.DISCORD_ID)) {
        return
    }

    const musicUrl = userMessagePaser(message.content)

    if (!musicUrl) { return }

    const searchQuery: SearchQuery = {
        url: musicUrl
    }

    const seachResult: SearchResult = await getSongLinkData(searchQuery)

    if (!seachResult.result || seachResult.result.length < 1) {
        return
    }

    const components = createDiscordComponents(seachResult)

    message.reply({
        components: components,
    })

}