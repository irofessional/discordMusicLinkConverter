import { Client, ClientOptions, Intents } from "discord.js"
import { messageHandler } from "./messageHandler"


const discordOptions: ClientOptions = {
    intents: [
        Intents.FLAGS.GUILD_MESSAGES,
        Intents.FLAGS.GUILDS
    ]
}

const client = new Client(discordOptions)

client.on('messageCreate', messageHandler)

const main = () => {
    if (!process.env.DISCORD_TOKEN) {
        console.error({ message: "Discord token is not set." })
        process.exit(1)
    }

    if (!process.env.DISCORD_ID) {
        console.error({ message: "Target channel, category or guild id is not set." })
        process.exit(1)
    }

    try {
        client.login(process.env.DISOCORD_TOKEN)
    } catch (e) {
        console.error({ message: e })
        process.exit(1)
    }

}

main()