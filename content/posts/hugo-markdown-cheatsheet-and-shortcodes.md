---
title: Hugo Markdown Cheatsheet and Shortcodes
date: 2019-11-14T20:34:55-05:00
draft: false
description: Hugo Markdown Cheatsheet and Shortcodes
keywords: markdown, cheatsheet, tutorial, hugo, blog
toc: false
tags:
  - markdown
  - cheatsheet
  - tutorial
  - hugo
  - blog
categories:
  - tutorial
---

If you're not a [Markdown](https://www.markdownguide.org/) expert yet, this post is for you.  
I find myself Googling simple Markdown syntax everytime, so this post is for me as well. Since I'll be writing a decent amount of Markdown for this website, I thought I'd put together a cheatsheet I can reference anytime.  

I'm also adding some [Hugo shortcodes](https://gohugo.io/content-management/shortcodes) at the end as a bonus.  

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


For H1 and H2 you can also use two different types of uderlines:

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
Italics, with *asterisks* or _underscores_.
```
Italics, with *asterisks* or _underscores_.

```
Bold with **asterisks** or __underscores__.
```
Bold with **asterisks** or __underscores__.

```
Combined **bold and _bold italics_**.
```
Combined **bold and _bold italics_**.

```
~~Strikethrough~~
```
~~Strikethrough~~

<br>

## Lists

### Ordered

```
1. First item.
2. Second item.
1. First item again, or third?
6. Actual numbers don't matter, it just has to be a number.
```
1. First item.
2. Second item.
1. First item again, or third?
6. Actual numbers don't matter, it just has to be a number.

### Unordered

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
URLs and <URLs> will automatically become links.  
http://www.example.com or <http://www.example.com> and sometimes 
example.com (but not on Hugo, for example).
```
URLs and \<URLs\> will automatically become links.  
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
    var s = "Hello World!";
    console.log(s);
    ```
```
```javascript
    var s = "Hello World!";
    console.log(s);
```

<br>

Python
```
    ```python
    def hello_world():
        s = "Hello World!"
    hello_world()
    ```
```
```python
def hello_world():
    s = "Hello World!"
hello_world()
```

<br>

No language
```
    ```
    No language indicated, so no syntax highlighting.
    Still looks nice.
    ```
```
```
No language indicated, so no syntax highlighting.
Still looks nice.
```

Pro tip: in order to escape the backtick ` use 4 spaces before your code.

<br>

## Tables

Colons can be used to align columns.

```
| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| the cake      | is a lie      | $1600 |
| the answer    | 42            |   $12 |
| more words    | hell yeah     |    $1 |
```

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| the cake      | is a lie      | $1600 |
| the answer    | 42            |   $12 |
| more words    | hell yeah     |    $1 |

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
> Blockquotes look like something very important.
> Here is more important text on a different line.
```

> Blockquotes look like something very important.
> Here is more important text on a different line.


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

<br>

Thanks to [Adam's markdown-here wiki](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet), which was the inspiration for this post.

<br>
