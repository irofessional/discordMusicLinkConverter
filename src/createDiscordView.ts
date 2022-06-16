import { MessageActionRow, MessageButton } from "discord.js";
import { SearchResult } from "./types/search";

export const createDiscordComponents = (SongsData: SearchResult): Array<MessageActionRow> => {
    const messageActionRow: MessageActionRow = new MessageActionRow()
    for (const element of SongsData.result) {
        const button: MessageButton = new MessageButton()
        button.setLabel(element.name).setStyle('LINK').setURL(element.url)
        messageActionRow.addComponents(button)
    }

    return [messageActionRow]
}