import { PlatformLink, SearchQuery, SearchResult, } from "./types/search";
import axios from "axios";
import { SongLinkResponse } from "./types/SongLinkAPI";

export const getSongLinkData = async (searchQuery: SearchQuery): Promise<SearchResult> => {
    const songLinkApiEndpoint = "https://api.song.link/v1-alpha.1/links"
    const encodedurl = encodeURIComponent(searchQuery.url)
    const res = await axios.get(songLinkApiEndpoint, {
        params: {
            url: encodedurl,
            userCountry: "JP"
        }
    })

    if (!(res.status === 200)) {
        const result: SearchResult = {
            ok: false,
            result: []
        }
        return result
    }

    const songLinkdata: SongLinkResponse = res.data

    const linksArray: Array<PlatformLink> = []

    if (songLinkdata.linksByPlatform.spotify) {
        const _: PlatformLink = {
            name: 'Spotify',
            url: songLinkdata.linksByPlatform.spotify.url
        }
        linksArray.push(_)
    }

    if (songLinkdata.linksByPlatform.appleMusic) {
        const _: PlatformLink = {
            name: 'Apple Music',
            url: songLinkdata.linksByPlatform.appleMusic.url
        }
        linksArray.push(_)
    }

    if (songLinkdata.linksByPlatform.youtubeMusic) {
        const _: PlatformLink = {
            name: 'Youtube Music',
            url: songLinkdata.linksByPlatform.youtubeMusic.url
        }
        linksArray.push(_)
    }

    const result: SearchResult = {
        ok: true,
        result: linksArray
    }

    return result

}