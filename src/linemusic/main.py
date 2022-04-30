import requests


class LineMusic():
    def __init__(self) -> None:
        pass

    def _get(self, url):
        pass

    def get_share_url(self, id):
        pass

    def search_artist(self, search_query):
        pass

    def search_album(self, search_query):
        pass

    def search_track(self, search_query):
        pass


class DataNotFound(Exception):
    pass
