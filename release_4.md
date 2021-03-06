# Release 4: Server-Side API Interaction

### Learning Competencies

- Ability to integrate with an API from scratch (not using a gem)

### Summary

For this release, you'll be adding a simple API interaction to your site. Using the `https://api.github.com/zen` endpoint, your application should display a random quote whenever a user visits the homepage.

Is this a contrived usage of an API for this site? Sure. Use this as an opportunity to make conscious decisions about architecture, exception handling, and configuration.

First, get your interaction with the API working. This particular endpoint is not included in the GitHub [Octokit gem](https://github.com/octokit/octokit.rb), nor is it particularly well documented. You'll need to use [the HTTParty gem](https://github.com/jnunemaker/httparty) to make requests to the API.

Secondly, make sure your implementation will withstand your application being rate-limited. In that case, it should return a random quote from a random collection hard-coded in your application.

And finally, you should use your [GitHub username and password to authenticate your requests](https://developer.github.com/v3/auth/#basic-authentication), which will raise your request ceiling to 5000 requests an hour. Be sure not to push your authentication data to GitHub, and instead use [the dotenv gem](https://github.com/bkeepers/dotenv) and Rails initializers to hide that information.

If you decided not to test-drive this feature, be sure to wrap the feature in tests before merging code to master. [Use the Webmock library](https://github.com/bblimke/webmock) to stub out requests to external servers in your testing environment. You will also have to stub out your API calls in your relevant controller and feature tests.

## Tasks

0. Implement the following features:
  0. As a user, when I visit the homepage, I should see a random quote

## Hints

- If your application cannot access the GitHub API (for instance, if you have become rate limited), a user will see a quote pre-defined in your Rails app.
- Put your github username & password into your `.env` file
