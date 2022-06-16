export type TargetService = 'spotify' | 'appleMusic' | 'youtubeMusic'

export interface SearchQuery {
    url: string
}

export interface SearchResult {
    ok: boolean
    foundPlatforms: Array<PlatformLink>
}

export interface PlatformLink {
    name: string
    url: string
}