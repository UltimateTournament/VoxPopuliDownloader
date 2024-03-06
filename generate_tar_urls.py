LANGUAGES = [
    "en", "de", "fr", "es", "pl", "it", "ro", "hu", "cs", "nl", "fi", "hr",
    "sk", "sl", "et", "lt", "pt", "bg", "el", "lv", "mt", "sv", "da"
]

YEARS = list(range(2009, 2020 + 1))

DOWNLOAD_BASE_URL = "https://dl.fbaipublicfiles.com/voxpopuli"

urls = []

for l in LANGUAGES:
    for y in YEARS:
        urls.append(f"{DOWNLOAD_BASE_URL}/audios/{l}_{y}.tar")
        urls.append(f"{DOWNLOAD_BASE_URL}/audios/{l}_{y}_2.tar")

print('\n'.join(urls))