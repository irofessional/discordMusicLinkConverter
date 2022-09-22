import { ActionRowBuilder, ButtonBuilder, ButtonStyle, MessageActionRowComponent } from "discord.js";
import { SearchResult } from "./types/search";

export const createDiscordComponents = (SongsData: SearchResult): Array<ActionRowBuilder<ButtonBuilder>> => {
    const messageActionRow = new ActionRowBuilder<ButtonBuilder>()
    for (const element of SongsData.result) {
        const button = new ButtonBuilder()
        button.setLabel(element.name).setStyle(ButtonStyle.Link).setURL(element.url)
        messageActionRow.addComponents(button)
    }

    return [messageActionRow]
}