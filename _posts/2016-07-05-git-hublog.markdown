---
layout: post
title:  "git hublog"
date:   2016-07-05 01:30:00
tags: [git, node.js, curses, terminal]
---
Sneak peak of git hublog project!

{% responsive_image path: assets/hublog1.gif %}

I am trying to build better and interactive git logs in command line using [blessed](https://github.com/chjj/blessed). Inspiration has been github's activity stream.

`git hublog` is a replacement for `git log`. When you run `git hublog`, you get a TUI(Text User Interface) like in the GIF. From there, you could click on a cell representing a day and get commits merged on that day. You could also use standard git log filters interactively, so you could say `:--grep=PMP` and filter only  commits related to apollo project on interactive activity stream.

UPDATE: I have been chunking away at this. It looks and works like below

{% responsive_image path: assets/hublog2.gif %}

