export type TargetService = 'spotify' | 'appleMusic' | 'youtubeMusic'

export interface SearchQuery {
    url: string
}

export interface SearchBaseResult {
    ok: boolean
}

export interface SearchResult extends SearchBaseResult {
    ok: boolean
    result: Array<PlatformLink>
}


export interface PlatformLink {
    name: string
    url: string
}
