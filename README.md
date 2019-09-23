# Slackmojis

### Prerequisites
[JQ](https://stedolan.github.io/jq/)
[Slack Emoji Tools](https://chrome.google.com/webstore/detail/slack-emoji-tools/anchoacphlfbdomdlomnbbfhcmcdmjej)
 
### Extracting Emojis

1. Login to your team: https://example.slack.com/customize/emoji
2. Run the following in your browser's Javascript console, usually under Dev Tools:

```
var emojis = $('.emoji_row');
var numEmojis = emojis.size();

var pre = document.createElement('pre');
pre.append('[\n');

emojis.each(function (index) {
  var url = $(this).find('td:nth-child(1) span').attr('data-original');
  var extension = url.substring(url.lastIndexOf('.'));
  var name = $(this).find('td:nth-child(2)').html().replace(/:|\s/g, '');
  pre.append(JSON.stringify({name: name, extension: extension, url: url}));
  if (index == (numEmojis-1)) {
    pre.append('\n]');
  } else {
    pre.append(',\n');
  }
});

$('body').append(pre);
```

3. Save the JSON output to a file for use in Step 4

### Downloading Emoji

4. Make the script executable and run it:
```
cd scripts
chmod +x download-emoji.sh
./download-emoji.sh slackmojis.json
```

The download may take several minutes depending on how many emojis are in the JSON. 

5. Once complete, you can drag and drop the emoji into the Bulk Emoji Uploader on your [https://example.slack.com/customize/emoji](https://example.slack.com/customize/emoji) page.