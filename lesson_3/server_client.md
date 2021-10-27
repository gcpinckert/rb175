# Server-side vs Client-side

For each of the following filetypes, indicate whether that filetype is considered server-side or client side and why.

- The **Gemfile** is server side. It allows the application to install and set up it's dependencies on the server so that application code can run.
- The **ruby files** that make up the application are server-side code. They consist of the logic that runs on the server to handle any incoming requests.
- The **stylesheets** (aka `.css` files) are client-side code. They determine how content will be presented and formatted in the browser when being rendered for the user.
- The **JavaScript Files** (aka `.js`) are client-side code. They add interactive events to the webpage displayed by the client that depend on a user's interaction.
- The **view templates**(aka `.erb`) are server-side code. The Ruby code within these files is executed on the server in order to generate the plain HTML code that will be sent with the HTTP responds to the client to be displayed. These are often referred to a _server-side templates_, because they must be processed on the server before being sent to the client. Client side templates, on the other hand, are used by JavaScript applications to render a template directly to the client, without it getting processed by a server.
