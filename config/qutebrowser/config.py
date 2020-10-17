## Generall
c.url.start_pages = ["https://www.google.com"]    # Start page
config.load_autoconfig()                          # Load

c.downloads.location.directory = '/home/sasha/Загрузки'     # Download folder
c.tabs.show = 'multiple'                                    # When to show the tab bar. [always, never, multiple ,switching]

config.set("colors.webpage.darkmode.enabled", True)                 # Dark mode on all site

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')  # Accept to cookie
config.set('content.cookies.accept', 'all', 'devtools://*')         # Accept to cookie

config.set('content.images', True, 'chrome-devtools://*')           # Auto load images
config.set('content.images', True, 'devtools://*')                  # Auto load images

config.set('content.javascript.enabled', True, 'chrome-devtools://*') # Enable JavaScript
config.set('content.javascript.enabled', True, 'devtools://*')        # Enable JavaScript
config.set('content.javascript.enabled', True, 'chrome://*/*')        # Enable JavaScript
config.set('content.javascript.enabled', True, 'qute://*/*')          # Enable JavaScript


## User agent
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://drive.google.com/*')


## Search engines which can be used via the address bar.
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'archw': 'https://wiki.archlinux.org/?search={}',
    'google': 'https://www.google.com/search?q={}',
    'reddi': 'https://www.reddit.com/r/{}'
}


## Aiases
c.aliases = {
    'q': 'quit',
    'w': 'session-save',
    'wq': 'quit --save'
}

## Tabs
c.tabs.position = "bottom"
c.completion.shrink = True



