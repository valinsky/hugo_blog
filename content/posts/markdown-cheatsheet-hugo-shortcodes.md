---
title: Markdown Cheatsheet and Hugo Shortcodes
date: 2019-11-14T20:34:55-05:00
draft: false
description: Markdown Cheatsheet and Hugo Shortcodes
keywords: hugo, markdown, cheatsheet
toc: false
tags:
  - markdown
  - cheatsheet
  - tutorial
  - hugo
categories:
  - tutorial
---

Everytime I end up writing [Markdown](https://www.markdownguide.org/) I find myself Googling even the simplest syntax, and since I need to write a lot of it for this site, I thought I'd put together a minimal cheatsheet for every Markdown noob out there, including myself.  
Kudos to [Adam's markdwon-here wiki](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet), from which I was heavily inspired.

I'm also adding some [Hugo shortcodes](https://gohugo.io/content-management/shortcodes) because I'll be using those pretty often as well.  
<br>


## Markdown Cheatsheet

<br>

## Headers

```
# H1
```
# H1
```
# H2
```
## H2
```
# H3
```
### H3
```
# H4
```
#### H4
```
# H5
```
##### H5
```
# H6
```
###### H6


Alternatively, for H1 and H2, there are two different underlines:

```
Alt-H1
======
```
Alt-H1
======

```
Alt-H2
------
```
Alt-H2
------

<br>

## Emphasis

```
Emphasis, aka italics, with *asterisks* or _underscores_.
```
Emphasis, aka italics, with *asterisks* or _underscores_.

```
Strong emphasis, aka bold, with **asterisks** or __underscores__.
```
Strong emphasis, aka bold, with **asterisks** or __underscores__.

```
Combined emphasis with **asterisks and _underscores_**.
```
Combined emphasis with **asterisks and _underscores_**.

```
Strikethrough uses two tildes. ~~Scratch this.~~
```
Strikethrough uses two tildes. ~~Scratch this.~~

<br>

## Lists

```
1. First ordered list item
2. Another item
1. Actual numbers don't matter, just that it's a number
4. And another item.
```
1. First ordered list item
2. Another item
1. Actual numbers don't matter, just that it's a number
4. And another item.


```
* Unordered list can use asterisks
- Or minuses
+ Or pluses
```
* Unordered list can use asterisks
- Or minuses
+ Or pluses

<br>

## Links

```
[Link](https://valinsky.com)
```
[Link](https://valinsky.com)


```
URLs and URLs in angle brackets will automatically get turned into links. 
http://www.example.com or <http://www.example.com> and sometimes 
example.com (but not on Github, for example).
```
URLs and URLs in angle brackets will automatically get turned into links. 
http://www.example.com or <http://www.example.com> and sometimes 
example.com (but not on Hugo, apparently).

<br>

## Images

Here's my favicon (hover to see the title text):
```
![favicon](https://valinsky.me/android-chrome-192x192.png "Valinsky favicon text")
```
![favicon](https://valinsky.me/android-chrome-192x192.png "Valinsky favicon text")

<br>

## Code and Syntax Highlighting
```
Inline `code` has `back-ticks around` it.
```
Inline `code` has `back-ticks around` it.

<br>

JavaScript
```
    ```javascript
    var s = "JavaScript syntax highlighting";
    alert(s);
    ```
```
```javascript
    var s = "JavaScript syntax highlighting";
    alert(s);
```

<br>

Python
```
    ```python
    s = "Python syntax highlighting"
    print s
    ```
```
```python
s = "Python syntax highlighting"
print s
```

<br>

No language
```
    ```
    No language indicated, so no syntax highlighting. 
    But let's throw in a <b>tag</b>.
    ```
```
```
No language indicated, so no syntax highlighting. 
But let's throw in a <b>tag</b>.
```

Pro tip: in order to escape the backtick ` use 4 spaces before your code.

<br>

## Tables

Colons can be used to align columns.

```
| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
```

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the 
raw Markdown line up prettily. You can also use inline Markdown.

```
Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3
```

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3

<br>

## Blockquotes

```
> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.
```

> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.


```
> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.
```

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.

<br>

## Inline HTML

```
It *might* work

<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>
```

It *might* work

<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>

<br>

## Horizontal Rule
```
Three or more...

---
```

Three or more...

---

```
Hyphens

***
```

Hyphens

***

```
Asterisks

___
```

Asterisks

___

<br>

## Line Breaks

```
Here's a line for us to start with.

This line is separated from the one above by two newlines, so it will be a *separate paragraph*.

This line is also a separate paragraph, but...
This line is only separated by a single newline, so it's a separate line in the *same paragraph*.  
But again, this line is separated by a single newline, but the above paragraph has to spaces at the end.
```

Here's a line for us to start with.

This line is separated from the one above by two newlines, so it will be a *separate paragraph*.

This line is also a separate paragraph, but...
This line is only separated by a single newline, so it's a separate line in the *same paragraph*.  
But again, this line is separated by a single newline, but the above paragraph has to spaces at the end.

<br>

## Hugo shortcodes

<br>

## YouTube Videos

```
{{</* youtube id="h2FxSRZcYX0" */>}}
```

{{< youtube id="h2FxSRZcYX0" >}}

<br>

## Image

```
{{</* figure src="https://valinsky.me/android-chrome-192x192.png" title="Valinsky favicon" caption="Valinsky favicon" */>}}
```

{{< figure src="https://valinsky.me/android-chrome-192x192.png" title="Valinsky favicon" caption="Valinsky favicon" >}}

<br>

## GitHub Gist

```
{{</* gist valinsky be83a3cba70f4faeb0f410423821b6de */>}}
```

{{< gist valinsky be83a3cba70f4faeb0f410423821b6de >}}

<br>

## Highlight

```
{{</* highlight html */>}}
<section id="main">
  <div>
   <h1 id="title">{{ .Title }}</h1>
    {{ range .Pages }}
        {{ .Render "summary"}}
    {{ end }}
  </div>
</section>
{{</* /highlight */>}}
```

{{< highlight html >}}
<section id="main">
  <div>
   <h1 id="title">{{ .Title }}</h1>
    {{ range .Pages }}
        {{ .Render "summary"}}
    {{ end }}
  </div>
</section>
{{< /highlight >}}

<br>

## Instagram image

```
{{</* instagram B2_vxasjdVW */>}}
```

{{< instagram B2_vxasjdVW >}}

<br>

## Twitter

```
{{</* tweet 1092548467409539072 */>}}
```

{{< tweet 1092548467409539072 >}}
