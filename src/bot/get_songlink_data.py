import requests


def get_songlink_data(url) -> list:
    SONGLINK_ENDPOIT: str = "https://api.song.link/v1-alpha.1/links"
    SUBSCRIPTION_LIST: list[str] = [
        'spotify',
        'appleMusic',
        'youtubeMusic'
    ]
    req = requests.get(SONGLINK_ENDPOIT, params={
                       "url": url, "userCountry": "JP"})
    data = req.json()
    result: list = []
    for i in SUBSCRIPTION_LIST:
        try:
            result.append(
                {
                    "service": i,
                    "url": data["linksByPlatform"][i]["url"]
                }
            )
        except KeyError:
            continue

    if len(result) == 0:
        raise MusicNotFoundError

    return result


class MusicNotFoundError(Exception):
    pass
