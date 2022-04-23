import requests


def get_music_data(url) -> list:
    SONGLINK_ENDPOIT = "https://api.song.link/v1-alpha.1/links"
    req = requests.get(SONGLINK_ENDPOIT, params={
                       "url": url, "userCountry": "JP"})
    data = req.json()
    result: list = []
    try:
        result.append(
            {
                "service": "Spotify",
                "url": data['linksByPlatform']['spotify']['url']
            }
        )
        result.append(
            {
                "service": "AppleMusic",
                "url": data["linksByPlatform"]["appleMusic"]["url"]
            }
        )
    except KeyError:
        pass
    finally:
        if len(result) == 0:
            raise MusicNotFoundError

    return result


class MusicNotFoundError(Exception):
    pass
