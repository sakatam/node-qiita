request = require "request"
_       = require "underscore"

class Resource
  constructor: ({@path, @token, methods, resources}) ->
    resources or= []
    _.each resources, (opts, name) =>
      opts = { path: opts } if _.isString opts
      path = @path + opts.path
      token = @token
      @[name] = new Resource { path, token, methods: opts.methods, resources: opts.resources }

    methods or= ["get"]
    _.each methods, (method) =>
      @[method] = @buildMethod method

  buildMethod: (method) ->
    (params, cb) =>
      if _.isFunction params
        cb = params
        params = {}

      path = @path
      _.each params, (val, key) ->
        if path.match /// :#{key} ///
          path = path.replace /// :#{key} ///, val
          delete params[key]
      # remove unmatched placeholders
      path = path.replace /// /:\w+ ///, ""

      options = { method: method, url: path }

      if method is Resource.methods.GET
        options.qs = params
      else
        options.json = params

      options.auth = { bearer: @token } if @token?

      request options, cb
      null

  @methods:
    GET    : "get"
    PUT    : "put"
    POST   : "post"
    PATCH  : "patch"
    DELETE : "delete"

module.exports = Resource
