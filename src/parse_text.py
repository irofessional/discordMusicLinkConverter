import re
from urllib import parse


def parse_text(message_text: str) -> str:
    regex_list: list = [
        r'(https?://music\.apple\.com/jp/album/[\w\-\%]+/[\d]+)',
        r'(https?://music\.apple\.com/jp/artist/[\w\-\%]+/[\d]+)',
        r'(https?://open\.spotify\.com/album/[\w]+)',
        r'(https?://open\.spotify\.com/artist/[\w]+)',
        r'(https?://open\.spotify\.com/track/[\w]+)',
    ]

    for i in regex_list:
        result = re.search(i, message_text)
        if result:
            return parse.quote(result.group(), safe="")
    raise MusicUrlNotContain


class MusicUrlNotContain(Exception):
    pass
