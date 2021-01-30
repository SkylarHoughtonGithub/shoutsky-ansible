#!/usr/bin/env python3.6

import feedparser
feedparser._HTMLSanitizer.acceptable_elements.update(['iframe'])

#Keywords to search for in the rss feed
key_words = ['Chrome','Tomcat','linux','windows']

# get the urls we have seen prior
f = open('viewed_urls.txt', 'r')
urls = f.readlines()
urls = [url.rstrip() for url in urls]
f.close()

def contains_wanted(in_str):
    #returns true if the in_str contains a keyword
    # we are interested in. Case-insensitive
    for wrd in key_words:
        if wrd.lower() in in_str:
            return True
    return False

def url_is_new(urlstr):
    # returns true if the url string does not exist
    # in the list of strings extracted from the text file
    if urlstr in urls:
        return False
    else:
        return True

feed = feedparser.parse('https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss.xml')
for key in feed["entries"]:
    title = key['title']
    url = key['links'][0]['href']
#    summary = key['summary']
    description  = key['description']

#formats and outputs the specified rss fields
    if contains_wanted(title.lower()) and contains_wanted(description.lower()) and url_is_new(url):
        print('{} - {} - {}\n'.format(title, url, description))

#appends reoccurring rss feeds in the viewed_urls file
        with open('viewed_urls.txt', 'a') as f:
            f.write('{}\n'.format(title,url))
