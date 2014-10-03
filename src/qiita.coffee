Resource = require "./resource"

class Qiita extends Resource
  GET    = "get"
  POST   = "post"
  PUT    = "put"
  DELETE = "delete"
  PATCH  = "patch"

  RESOURCES =
    comments:
      path: "/comments/:id"
      methods: [GET, PATCH, DELETE]
      resource:
        thank:
          path: "/thank"
          methods: [PUT, DELETE]
    items:
      path: "/items/:item_id"
      methods: [GET, POST, PATCH, DELETE]
      resources:
        comments:
          path: "/comments"
          methods: [GET, POST]
        stock:
          path: "/stock"
          methods: [PUT, DELETE]
    tags:
      path: "/tags/:id"
      resources:
        items:"/items"
    templates:
      path: "/templates/:id"
      methods: [GET, POST, PATCH, DELETE]
    projects:
      path: "/projects/:id"
      methods: [GET, POST, PATCH, DELETE]
    users:
      path: "/users/:id"
      resources:
        following_tags: "/following_tags"
        followees: "/followees"
        followers: "/followers"
        items: "/items"
        stocks: "/stocks"
    expanded_templates: "/expanded_templates"
    authenticated_user: "/authenticated_user"
  constructor: (config = {}) ->
    host = if config.team? then "#{config.team}.qiita.com" else "qiita.com"
    super
      token: config.token
      path: "https://#{host}/api/v2"
      resources: RESOURCES

module.exports = Qiita
