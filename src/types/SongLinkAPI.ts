type SongLinkMusicPlatform = 'spotify' | 'itunes' | 'appleMusic' | 'youtube' |
    'youtubeMusic' | 'google' | 'googleStore' | 'pandora' |
    'deezer' | 'tidal' | 'amazonStore' | 'amazonMusic' |
    'soundcloud' | 'napster' | 'yandex' | 'spinrilla'

type SongLinkAPIProvider = 'spotify' | 'itunes' | 'youtube' | 'google' |
    'pandora' | 'deezer' | 'tidal' | 'amazon' |
    'soundcloud' | 'napster' | 'yandex' | 'spinrilla';

interface PlatformLinkDetail {
    url: string
    entityUniqueId: string
    country?: string
    nativeAppUriMobile?: string
    nativeAppUriDesktop?: string
}

interface entitiesByUniqueIdDetail {
    id: string
    type: 'song' | 'album'
    title?: string
    artistName?: string
    thumbnailUrl?: string
    thumbnailWidth?: number
    thumbnailHeight?: number
    apiProvider: SongLinkAPIProvider
    platforms: Array<SongLinkAPIProvider>
}

type linksByPlatform = Record<SongLinkMusicPlatform, PlatformLinkDetail>

type entitiesByUniqueId = Record<string, entitiesByUniqueIdDetail>

interface SongLinkResponse {
    entityUniqueId: string
    entitiesByUniqueId: entitiesByUniqueId
    linksByPlatform: linksByPlatform
    userCountry: string
}