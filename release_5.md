# Release 5: Asynchronous Page Updates

### Learning Competencies

- Ability to make an `xhr` (AKA AJAX) request
- Ability to render `json` from a Rails Controller

### Summary

In this release we're going to improve our users experience by "[ajaxifying](https://en.wiktionary.org/wiki/Ajaxify)" some of our user actions. Before you start this release, these actions should work using classical forms or links with full page reloads. 

## Features

- As a user, when I create a new question, it should appear on the page right away and not reload the page
- As a user, when I answer a new question, it should appear on the page right away and not reload the page
- As a user, when I upvote or downvote a new question, it should not reload the page


## Reminders

- Always bind to the `submit` event of a `form` and never the `click` event of a submit button. 
