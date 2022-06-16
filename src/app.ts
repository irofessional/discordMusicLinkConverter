import { Client, ClientOptions, Intents } from "discord.js"
import { messageHandler } from "./messageHander"


const discordOptions: ClientOptions = {
    intents: [
        Intents.FLAGS.GUILD_MESSAGES,
        Intents.FLAGS.GUILDS
    ]
}

const aaa: string = "s"

const client = new Client(discordOptions)

client.on('message', messageHandler)

try {
    client.login(process.env.DISOCORD_TOKEN)
} catch (e) {
    console.error(e)
}