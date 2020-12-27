# general
c.url.start_pages = ["about:blank"]
config.set("colors.webpage.darkmode.enabled", True)
c.downloads.location.directory = '/home/sasha/Downloads'
c.completion.shrink = True
config.load_autoconfig()

# tabs, download
c.tabs.show = 'multiple'
c.tabs.position = "top"
c.downloads.position = "bottom"

# alias, binds, search
c.aliases = {'q':'quit', 'w':'session-save', 'wq':'quit --save', 'e':'open'} 
config.bind('<Ctrl-T>', 'open -t about:blank')
c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'ddg': 'https://duckduckgo.com/?q={}',
    'arw': 'https://wiki.archlinux.org/?search={}',
    'rdd': 'https://www.reddit.com/r/{}'
}
# Enable cookie, image, js & user agents
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://drive.google.com/*')

# theme
## Solarised #########
#color01 = "#002B36"
#color02 = "#073642"
#color03 = "#619100"
#color04 = "#268BD2"
#color05 = "#6C71C4"
#color06 = "#dc322f"
#color07 = "#FFFFFF"
#color08 = "#93A1A1"
#color09 = "#2AA198"
## Ntene16 ###########
color01 = "#262A2b"
color02 = "#1F2324"
color03 = "#98BE65"
color04 = "#008DCD"
color05 = "#C678DD"
color06 = "#FF6C6B"
color07 = "#FFFFFF"
color08 = "#CED4DA"
color09 = "#ECBE7B"
######################

c.colors.completion.category.bg = color01 
c.colors.completion.category.border.bottom = color02
c.colors.completion.category.border.top = color02
c.colors.completion.even.bg = color02
c.colors.completion.fg = color07
c.colors.completion.item.selected.bg = color01
c.colors.completion.item.selected.border.bottom = color01
c.colors.completion.item.selected.border.top = color01
c.colors.completion.item.selected.fg = color08
c.colors.completion.odd.bg = color02
c.colors.downloads.bar.bg = color01
c.colors.downloads.error.bg = color06
c.colors.downloads.start.bg = color03
c.colors.downloads.stop.bg = color04
c.colors.messages.info.bg = color01
c.colors.messages.info.border = color01
c.colors.messages.warning.border = color01
c.colors.statusbar.caret.bg = color01
c.colors.statusbar.command.bg = color01
c.colors.statusbar.insert.bg = color01
c.colors.statusbar.normal.bg = color01
c.colors.statusbar.passthrough.bg = color01
c.colors.statusbar.private.bg = color04
c.colors.statusbar.url.error.fg = color06
c.colors.statusbar.url.fg = color07
c.colors.statusbar.url.success.http.fg = color07 
c.colors.statusbar.url.success.https.fg = color07
c.colors.tabs.bar.bg = color02
c.colors.tabs.even.bg = color02
c.colors.tabs.indicator.error = color06
c.colors.tabs.indicator.start = color01
c.colors.tabs.indicator.stop = color01
c.colors.tabs.odd.bg = color02
c.colors.tabs.selected.even.bg = color01
c.colors.tabs.selected.even.fg = color02
c.colors.tabs.selected.odd.bg = color01
c.colors.tabs.selected.odd.fg = color02
