export const userMessagePaser = (messageText: string): string | null => {
    const urlRegexList = [
        /(https?:\/\/music\.apple\.com\/jp\/album\/[\w\-\%]+\/[\d]+)/,
        /(https?:\/\/music\.apple\.com\/jp\/artist\/[\w\-\%]+\/[\d]+)/,
        /(https?:\/\/open\.spotify\.com\/album\/[\w]+)/,
        /(https?:\/\/open\.spotify\.com\/artist\/[\w]+)/,
        /(https?:\/\/open\.spotify\.com\/track\/[\w]+)/,
    ]

    for (const element of urlRegexList) {
        const match = messageText.match(element)
        if (match) {
            return match[0]
        }
    }

    return null
    
}
